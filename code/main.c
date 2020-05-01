#include "libopencm3/stm32/rcc.h"
#include "libopencm3/stm32/gpio.h"
#include "libopencm3/stm32/usart.h"
#include "libopencm3/stm32/spi.h"
#include "libopencm3/cm3/nvic.h"
#include "libopencm3/stm32/exti.h"

//Note VCC supplied by radio is 14.55volts.
//1.15MOhm therefore should be the IREF current resistor
//The radio seems to use 1.5MOHm tho... :-O

//VCC 14.55volts

// Pin defines
//GPIOB
//For the OLED/LCD *OUTPUT* device 

//SPI pins for note.
//IN spi peripheral (SPI1)
//NSS = PA4, SCK = PA5, MISO = PA6, MOSI=PA7
//OUT spi pins
//NSS = B12(not used), SCK = B13, MISO = B14(not used), MOSI = B15

//GPIOB pins for o/p
#define OUT_GPIO GPIOB
#define OUT_D_C_PIN GPIO10
#define OUT_RST_PIN GPIO11
#define OUT_CS_PIN GPIO12

#define BUFSIZE 10  //room for 8 data or command blocks
#define DATA_SIZE 200//room for 128 bytes per block (probably excessive, no need to be longer than page size

#define USB_DEBUG

//#define SIDEFLIP
//#define VERTFLIP

//Our framebuffer
volatile uint8_t framebuffer[128*8];
//The current address offset within the fb
volatile unsigned int fb_offset = 0;
//Whether the fb has changed
volatile bool fb_updated = false;
uint8_t brightness = 0; //Display brightness = 0->10

//Cmd buffer for dumping to USB for debug purposes
#define DEBUG_BUFFER_LEN 64
uint8_t cmdbuffer[DEBUG_BUFFER_LEN];
int cmdsrx =0;
//used to store what the command interpreter state is
typedef enum  CMD_STATE {
        CMD_AWAITING,
        CMD_RECEIVED,
        CMD_MULTIBYTE_IN_PROGRESS
} CMD_STATE ;

static void usart_setup() {
	/* Setup UART parameters. */
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

static void spi_setup() {
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

void spi1_isr() {
	//Hopefully this has gone off because a byte has arrived..
	uint8_t byte = spi_read(SPI1);
	bool isCmd;
	//gpio11 high = data
	if ( !gpio_get(GPIOA, GPIO11)) {
		handleCmdByte(byte);
	}
	else handleDataByte(byte);
}

void setDisplayOff() {
	send(true, 0xAE);
}

void setDisplayOn() {
	send(true, 0xAF);
}

void setBrightness(unsigned int level) {
	send(true, 0x81);
	send(true,0x05);
}

//NB not thread safe...
char hexbuf[3]; //AA<NULL>
char *toHex(uint8_t buf) {
    const char * hex = "0123456789ABCDEF";
    hexbuf[0] = hex[(buf>>4) & 0xF];
    hexbuf[1] = hex[ buf & 0xF];
    hexbuf[2] = 0x00;
    return hexbuf;
}

void handleCommand(uint8_t *bytes, uint8_t len) {
	static uint8_t page, col; //used to calculate/store framebuffer offset
	bool addrFound =  false;

	static uint8_t DBval = 0x00;

	if (len == 1) {
		if (bytes[0] == 0xAF) {
  			setDisplayOn();
		}
		else if (bytes[0] == 0xAE) {
			setDisplayOff();
		}
		else if ( (bytes[0] & 0xF0) == 0xB0) {
			//page cmd
			page = bytes[0]&0x0F;
			//specified page must be <=7
			if (page > 7) page = 0;
			col = 0;
			addrFound = true;
		}
		else if ((bytes[0] & 0xF0) == 0x10) {
			col |= ((bytes[0]&0x0F)<<4);
			addrFound = true;
		}
		else if ( (bytes[0] & 0xF0) == 0x00) {
            //collow
            col |=  (bytes[0]&0x0F) ;
			addrFound = true;
		}

		//Check to see if we've received an address command - if so,update the FB cursor
		if (addrFound) {
			fb_offset =  (page*128) + col;
			//Don't try to trick us to write off the end of the buffer...
			//-4 corrects an offset because of the original display being wired 'backwards', and the ssd1305 
			//gdram buffer being 132byte not 128.
			if (fb_offset >= 128*64) fb_offset = 0;
			if (fb_offset >= 4) fb_offset -=4;
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
		}
		else if (bytes[0] = 0xDB) {
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
					uart_puts(toHex(cmdbuffer[i]));
                	uart_puts("  ");
					if (i!=0 && i%32==0) uart_puts("\r\n");
			}
			cmdsrx =0;
			}
		}
#endif
	}*/	
}

