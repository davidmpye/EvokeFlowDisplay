#ifndef __SSD1305_H__
#define __SSD1305_H__

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

#include "pins.h"
#include "libopencm3/stm32/spi.h"
#include "libopencm3/stm32/gpio.h"


//#define VERTFLIP



void SSD1305_init(void);
void SSD1305_setBrightness(uint8_t);
void SSD1305_enableDisplay(bool); //Display on or off.
void SSD1305_sendPage(uint8_t page, volatile uint8_t *fb);  //Send a single page to the display
void SSD1305_sendFB(volatile uint8_t *fb);  //Send the whole framebuffer to the display

void SSD1305_sendByte(bool cmd, uint8_t byte); //Low level byte send.

void SSD1305_preDmaTransfer(uint8_t page);
void SSD1305_postDmaTransfer(uint8_t page);

void SSD1305_sendCmdBlock();


#endif


