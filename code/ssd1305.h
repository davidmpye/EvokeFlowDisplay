#ifndef __SSD1305_H__
#define __SSD1305_H__


#include "pins.h"
#include "libopencm3/stm32/spi.h"
#include "libopencm3/stm32/gpio.h"

void SSD1305_init();
void SSD1305_setBrightness(uint8_t);
void SSD1305_enableDisplay(bool); //Display on or off.
void SSD1305_sendPage(uint8_t page, uint8_t *fb);  //Send a single page to the display
void SSD1305_sendFB(uint8_t *fb);  //Send the whole framebuffer to the display

void SSD1305_sendByte(bool cmd, uint8_t byte); //Low level byte send.

#endif