void setOLEDBrightness(uint8_t brightness) {
	//ValA = 0x81 arg, valB = 0xDB arg
	uint8_t valA, valB;

	switch (brightness) {
		case 1:
			valA = 0x00;
			valB = 0x00;
			break;
		case 2:
			valA = 0x00;
			valB = 0x08;
			break;
		case 3:
			valA = 0x10;
			valB = 0x0C;
			break;
		case 4:
			valA = 0x20;
			valB = 0x0C;
			break;
		case 5:
			valA = 0x30;
			valB = 0x24;
			break;
		case 6:
			valA = 0x40;
			valB = 0x24;
			break;
		case 7:
			valA = 0x50;
			valB = 0x2C;
			break;
		case 8:
			valA = 0x70;
			valB = 0x34;
			break;
		case 9:
			valA = 0x80;
			valB = 0x34;
			break;
		case 10:
		default:
			valA = 0xB0;
			valB = 0x3C;
			break;
	}
	//Send the commands to the OLED
	send(true, 0x81);
	send(true, valA);
	send(true, 0xDB);
	send(true, valB);

}

void handleCmdByte(uint8_t byte) {
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
	fb_offset ++;
	//If we've now reached the end of this page address, wrap it (like the ssd1305 does)
	if (fb_offset%128 == 0) fb_offset -= 128;
	//Tell the main loop that this page has been changed so needs updating
	fb_updated = true;
}

void uart_puts(char *string) {
    while (*string) {
        usart_send_blocking(USART1, *string);
        string++;
    }
}

uint8_t ssd1305init [] = {
	0xAE,   //Display OFF
	0xD5,	//Display clock
	0xF0,	//Display clock oscillator freq
	0xA8,	//Multiplex ratio
	0x3F, 	//Multiplex radio arg
	0xD3,	//Display offset 
	0x40,	//vertical offset//
	0xad,   //External VCC supply (default anyway!)
	0x8e,   //Mandatory (but unspecified) argument to 0xAD!
	0xd8,	//Area colour mode
	0x05,   //monochrome, low power display mode
#ifdef SIDEFLIP
	0xa1,
#else
	0xa0,
#endif
#ifdef VERTFLIP
	0xc8,
#else
	0xc0, 	//c0 is one way up, c8 is the other!
#endif
	0xda, 	//Hardware com pin configuration
	0x12, 	//'alternative' com pin config, no left to right remap.
	0x91, 	//current drive pulse width
	0x3f, 	//args to above
	0x3f,	//args to above
	0x3f,	//args to above
	0x3f,	//args to above
	0x82,	//Set brightness for area color banks
	0x80,   //Default brightness
	0xd9,   //Set precharge period
	0xf1,   //was f1 //F = phase 1, 1= phase 2
	0xdb,   //VComH select
	0x34,   //0.77x VCC (Default)
	0xa6,   //Normal, non inverted display
	0xa4,//fixme   //Display on - 'follows RAM'
	//if we wanted to use horizontal addressing mode, we'd add:
        //0x20, 0x00,
        //default is page addressing mode, which is 0x22
	0xAE,   //Display off
};

