/*
# Copyright (C) 2020 David Pye davidmpye@gmail.com
# This file is part of the OLED compatibility project targetted at
# Pure Radios Evoke Flow models
#
# This project is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# It is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this project.  If not, see <http://www.gnu.org/licenses/>.
*/

#include "libopencm3/stm32/rcc.h"
#include "libopencm3/stm32/gpio.h"
#include "libopencm3/stm32/usart.h"
#include "libopencm3/stm32/spi.h"
#include <libopencm3/stm32/dma.h>
#include "libopencm3/cm3/nvic.h"
#include "libopencm3/stm32/exti.h"
#include "ssd1305.h"
#include "pins.h"

//Note VCC supplied by radio is 14.55volts.
//1.15MOhm therefore should be the IREF current resistor
//The radio seems to use 1.5MOHm tho... 

//#define USB_DEBUG

//Our framebuffer
volatile uint8_t framebuffer[128*8];
//The current address offset within the fb
volatile unsigned int fb_offset = 0;
//Whether the fb has changed
volatile bool fb_updated = false;
volatile bool dmaComplete = true;
volatile bool pageChanged[8];

volatile bool displayOn = true;

volatile uint8_t page, col; //used to calculate/store framebuffer offset

volatile brightness = 0; //Display brightness = 0->10

#ifdef USB_DEBUG
//Cmd buffer for dumping to USB for debug purposes	
#define DEBUG_BUFFER_LEN 64
uint8_t cmdbuffer[DEBUG_BUFFER_LEN];
int cmdsrx =0;
#endif

//used to store what the command interpreter state is
typedef enum  CMD_STATE {
        CMD_AWAITING,
        CMD_RECEIVED,
        CMD_MULTIBYTE_IN_PROGRESS
} CMD_STATE ;


//Function prototypes

static void initUSART(void);
static void initSPI(void);

void handleCommand(uint8_t *bytes, uint8_t len);
void handleCmdByte(uint8_t byte);
void handleDataByte(uint8_t byte);
void init(void);
int main(void);

#ifdef USB_DEBUG
void usartSend(char *);
char *toHex(uint8_t);
#endif

#ifdef USB_DEBUG
static void initUSART() {
    rcc_periph_clock_enable(RCC_USART1);	
	// Just set up TX for now, RX pin will require more work!
	gpio_set_mode(GPIOA, GPIO_MODE_OUTPUT_50_MHZ, GPIO_CNF_OUTPUT_ALTFN_PUSHPULL, GPIO_USART1_TX);
	usart_set_baudrate(USART1, 115200);
	usart_set_databits(USART1, 8);
	usart_set_stopbits(USART1, USART_STOPBITS_1);
	usart_set_mode(USART1, USART_MODE_TX);
	usart_set_parity(USART1, USART_PARITY_NONE);
	usart_set_flow_control(USART1, USART_FLOWCONTROL_NONE);
	/* Finally enable the USART. */
	usart_enable(USART1);
}
#endif

static void initSPI() {
    rcc_periph_clock_enable(RCC_SPI1);	
	//NSS = PA4, SCK = PA5, MISO = PA6, MOSI=PA7
	gpio_set_mode( GPIOA, GPIO_MODE_OUTPUT_50_MHZ, GPIO_CNF_OUTPUT_ALTFN_PUSHPULL, GPIO4 | GPIO7 | GPIO5 | GPIO6 ); //SPI_NSS
	spi_reset(SPI1);

	spi_init_master(
        	SPI1,
        	SPI_CR1_BAUDRATE_FPCLK_DIV_256,
        	SPI_CR1_CPOL_CLK_TO_0_WHEN_IDLE,
        	SPI_CR1_CPHA_CLK_TRANSITION_2,
			SPI_CR1_DFF_8BIT,
        	SPI_CR1_MSBFIRST
    );

	//rx interrupt on
	nvic_set_priority(NVIC_SPI1_IRQ, 0);
	nvic_enable_irq(NVIC_SPI1_IRQ);

	spi_enable_rx_buffer_not_empty_interrupt(SPI1);

	//Slave mode on.
	spi_set_slave_mode(SPI1);
	
	spi_enable(SPI1);

	//SPI 2 - will run in master mode to send data to OLED display
	rcc_periph_clock_enable(RCC_SPI2);	
	//NSS = 12(not used), SCK = 13, MISO = 14(not used), MOSI = 15
	gpio_set_mode( GPIOB, GPIO_MODE_OUTPUT_50_MHZ, GPIO_CNF_OUTPUT_ALTFN_PUSHPULL, GPIO13 | GPIO14 | GPIO15);
	spi_reset(SPI2);
		/* Explicitly disable I2S in favour of SPI operation */
	SPI2_I2SCFGR = 0;
	
	spi_init_master(
        	SPI2,
        	SPI_CR1_BAUDRATE_FPCLK_DIV_256,
        	SPI_CR1_CPOL_CLK_TO_0_WHEN_IDLE,
        	SPI_CR1_CPHA_CLK_TRANSITION_1,
			SPI_CR1_DFF_8BIT,
        	SPI_CR1_MSBFIRST
		);
	
	spi_enable_software_slave_management(SPI2);
  	spi_set_nss_high(SPI2);
	
	spi_enable(SPI2);
}

