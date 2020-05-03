#ifndef __PINS_H__
#define __PINS_H__

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

#endif