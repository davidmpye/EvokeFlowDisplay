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
0xa6,
////initial display line in GDRAM
0x40,
//display on
0xAF,
};

#define CMDBLOCK_LEN 10
#define CONTRAST_OFFSET 1
#define STATUS_OFFSET 9
uint8_t NT7538_cmdBlock[] = {
//Contrast command
0x81,
//Contrast val
0x26, //default value
//Clear ADC
0xA0,
//set shl
0xC8,
//clear bias
0xA2,
//power control 0x07
0x2F,
//reg resistor select 0x07
0x27,
//Normal segment mapping (0xa7 = reverse)
0xa6,
////initial display line in GDRAM
0x40,
//Screen status command
0xAF
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

    //Set up the timer for the PWM backlight
    rcc_periph_clock_enable(RCC_GPIOA);
    rcc_periph_clock_enable(RCC_TIM3);
    gpio_set_mode(GPIOB, GPIO_MODE_OUTPUT_50_MHZ,
    	GPIO_CNF_OUTPUT_ALTFN_PUSHPULL,
	GPIO_TIM3_CH4);
    rcc_periph_clock_enable(RCC_TIM3);
    timer_set_mode(TIM3, TIM_CR1_CKD_CK_INT, TIM_CR1_CMS_CENTER_1,
    	TIM_CR1_DIR_UP);
    timer_enable_preload(TIM3);
    timer_set_prescaler(TIM3, 64); //1MHz	 
         timer_set_period(TIM3, 500);
	 timer_set_repetition_counter(TIM3, 0);
	  timer_continuous_mode(TIM3); 
	 timer_set_oc_mode(TIM3, TIM_OC4, TIM_OCM_PWM2);
         timer_enable_oc_output(TIM3, TIM_OC4);
         timer_set_oc_value(TIM3, TIM_OC4, 520);  //Backlight off initially
         timer_enable_counter(TIM3);

#ifdef ENABLE_CONTRAST_POT
	 //Set up the ADC for the contrast potentiometer
	 gpio_set_mode(GPIOB, GPIO_MODE_INPUT, GPIO_CNF_INPUT_ANALOG, GPIO0);
	 rcc_periph_clock_enable(RCC_ADC1);
	 adc_power_off(ADC1);
	rcc_periph_reset_pulse(RST_ADC1);
	rcc_set_adcpre(RCC_CFGR_ADCPRE_PCLK2_DIV2);
	adc_set_dual_mode(ADC_CR1_DUALMOD_IND);
	adc_disable_scan_mode(ADC1);
	adc_set_single_conversion_mode(ADC1);
	adc_set_sample_time(ADC1, ADC_CHANNEL8, ADC_SMPR_SMP_1DOT5CYC);
	uint8_t channels[] = { ADC_CHANNEL8};
	adc_set_regular_sequence(ADC1, 1, channels);
	adc_enable_external_trigger_regular(ADC1, ADC_CR2_EXTSEL_SWSTART);
	adc_power_on(ADC1);
	adc_reset_calibration(ADC1);
	adc_calibrate(ADC1);
#endif
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
    //Data captured from radio's own 'brightness' values.
     timer_set_oc_value(TIM3, TIM_OC4, 500 - (brightness*50)+20);
}

void NT7538_enableDisplay(bool state) {
    	if (state) {
    		NT7538_cmdBlock[STATUS_OFFSET]  = 0xAF;
		//Re-enable backlight
	 	timer_set_oc_mode(TIM3, TIM_OC4, TIM_OCM_PWM2);
	}
	else {
    		NT7538_cmdBlock[STATUS_OFFSET]  = 0xAE;
		//Backlight off
	 	timer_set_oc_mode(TIM3, TIM_OC4, TIM_OCM_FORCE_LOW);
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
//If fitted, we look up the contrast pot value each time a command block is sent
#ifdef ENABLE_CONTRAST_POT
	adc_start_conversion_regular(ADC1);
	while (! adc_eoc(ADC1));
	uint16_t contrastval = adc_read_regular(ADC1);	 
	//Scale contrast val.
	//0 to 0x3f
	contrastval  /= 0x3F;
	NT7538_cmdBlock[CONTRAST_OFFSET] = 0xFF & contrastval;
#endif
	
	for (int i=0; i<CMDBLOCK_LEN; ++i)  {
    		NT7538_sendByte(true, NT7538_cmdBlock[i]);
 	}
}
