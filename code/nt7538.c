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

#include "nt7538.h"

#define NT7538_INIT_CMD_LEN 10
//This is our default block of 'init commands'
uint8_t NT7538_init_cmds [] = {
//clear adc
0xA0,
//set shl
0xC8,
//clear bias
0xA2,
//power control 0x07
0x2F,
//reg resistor select 0x07
0x27,
//contrast control reg
0x81,
//Contrast register range 0-0x3F
0x26,
0xa6,//Normal segment mapping (0xa7 = reverse)
////initial display line in GDRAM
0x40,
//display on
0xAF,
};

#define CMDBLOCK_LEN 0
#define DISPLAY_STATE_OFFSET 4
uint8_t NT7538_cmdBlock[] = {
};

void NT7538_init() {
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
    for (int i=0; i<NT7538_INIT_CMD_LEN; ++i)  {
    	NT7538_sendByte(true, NT7538_init_cmds[i]);
    }
}

void NT7538_sendByte(bool cmd, uint8_t b) {
    	//CS low
	gpio_clear(GPIOB, OUT_CS_PIN);
	
	//Set data/command pin state
	if (cmd) 
        gpio_clear(GPIOB, OUT_D_C_PIN);
	else 
        gpio_set(GPIOB, OUT_D_C_PIN);
	
	for (int i=0; i<10; ++i) __asm__("NOP");

	spi_send(SPI2, b);

    while (!(SPI_SR(SPI2) & SPI_SR_TXE)) {
		//Wait for transfer to start
	}

	while ((SPI_SR(SPI2) & SPI_SR_BSY)) {
		//Wait fof transfer to finish
	}
	for (int i=0; i<10; ++i) __asm__("NOP");

	//CS_high - end of byte
	gpio_set(GPIOB, OUT_CS_PIN);
}

void NT7538_setBrightness(uint8_t brightness) {
	//ValA = 0x81 arg, valB = 0xDB arg
    //Data captured from radio's own 'brighness' values.
	uint8_t valA, valB;
	switch (brightness) {
	}
}

void NT7538_enableDisplay(bool state) {
    if (state) {
	}
	else {
	}
}

void NT7538_sendPage(uint8_t page, volatile uint8_t *fb) {
	//Flip pages.
	NT7538_sendByte(true, 0xB0 + page); //set page
	NT7538_sendByte(true, 0x00); //set column offset lower  - 0 
	NT7538_sendByte(true, 0x10); //set column offset higher - 0 
		
	for (int i=0; i<128; ++i) {
		NT7538_sendByte(false, fb[(page*128) + i]);
	}
} 

void NT7538_sendFB(volatile uint8_t *fb) {
    for (int i=0; i<8; ++i) 
        NT7538_sendPage(i, fb);
} 


void NT7538_preDmaTransfer(uint8_t page) {
	//Send page-select preamble
	NT7538_sendByte(true, 0xB0 + page); //set page
	NT7538_sendByte(true, 0x00); //set column offset lower  - 0 
	NT7538_sendByte(true, 0x10); //set column offset higher - 0 

	//Pull CS low	
	gpio_clear(GPIOB, OUT_CS_PIN);
	
	//Pull data/cmd pin high so the NT7538 is expecting data
	gpio_set(GPIOB, OUT_D_C_PIN);
}

void NT7538_postDmaTransfer(uint8_t page) {
	//Nothing page specific here, just pull CS high to signify end of data
	gpio_set(GPIOB, OUT_CS_PIN);
	gpio_clear(GPIOB, OUT_D_C_PIN);
}

void NT7538_sendCmdBlock() {
 	for (int i=0; i<CMDBLOCK_LEN; ++i)  {
    	NT7538_sendByte(true, NT7538_cmdBlock[i]);
 	}
}