void initDMA() {
    // Enable DMA clock
    rcc_periph_clock_enable(RCC_DMA1);
    // In order to use SPI2_TX, we need DMA 1 Channel 5
    dma_channel_reset(DMA1, DMA_CHANNEL5);
	// SPI2 data register as output
    dma_set_peripheral_address(DMA1, DMA_CHANNEL5, (uint32_t)&SPI2_DR);
    // We will be using system memory as the source data
    dma_set_read_from_memory(DMA1, DMA_CHANNEL5);
    // Memory increment mode needs to be turned on, so that if we're sending
    // multiple bytes the DMA controller actually sends a series of bytes,
    // instead of the same byte multiple times.
    dma_enable_memory_increment_mode(DMA1, DMA_CHANNEL5);
    // Contrarily, the peripheral does not need to be incremented - the SPI
    // data register doesn't move around as we write to it.
    dma_disable_peripheral_increment_mode(DMA1, DMA_CHANNEL5);
    // We want to use 8 bit transfers
    dma_set_peripheral_size(DMA1, DMA_CHANNEL5, DMA_CCR_MSIZE_8BIT );
    dma_set_memory_size(DMA1, DMA_CHANNEL5, DMA_CCR_MSIZE_8BIT );
    // We don't have any other DMA transfers going, but if we did we can use
    // priorities to try to ensure time-critical transfers are not interrupted
    // by others. In this case, it is alone.
    dma_set_priority(DMA1, DMA_CHANNEL5, DMA_CCR_PL_LOW);
    // Since we need to pull the register clock high after the transfer is
    // complete, enable transfer complete interrupts.
    dma_enable_transfer_complete_interrupt(DMA1, DMA_CHANNEL5);
	//This interrupt needs to be lower priority than the SPI receive interrupt,
	//otherwise we glitch and lose data
    nvic_set_priority(NVIC_DMA1_CHANNEL5_IRQ, 50);
    nvic_enable_irq(NVIC_DMA1_CHANNEL5_IRQ);
}


void dmaTransferToScreen(uint8_t page) {
	dmaComplete = false;
	//Get the display ready to receive the data
	SSD1305_preDmaTransfer(page);

	//set starting offset of transfer
	dma_set_memory_address(DMA1, DMA_CHANNEL5, (uint32_t)&framebuffer[128*page]);
	//128 bytes for this row of the framebuffer
    dma_set_number_of_data(DMA1, DMA_CHANNEL5, 128);
	
	//dma on
    dma_enable_channel(DMA1, DMA_CHANNEL5);
	
	//start DMA transfer
	spi_enable_tx_dma(SPI2);
}


void dma1_channel5_isr() {
    // Check that we got triggered because the transfer is complete, by
    // checking the Transfer Complete Interrupt Flag
	if (dma_get_interrupt_flag(DMA1, DMA_CHANNEL5, DMA_TCIF)) {
		//reset flag register.
        dma_clear_interrupt_flags(DMA1, DMA_CHANNEL5, DMA_TCIF);
		//wait until transfer complete
	    spi_disable_tx_dma(SPI2);
        dma_disable_channel(DMA1, DMA_CHANNEL5);
		while (!(SPI_SR(SPI2) & SPI_SR_TXE)) {
			//Wait for transfer to start
		}

		while ((SPI_SR(SPI2) & SPI_SR_BSY)) {
			//Wait for transfer to finish
		}

		SSD1305_postDmaTransfer(0); //Page irrelevant.

	for (int i=0; i<1000; ++i) __asm__("NOP");

        // Turn our DMA channel back off, in preparation of the next transfer

		dmaComplete = true;
    }

}