//FIXME - this needs to be DMA driven really!
void sendFrameBufferToOLED() {
	for (int i=0; i<8; ++i) {	
		send(true, 0xB0 + i); //set page
		send(true, 0x00); //set column offset lower  - 0 
		send(true, 0x10); //set column offset higher - 0 
		
		for (int j=0; j<128; ++j) {
			send(false, framebuffer[(i*128) + j]);
		}
	}
}



void initOLED() {
    
	
    memset(framebuffer, 0x00, 128*8);	
    //CS high
    gpio_set(OUT_GPIO, OUT_CS_PIN);
    
    //command mode
    gpio_clear(OUT_GPIO, OUT_D_C_PIN);

    // Toggle reset 
    gpio_set(OUT_GPIO, OUT_RST_PIN);
    for (int i=0; i<1000; ++i) __asm__("NOP");
    gpio_clear(OUT_GPIO, OUT_RST_PIN);
    for (int i=0; i<1000; ++i) __asm__("NOP");
    gpio_set(OUT_GPIO, OUT_RST_PIN);
    
    // Post reset pause
    for (int i=0; i<5000; ++i) __asm__("NOP");
    // Send the init string   
    for (int i=0; i<30; ++i)  {
    	send(true, ssd1305init[i]);
    }
   
    //Zero the framebuffer, send it, then turn the display on to avoid random noise appearing 
    memset(framebuffer, 0x00, 128*8);	
    sendFrameBufferToOLED();
    setDisplayOn();
}

void init() {
	// First, let's ensure that our clock is running off the high-speed
    	// internal oscillator (HSI) at 48MHz
    	rcc_clock_setup_in_hse_8mhz_out_72mhz();
    	//Set up the peripheral clocks for GPIOA, USART1 (serial debug TX), and the SPI peripheral
    	rcc_periph_clock_enable(RCC_GPIOA);
    	rcc_periph_clock_enable(RCC_GPIOB);

#ifdef USB_DEBUG
    	usart_setup();
    	uart_puts("HELLO \r\n");
#endif

    	spi_setup();

    	gpio_set_mode(GPIOA, GPIO_MODE_INPUT, GPIO_CNF_INPUT_PULL_UPDOWN,  GPIO11);
		gpio_set(GPIOA, GPIO11);//pullup
 
     	//10 = D/C, B11 = RST, 12 is driven as CS
    	gpio_set_mode(GPIOB, GPIO_MODE_OUTPUT_50_MHZ, GPIO_CNF_OUTPUT_PUSHPULL, GPIO10 | GPIO11 | GPIO12);
    	gpio_set(OUT_GPIO, OUT_CS_PIN);
	initOLED();
}



int main() {

	//Init all the things.
	init();

	static uint8_t lastBrightness = 10;


	//DATA *from* the radio is received via SPI1 interrupt handler, and inserted into the framebuffer
	while (true) {
		//If a framebuffer update is required, do it!
		if (fb_updated) {
			fb_updated = false;
			sendFrameBufferToOLED();
			//If the brightness level has changed, update it
			if (lastBrightness != brightness) {
				setOLEDBrightness(brightness);
				lastBrightness = brightness;
			}
		}
		//Idle a while
		for (int i=0; i<100; ++i) __asm__("NOP");
    	}
}


void send(bool cmd, uint8_t b) {
	//CS low
	gpio_clear(GPIOB, GPIO12);
	
	//Set command if appropriate
	if (cmd) gpio_clear(GPIOB, GPIO10);
	else gpio_set(GPIOB, GPIO10);
	
	spi_send(SPI2, b);
        while (!(SPI_SR(SPI2) & SPI_SR_TXE));
        while ((SPI_SR(SPI2) & SPI_SR_BSY));
        
	//CS_high	
	gpio_set(GPIOB, GPIO12);
}

