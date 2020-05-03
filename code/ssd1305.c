#include "ssd1305.h"


//This is our default block of 'init commands'
uint8_t SSD1305_init_cmds [] = {
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
#ifdef VERTFLIP 
	0xa1,
	0xc8,
#else
	0xa0,
	0xc0,
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


void SSD1305_init() {
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
    	SSD1305_sendByte(true, SSD1305_init_cmds[i]);
    }
    SSD1305_enableDisplay(true);
}

void SSD1305_sendByte(bool cmd, uint8_t b) {
    //CS low
	gpio_clear(GPIOB, OUT_CS_PIN);
	
	//Set command if appropriate
	if (cmd) 
        gpio_clear(GPIOB, OUT_D_C_PIN);
	else 
        gpio_set(GPIOB, OUT_D_C_PIN);
	
	spi_send(SPI2, b);

    //Wait for the transfer to *actually* complete.
    while (!(SPI_SR(SPI2) & SPI_SR_TXE));
    while ((SPI_SR(SPI2) & SPI_SR_BSY));
        
	//CS_high - end of byte
	gpio_set(GPIOB, OUT_CS_PIN);
}

void SSD1305_setBrightness(uint8_t brightness) {
	//ValA = 0x81 arg, valB = 0xDB arg
    //Data captured from radio's own 'brighness' values.
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
	SSD1305_sendByte(true, 0x81);
	SSD1305_sendByte(true, valA);
	SSD1305_sendByte(true, 0xDB);
}

void SSD1305_enableDisplay(bool state) {
    if (state) {
		SSD1305_sendByte(true, 0xAF);
	}
	else {
		SSD1305_sendByte(true, 0xAE);
	}
}

void SSD1305_sendPage(uint8_t page, uint8_t *fb) {
    for (int i=0; i<8; ++i) {	
		SSD1305_sendByte(true, 0xB0 + i); //set page
		SSD1305_sendByte(true, 0x00); //set column offset lower  - 0 
		SSD1305_sendByte(true, 0x10); //set column offset higher - 0 
		
		for (int j=0; j<128; ++j) {
			SSD1305_sendByte(false, fb[(i*128) + j]);
		}
    }
} 

void SSD1305_sendFB(uint8_t *fb) {
    for (int i=0; i<8; ++i) 
        SSD1305_sendPage(i, *fb);
} 