void spi1_isr() {
	//Hopefully this has gone off because a byte has arrived..
	uint8_t byte = spi_read(SPI1);
	//gpio11 high = data
	if ( !gpio_get(GPIOA, GPIO11)) {
		handleCmdByte(byte);
	}
	else handleDataByte(byte);
}

#ifdef USB_DEBUG
//NB not thread safe...
char hexbuf[3]; //AA<NULL>
char *toHex(uint8_t buf) {
    const char * hex = "0123456789ABCDEF";
    hexbuf[0] = hex[(buf>>4) & 0xF];
    hexbuf[1] = hex[ buf & 0xF];
    hexbuf[2] = 0x00;
    return hexbuf;
}
#endif

void handleCommand(uint8_t *bytes, uint8_t len) {
	bool addrFound =  false;
	static uint8_t DBval = 0x00;

	if (len == 1) {
		if (bytes[0] == 0xAF) {
  			SSD1305_enableDisplay(true);
			displayOn = true;
		}
		else if (bytes[0] == 0xAE) {
			SSD1305_enableDisplay(false);
			displayOn = true;
		}
		else if ( (bytes[0] & 0xF0) == 0xB0) {
			//page cmd
			page = bytes[0]&0x0F;
			//specified page must be <=7
			if (page > 7) page = 0;
			addrFound = true;
		}
		else if ((bytes[0] & 0xF0) == 0x10) {			
			col &=0x0F;
			col |= ((bytes[0]&0x0F)<<4);
			addrFound = true;
		}
		else if ( (bytes[0] & 0xF0) == 0x00) {
            //collow
			col &= 0xF0;
            col |=  (bytes[0]&0x0F) ;
			addrFound = true;
		}

		//Check to see if we've received an address command - if so,update the FB cursor
		if (addrFound) {
			fb_offset =  (page*128) + col;
			//Don't try to trick us to write off the end of the buffer...
			//-4 corrects an offset because of the original display being wired 'backwards', and the ssd1305 
			//gdram buffer being 132byte not 128.

			if (fb_offset >= 4) fb_offset -=4;
			if (fb_offset >= 128*8) fb_offset = 0;
		}
	}
	else if (len == 2) {
		//The 2 byte commands we want to handle relate to brightness.
		if (bytes[0] == 0x81) {
			switch (bytes[1]) {
				case 0x00:
				    //Could be 1 OR 2...
					//you can tell be looking at db: 00 for brightness 1, it is 08 for brightness 2		
					if (DBval == 0x00) {
						brightness = 1;
					}
					else {
						brightness = 2;
					}
					break;
				case 0x10:
					brightness = 3;
					break;
				case 0x20:
					brightness = 4;
					break;
				case 0x30:
					brightness = 5;
					break;
				case 0x40:
					brightness = 6;
					break;
				case 0x50:
					brightness = 7;
					break;
				case 0x70:
					brightness = 8;
					break;
				case 0x80:
					brightness = 9;
					break;
				case 0xb0:
					brightness = 10;
					break;
			}
			SSD1305_setBrightness(brightness);
		}
		else if (bytes[0] == 0xDB) {
			//We need to store this value to work out what the brightness is as levels 1 and 0 both have the 
			//same 0x81 value
			DBval = bytes[1];
		}
	}
	
	/*
	
	
	else {
#ifdef USB_DEBUG
        //It is an unhandled command. Let's print it
		for (int i=0; i<len; ++i) {
			cmdbuffer[cmdsrx] = bytes[i];
			cmdsrx++;
			if (cmdsrx == DEBUG_BUFFER_LEN) {
				for (int i=0; i<DEBUG_BUFFER_LEN; ++i) {
					usartSend(toHex(cmdbuffer[i]));
                	usartSend("  ");
					if (i!=0 && i%32==0) usartSend("\r\n");
			}
			cmdsrx =0;
			}
		}
#endif
	}*/	
}



void handleCmdByte(uint8_t byte) {
	//A command byte has arrived.
	//The interpreter has to be stateful, as some commands are multibyte
	//(in fact, the scroll commands are up to 5), so we need to keep track
	//of our state, and interpret the command as a whole once it's arrived.
	//Actually, we only handle up to 2-byte commands (the brightness ones!)
	//and the others seem to be either completely unused (or just part of the
	//initial power-on init string, and not something we need to understand.

	//When the complete command has been received, it will be passed to handleCmd()
 
	static  CMD_STATE cmdState = CMD_AWAITING;
     //Default to expecting a 1 byte command
	static  uint8_t bytesExpected = 1;

	static  uint8_t bytesReceived = 0;
	static  uint8_t cmdBuffer[5];

 	//Store this byte in the command buffer
    cmdBuffer[bytesReceived] = byte;
    bytesReceived ++;

    //is this a start of a multibyte command?
    if (cmdState == CMD_AWAITING) {
		switch (byte) {
        	//2 byte commands
            case 0x20:
            case 0x81:
            case 0x82:
            case 0xA8:
            case 0xAD:
            case 0xD3:
            case 0xD5:
            case 0xD9:
            case 0xDB:
            	bytesExpected = 2;
                cmdState = CMD_MULTIBYTE_IN_PROGRESS;
                break;
        	case 0x21:
           	case 0x22:
            case 0x23:
            	bytesExpected = 3;
                cmdState = CMD_MULTIBYTE_IN_PROGRESS;
                break;
            case 0xAB:
            	bytesExpected = 4;
                cmdState = CMD_MULTIBYTE_IN_PROGRESS;
                break;
			case 0x91:
            case 0x92:
            case 0x93:
            //Scrolling commands - even used?
            case 0x26:
            case 0x27:
            case 0x29:
            case 0x2A:
                bytesExpected = 5;
                cmdState = CMD_MULTIBYTE_IN_PROGRESS;
                break;
            default:
            	bytesExpected = 1;
                cmdState = CMD_RECEIVED;
            	break;
    	}
	}

	if (bytesExpected == bytesReceived) {
		cmdState = CMD_RECEIVED;
	}
	else {
		//Awaiting more bytes to complete this command
		cmdState = CMD_MULTIBYTE_IN_PROGRESS;
		return;
	}

	//Process it here
	handleCommand(cmdBuffer, bytesReceived);

	//Reset the machinery ready for the new command
	cmdState = CMD_AWAITING;
	bytesReceived = 0;
}

void handleDataByte(uint8_t byte) {
	//Store this byte in the framebuffer at the current pointer address.
	framebuffer[fb_offset] = byte;
	//Tell the main loop that this page has been changed so needs updating
	pageChanged[page] = true;
	fb_offset ++;
	//If we've now reached the end of this page address, wrap it back to the start of that page (like the ssd1305 does)
	if (fb_offset%128 == 0) fb_offset  = page * 128 ;
}

void usartSend(char *string) {
    while (*string) {
        usart_send_blocking(USART1, *string);
        string++;
    }
}

void init() {
    rcc_clock_setup_in_hse_8mhz_out_72mhz();

	//GPIO peripheral clocks on here
	//Other peripheral clocks (eg USART) turned on by their own inits.
	rcc_periph_clock_enable(RCC_GPIOA);
    rcc_periph_clock_enable(RCC_GPIOB);

#ifdef USB_DEBUG
    initUSART();
    usartSend("Init\r\n");
#endif

    initSPI();
	initDMA();

   	gpio_set_mode(GPIOA, GPIO_MODE_INPUT, GPIO_CNF_INPUT_PULL_UPDOWN,  GPIO11);
	gpio_set(GPIOA, GPIO11);//pullup

   	//10 = D/C, B11 = RST, 12 is driven as CS
   	gpio_set_mode(GPIOB, GPIO_MODE_OUTPUT_50_MHZ, GPIO_CNF_OUTPUT_PUSHPULL, GPIO10 | GPIO11 | GPIO12);
   	gpio_set(OUT_GPIO, OUT_CS_PIN);

	SSD1305_init();

	//Mark all pages as changed
	for (int i=0; i<8; ++i) {
		pageChanged[i] = true; 
	}
}

int main() {

	//Init all the things.
	init();

	//DATA *from* the radio is received via SPI1 interrupt handler, and inserted into the framebuffer
	//or a command (eg brightness) is interpreted, added to the command block within the driver, and sent once the 
	//data send is complete. 
	
	while (true) {
		//Don't bother updating the screen if the display is off - what's the point?
		if (displayOn) {
			for (int i=0; i<8; ++i) {
				if (pageChanged[i]) {
					pageChanged[i] = false;
					dmaTransferToScreen(i);
					//Wait for the DMA transfer to complete.
					while (!dmaComplete) {
						for (int i=0; i<50; ++i) __asm__("NOP");
					}		
				}
			}
			//This doesnt bother to use DMA as it's quite short and the overhead isnt worth it!
			SSD1305_sendCmdBlock();
			for (int i=0; i<50; ++i) __asm__("NOP");
    	}
	}
}


