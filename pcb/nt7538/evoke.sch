EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	1100 1000 1100 1350
$Comp
L evoke-rescue:GND-power-evoke-rescue #PWR0107
U 1 1 5E866CA5
P 1000 1000
F 0 "#PWR0107" H 1000 750 50  0001 C CNN
F 1 "GND" H 1005 827 50  0000 C CNN
F 2 "" H 1000 1000 50  0001 C CNN
F 3 "" H 1000 1000 50  0001 C CNN
	1    1000 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 1000 1500 1400
Text GLabel 1500 1400 3    50   Input ~ 0
RST_IN
Wire Wire Line
	1300 1000 1300 1400
Text GLabel 1300 1400 3    50   Input ~ 0
D_C_IN
Wire Wire Line
	1400 1000 1400 1400
Text GLabel 1400 1400 3    50   Input ~ 0
CS_IN
Wire Wire Line
	1700 1000 1700 1400
Text GLabel 1700 1400 3    50   Input ~ 0
VCC
Wire Wire Line
	1600 1000 1600 1400
Wire Wire Line
	1200 1000 1200 1350
Text GLabel 1200 1350 3    50   Input ~ 0
SCK_IN
$Comp
L evoke-rescue:Conn_01x08-Connector_Generic-evoke-rescue INPUT_CONN1
U 1 1 5E8496EF
P 1300 800
F 0 "INPUT_CONN1" V 1264 312 50  0000 R CNN
F 1 "CN101" V 1173 312 50  0000 R CNN
F 2 "Connector_FFC-FPC:Molex_200528-0080_1x08-1MP_P1.00mm_Horizontal" H 1300 800 50  0001 C CNN
F 3 "~" H 1300 800 50  0001 C CNN
	1    1300 800 
	0    -1   -1   0   
$EndComp
Text GLabel 1100 1350 3    50   Input ~ 0
SDIN_IN
$Comp
L evoke-rescue:Conn_01x30-Connector_Generic-evoke-rescue LCD_CONN1
U 1 1 5EA08ED1
P 2750 4550
F 0 "LCD_CONN1" V 2967 4496 50  0000 C CNN
F 1 "Conn_01x30" V 2876 4496 50  0000 C CNN
F 2 "Connector_FFC-FPC:Hirose_FH12-30S-0.5SH_1x30-1MP_P0.50mm_Horizontal" H 2750 4550 50  0001 C CNN
F 3 "~" H 2750 4550 50  0001 C CNN
	1    2750 4550
	0    -1   -1   0   
$EndComp
$Comp
L evoke-rescue:+3V3-power-evoke-rescue #PWR0106
U 1 1 5E96F3E2
P 1600 1400
F 0 "#PWR0106" H 1600 1250 50  0001 C CNN
F 1 "+3V3" H 1615 1573 50  0000 C CNN
F 2 "" H 1600 1400 50  0001 C CNN
F 3 "" H 1600 1400 50  0001 C CNN
	1    1600 1400
	-1   0    0    1   
$EndComp
Wire Wire Line
	6350 3100 6750 3100
Wire Wire Line
	6350 3200 6750 3200
Wire Wire Line
	6350 3300 6750 3300
Wire Wire Line
	6350 3400 6750 3400
Text GLabel 6750 3100 2    50   Input ~ 0
SPI1_NSS
Text GLabel 6750 3200 2    50   Input ~ 0
SPI1_SCK
Text GLabel 6750 3300 2    50   Input ~ 0
SPI1_MISO
Text GLabel 6750 3400 2    50   Input ~ 0
SPI1_MOSI
Text Notes 7300 3200 0    50   ~ 0
NB:SPI1 is fastest bus so used for comms with radio\nSLAVE MODE
Wire Wire Line
	5050 4200 4750 4200
Wire Wire Line
	5050 4100 4750 4100
Wire Wire Line
	5050 4000 4750 4000
Wire Wire Line
	5050 3900 4750 3900
Text GLabel 4750 3900 0    50   Input ~ 0
SPI2_NSS
Text GLabel 4750 4000 0    50   Input ~ 0
SPI2_SCK
Text GLabel 4750 4100 0    50   Input ~ 0
SPI2_MISO
Text GLabel 4750 4200 0    50   Input ~ 0
SPI2_MOSI
Wire Wire Line
	5050 3800 4750 3800
Text GLabel 4750 3800 0    50   Input ~ 0
SPI2_RST
Wire Wire Line
	5050 3700 4750 3700
Text GLabel 4750 3700 0    50   Input ~ 0
SPI2_D_C
Wire Wire Line
	6350 2900 6750 2900
Wire Wire Line
	6350 3000 6750 3000
Text GLabel 6750 2900 2    50   Input ~ 0
SPI1_D_C
Text GLabel 6750 3000 2    50   Input ~ 0
SPI1_RST
Text Notes 2800 4050 0    50   ~ 0
SPI2 bus MASTER mode -> LCD/OLED
$Comp
L evoke-rescue:+3V3-power-evoke-rescue #PWR0109
U 1 1 5E9A3581
P 5750 950
F 0 "#PWR0109" H 5750 800 50  0001 C CNN
F 1 "+3V3" H 5765 1123 50  0000 C CNN
F 2 "" H 5750 950 50  0001 C CNN
F 3 "" H 5750 950 50  0001 C CNN
	1    5750 950 
	1    0    0    -1  
$EndComp
$Comp
L evoke-rescue:GND-power-evoke-rescue #PWR0110
U 1 1 5E9AC493
P 5700 4400
F 0 "#PWR0110" H 5700 4150 50  0001 C CNN
F 1 "GND" H 5705 4227 50  0000 C CNN
F 2 "" H 5700 4400 50  0001 C CNN
F 3 "" H 5700 4400 50  0001 C CNN
	1    5700 4400
	1    0    0    -1  
$EndComp
Connection ~ 5700 4400
$Comp
L evoke-rescue:R-Device-evoke-rescue R1
U 1 1 5E9AECB8
P 4650 1800
F 0 "R1" H 4580 1754 50  0000 R CNN
F 1 "10K" H 4580 1845 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4580 1800 50  0001 C CNN
F 3 "~" H 4650 1800 50  0001 C CNN
F 4 " C17414" H 4650 1800 50  0001 C CNN "LCSC"
	1    4650 1800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5050 1800 4800 1800
Text GLabel 800  -150 0    50   Input ~ 0
BOOT0
$Comp
L evoke-rescue:GND-power-evoke-rescue #PWR0111
U 1 1 5E9C3D8B
P 4350 1800
F 0 "#PWR0111" H 4350 1550 50  0001 C CNN
F 1 "GND" H 4355 1627 50  0000 C CNN
F 2 "" H 4350 1800 50  0001 C CNN
F 3 "" H 4350 1800 50  0001 C CNN
	1    4350 1800
	1    0    0    -1  
$EndComp
$Comp
L evoke-rescue:C-Device-evoke-rescue C9
U 1 1 5E9CF40C
P 4650 1600
F 0 "C9" V 4398 1600 50  0000 C CNN
F 1 "100nF" V 4489 1600 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4688 1450 50  0001 C CNN
F 3 "~" H 4650 1600 50  0001 C CNN
F 4 "C49678" V 4650 1600 50  0001 C CNN "LCSC"
	1    4650 1600
	0    1    1    0   
$EndComp
Wire Wire Line
	9850 3650 10000 3650
Text GLabel 10150 3650 2    50   Input ~ 0
LCD_SCK
Text GLabel 9850 3650 0    50   Input ~ 0
SPI2_SCK
Wire Wire Line
	9850 3850 10000 3850
Wire Wire Line
	10150 4050 10000 4050
Wire Wire Line
	9850 4250 10000 4250
Text GLabel 9850 4050 0    50   Input ~ 0
SPI2_NSS
Text GLabel 10150 4050 2    50   Input ~ 0
LCD_CS
Text GLabel 10150 3850 2    50   Input ~ 0
LCD_DATA
Text GLabel 9850 3850 0    50   Input ~ 0
SPI2_MOSI
Text GLabel 10150 4250 2    50   Input ~ 0
LCD_D_C
Text GLabel 9850 4250 0    50   Input ~ 0
SPI2_D_C
Wire Wire Line
	9850 4450 10150 4450
Text GLabel 10150 4450 2    50   Input ~ 0
LCD_RST
Text GLabel 9850 4450 0    50   Input ~ 0
SPI2_RST
Wire Wire Line
	8000 3650 8200 3650
Wire Wire Line
	8000 3850 8200 3850
Wire Wire Line
	8000 4050 8200 4050
Wire Wire Line
	8000 4250 8200 4250
Wire Wire Line
	8000 4450 8450 4450
Text GLabel 8000 3650 0    50   Input ~ 0
SPI1_SCK
Text GLabel 8000 3850 0    50   Input ~ 0
SPI1_MOSI
Text GLabel 8000 4050 0    50   Input ~ 0
SPI1_NSS
Text GLabel 8000 4250 0    50   Input ~ 0
SPI1_D_C
Text GLabel 8000 4450 0    50   Input ~ 0
SPI1_RST
Text GLabel 8450 3650 2    50   Input ~ 0
SCK_IN
Text GLabel 8450 3850 2    50   Input ~ 0
SDIN_IN
Text GLabel 8450 4050 2    50   Input ~ 0
CS_IN
Text GLabel 8450 4250 2    50   Input ~ 0
D_C_IN
Text GLabel 8450 4450 2    50   Input ~ 0
RST_IN
Wire Wire Line
	5050 2900 4750 2900
Wire Wire Line
	3950 4750 3950 4900
Wire Wire Line
	2850 4750 2850 5050
Text GLabel 3050 4750 3    50   Input ~ 0
LCD_DATA
Text GLabel 3150 4750 3    50   Input ~ 0
LCD_SCK
Text GLabel 4050 4750 3    50   Input ~ 0
LCD_D_C
Text GLabel 4150 4750 3    50   Input ~ 0
LCD_RST
Text GLabel 4250 4750 3    50   Input ~ 0
LCD_CS
$Comp
L evoke-rescue:+3V3-power-evoke-rescue #PWR0105
U 1 1 5EABCA46
P 3600 4900
F 0 "#PWR0105" H 3600 4750 50  0001 C CNN
F 1 "+3V3" H 3615 5073 50  0000 C CNN
F 2 "" H 3600 4900 50  0001 C CNN
F 3 "" H 3600 4900 50  0001 C CNN
	1    3600 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 4400 5700 4400
Wire Wire Line
	5850 4400 5750 4400
Connection ~ 5750 4400
Wire Wire Line
	5700 4400 5650 4400
Wire Wire Line
	5650 4400 5550 4400
Connection ~ 5650 4400
$Comp
L evoke-rescue:STM32F103C8Tx-MCU_ST_STM32F1-evoke-rescue U1
U 1 1 5E980D42
P 5750 2900
F 0 "U1" H 5700 1311 50  0000 C CNN
F 1 "STM32F103C8Tx" H 5750 1150 50  0000 C CNN
F 2 "Package_QFP:LQFP-48_7x7mm_P0.5mm" H 5150 1500 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00161566.pdf" H 5750 2900 50  0001 C CNN
F 4 "C8734" H 5750 2900 50  0001 C CNN "LCSC"
	1    5750 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 950  5650 950 
Wire Wire Line
	5550 950  5550 1400
Wire Wire Line
	5650 1400 5650 950 
Connection ~ 5650 950 
Wire Wire Line
	5650 950  5550 950 
Wire Wire Line
	5950 950  5850 950 
Connection ~ 5750 950 
Wire Wire Line
	5850 1400 5850 950 
Connection ~ 5850 950 
Wire Wire Line
	5850 950  5750 950 
Wire Wire Line
	5950 950  5950 1400
Wire Wire Line
	5750 1400 5750 950 
$Comp
L evoke-rescue:CP-Device-evoke-rescue C2
U 1 1 5EAE362E
P 5250 1150
F 0 "C2" H 5368 1196 50  0000 L CNN
F 1 "10uF" H 5368 1105 50  0000 L CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-3216-18_Kemet-A" H 5288 1000 50  0001 C CNN
F 3 "~" H 5250 1150 50  0001 C CNN
F 4 " C7171" H 5250 1150 50  0001 C CNN "LCSC"
	1    5250 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 950  5250 950 
Wire Wire Line
	5250 950  5250 1000
Connection ~ 5550 950 
$Comp
L evoke-rescue:GND-power-evoke-rescue #PWR0119
U 1 1 5EAE67A2
P 5250 1300
F 0 "#PWR0119" H 5250 1050 50  0001 C CNN
F 1 "GND" H 5255 1127 50  0000 C CNN
F 2 "" H 5250 1300 50  0001 C CNN
F 3 "" H 5250 1300 50  0001 C CNN
	1    5250 1300
	1    0    0    -1  
$EndComp
$Comp
L evoke-rescue:C-Device-evoke-rescue C3
U 1 1 5EAE6D38
P 6150 1150
F 0 "C3" H 6265 1196 50  0000 L CNN
F 1 "C" H 6265 1105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6188 1000 50  0001 C CNN
F 3 "~" H 6150 1150 50  0001 C CNN
F 4 "C49678" H 6150 1150 50  0001 C CNN "LCSC"
	1    6150 1150
	1    0    0    -1  
$EndComp
$Comp
L evoke-rescue:C-Device-evoke-rescue C4
U 1 1 5EAE707A
P 6400 1150
F 0 "C4" H 6515 1196 50  0000 L CNN
F 1 "C" H 6515 1105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6438 1000 50  0001 C CNN
F 3 "~" H 6400 1150 50  0001 C CNN
F 4 "C49678" H 6400 1150 50  0001 C CNN "LCSC"
	1    6400 1150
	1    0    0    -1  
$EndComp
$Comp
L evoke-rescue:C-Device-evoke-rescue C5
U 1 1 5EAE73B3
P 6650 1150
F 0 "C5" H 6765 1196 50  0000 L CNN
F 1 "100nF" H 6765 1105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6688 1000 50  0001 C CNN
F 3 "~" H 6650 1150 50  0001 C CNN
F 4 "C49678" H 6650 1150 50  0001 C CNN "LCSC"
	1    6650 1150
	1    0    0    -1  
$EndComp
$Comp
L evoke-rescue:C-Device-evoke-rescue C6
U 1 1 5EAE7721
P 6850 1150
F 0 "C6" H 6965 1196 50  0000 L CNN
F 1 "100nF" H 6965 1105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6888 1000 50  0001 C CNN
F 3 "~" H 6850 1150 50  0001 C CNN
F 4 "C49678" H 6850 1150 50  0001 C CNN "LCSC"
	1    6850 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 950  6150 950 
Wire Wire Line
	6150 950  6150 1000
Connection ~ 5950 950 
Wire Wire Line
	6150 950  6400 950 
Wire Wire Line
	6400 950  6400 1000
Connection ~ 6150 950 
Wire Wire Line
	6400 950  6650 950 
Wire Wire Line
	6650 950  6650 1000
Connection ~ 6400 950 
Wire Wire Line
	6650 950  6850 950 
Wire Wire Line
	6850 950  6850 1000
Connection ~ 6650 950 
$Comp
L evoke-rescue:C-Device-evoke-rescue C7
U 1 1 5EAF1488
P 7050 1150
F 0 "C7" H 7165 1196 50  0000 L CNN
F 1 "100nF" H 7165 1105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7088 1000 50  0001 C CNN
F 3 "~" H 7050 1150 50  0001 C CNN
F 4 "C49678" H 7050 1150 50  0001 C CNN "LCSC"
	1    7050 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 950  7050 950 
Wire Wire Line
	7050 950  7050 1000
Connection ~ 6850 950 
Wire Wire Line
	7050 1300 6850 1300
Wire Wire Line
	6850 1300 6650 1300
Connection ~ 6850 1300
Wire Wire Line
	6650 1300 6550 1300
Connection ~ 6650 1300
Wire Wire Line
	6400 1300 6150 1300
Connection ~ 6400 1300
$Comp
L evoke-rescue:GND-power-evoke-rescue #PWR0120
U 1 1 5EB009D3
P 6550 1300
F 0 "#PWR0120" H 6550 1050 50  0001 C CNN
F 1 "GND" H 6555 1127 50  0000 C CNN
F 2 "" H 6550 1300 50  0001 C CNN
F 3 "" H 6550 1300 50  0001 C CNN
	1    6550 1300
	1    0    0    -1  
$EndComp
Connection ~ 6550 1300
Wire Wire Line
	6550 1300 6400 1300
$Comp
L evoke-rescue:C-Device-evoke-rescue C8
U 1 1 5EB00D54
P 7250 1150
F 0 "C8" H 7365 1196 50  0000 L CNN
F 1 "100nF" H 7365 1105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7288 1000 50  0001 C CNN
F 3 "~" H 7250 1150 50  0001 C CNN
F 4 "C49678" H 7250 1150 50  0001 C CNN "LCSC"
	1    7250 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 1000 7250 950 
Wire Wire Line
	7250 950  7050 950 
Connection ~ 7050 950 
Wire Wire Line
	7050 1300 7250 1300
Connection ~ 7050 1300
$Comp
L evoke-rescue:GND-power-evoke-rescue #PWR0121
U 1 1 5EB07499
P 4350 2900
F 0 "#PWR0121" H 4350 2650 50  0001 C CNN
F 1 "GND" H 4355 2727 50  0000 C CNN
F 2 "" H 4350 2900 50  0001 C CNN
F 3 "" H 4350 2900 50  0001 C CNN
	1    4350 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 4000 6750 4000
Text GLabel 6750 4000 2    50   Input ~ 0
SWDIO
Wire Wire Line
	6350 4100 6750 4100
Text GLabel 6750 4100 2    50   Input ~ 0
SWCLK
Text GLabel 10000 2050 0    50   Input ~ 0
SWDIO
Text GLabel 10000 1950 0    50   Input ~ 0
SWCLK
Wire Wire Line
	10000 2250 9450 2250
Wire Wire Line
	9450 2250 9450 2200
$Comp
L evoke-rescue:GND-power-evoke-rescue #PWR0112
U 1 1 5EAB7002
P 9850 2150
F 0 "#PWR0112" H 9850 1900 50  0001 C CNN
F 1 "GND" H 9855 1977 50  0000 C CNN
F 2 "" H 9850 2150 50  0001 C CNN
F 3 "" H 9850 2150 50  0001 C CNN
	1    9850 2150
	1    0    0    -1  
$EndComp
$Comp
L evoke-rescue:+3V3-power-evoke-rescue #PWR0113
U 1 1 5EAB778F
P 9450 2200
F 0 "#PWR0113" H 9450 2050 50  0001 C CNN
F 1 "+3V3" H 9465 2373 50  0000 C CNN
F 2 "" H 9450 2200 50  0001 C CNN
F 3 "" H 9450 2200 50  0001 C CNN
	1    9450 2200
	1    0    0    -1  
$EndComp
Text GLabel 10000 2350 0    50   Input ~ 0
RESET
Wire Wire Line
	4350 1800 4500 1800
Wire Wire Line
	4500 1600 4350 1600
Wire Wire Line
	4350 1600 4350 1800
Connection ~ 4350 1800
Wire Wire Line
	5050 1600 4800 1600
Text GLabel 4900 1600 1    50   Input ~ 0
RESET
$Comp
L evoke-rescue:Conn_01x05-Connector_Generic-evoke-rescue ST_LINK1
U 1 1 5EAC76C7
P 10200 2150
F 0 "ST_LINK1" H 10280 2192 50  0000 L CNN
F 1 "Conn_01x05" H 10280 2101 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 10200 2150 50  0001 C CNN
F 3 "~" H 10200 2150 50  0001 C CNN
	1    10200 2150
	1    0    0    -1  
$EndComp
$Comp
L evoke-rescue:R-Device-evoke-rescue R3
U 1 1 5EACB92E
P 4600 2900
F 0 "R3" V 4393 2900 50  0000 C CNN
F 1 "10K" V 4484 2900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4530 2900 50  0001 C CNN
F 3 "~" H 4600 2900 50  0001 C CNN
F 4 " C17414" V 4600 2900 50  0001 C CNN "LCSC"
	1    4600 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	4350 2900 4450 2900
Wire Wire Line
	9850 2150 10000 2150
Wire Wire Line
	6350 3600 6550 3600
Wire Wire Line
	6350 3700 6550 3700
Text GLabel 6550 3600 2    50   Input ~ 0
USART1_TX
Text GLabel 6550 3700 2    50   Input ~ 0
USART1_RX
$Comp
L evoke-rescue:Conn_01x03_Male-Connector-evoke-rescue J1
U 1 1 5ED86F10
P 5000 5300
F 0 "J1" H 5108 5581 50  0000 C CNN
F 1 "Conn_01x03_Male" H 5108 5490 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 5000 5300 50  0001 C CNN
F 3 "~" H 5000 5300 50  0001 C CNN
	1    5000 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 5200 5500 5200
Wire Wire Line
	5200 5300 5500 5300
Wire Wire Line
	5200 5400 5500 5400
$Comp
L evoke-rescue:GND-power-evoke-rescue #PWR0102
U 1 1 5ED93166
P 5500 5400
F 0 "#PWR0102" H 5500 5150 50  0001 C CNN
F 1 "GND" H 5505 5227 50  0000 C CNN
F 2 "" H 5500 5400 50  0001 C CNN
F 3 "" H 5500 5400 50  0001 C CNN
	1    5500 5400
	1    0    0    -1  
$EndComp
Text GLabel 5500 5200 2    50   Input ~ 0
USART1_TX
Text GLabel 5500 5300 2    50   Input ~ 0
USART1_RX
$Comp
L evoke-rescue:C-Device-evoke-rescue C12
U 1 1 5ED88A1A
P 3000 6600
F 0 "C12" H 2800 6650 50  0000 L CNN
F 1 "100nF" H 2700 6550 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3038 6450 50  0001 C CNN
F 3 "~" H 3000 6600 50  0001 C CNN
F 4 "C49678" H 3000 6600 50  0001 C CNN "LCSC"
	1    3000 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 6750 3100 6750
Wire Wire Line
	3250 6450 3100 6450
$Comp
L evoke-rescue:+3V3-power-evoke-rescue #PWR0114
U 1 1 5ED91A37
P 3100 6450
F 0 "#PWR0114" H 3100 6300 50  0001 C CNN
F 1 "+3V3" H 3115 6623 50  0000 C CNN
F 2 "" H 3100 6450 50  0001 C CNN
F 3 "" H 3100 6450 50  0001 C CNN
	1    3100 6450
	1    0    0    -1  
$EndComp
Connection ~ 3100 6450
Wire Wire Line
	3100 6450 3000 6450
$Comp
L evoke-rescue:GND-power-evoke-rescue #PWR0115
U 1 1 5ED921BC
P 3100 6750
F 0 "#PWR0115" H 3100 6500 50  0001 C CNN
F 1 "GND" H 3105 6577 50  0000 C CNN
F 2 "" H 3100 6750 50  0001 C CNN
F 3 "" H 3100 6750 50  0001 C CNN
	1    3100 6750
	1    0    0    -1  
$EndComp
Connection ~ 3100 6750
Wire Wire Line
	3100 6750 3250 6750
$Comp
L evoke-rescue:C-Device-evoke-rescue C13
U 1 1 5ED72B7A
P 3250 6600
F 0 "C13" H 3400 6650 50  0000 L CNN
F 1 "4.7uF" H 3350 6550 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3288 6450 50  0001 C CNN
F 3 "~" H 3250 6600 50  0001 C CNN
F 4 "C1779" H 3250 6600 50  0001 C CNN "LCSC"
	1    3250 6600
	1    0    0    -1  
$EndComp
$Comp
L evoke-rescue:TestPoint-Connector-evoke-rescue TP1
U 1 1 5ED9606D
P 8200 3650
F 0 "TP1" H 8258 3768 50  0000 L CNN
F 1 "TestPoint" H 8258 3677 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 8400 3650 50  0001 C CNN
F 3 "~" H 8400 3650 50  0001 C CNN
	1    8200 3650
	1    0    0    -1  
$EndComp
Connection ~ 8200 3650
Wire Wire Line
	8200 3650 8450 3650
$Comp
L evoke-rescue:TestPoint-Connector-evoke-rescue TP2
U 1 1 5ED9662E
P 8200 3850
F 0 "TP2" H 8258 3968 50  0000 L CNN
F 1 "TestPoint" H 8258 3877 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 8400 3850 50  0001 C CNN
F 3 "~" H 8400 3850 50  0001 C CNN
	1    8200 3850
	1    0    0    -1  
$EndComp
Connection ~ 8200 3850
Wire Wire Line
	8200 3850 8450 3850
$Comp
L evoke-rescue:TestPoint-Connector-evoke-rescue TP3
U 1 1 5ED969D3
P 8200 4050
F 0 "TP3" H 8258 4168 50  0000 L CNN
F 1 "TestPoint" H 8258 4077 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 8400 4050 50  0001 C CNN
F 3 "~" H 8400 4050 50  0001 C CNN
	1    8200 4050
	1    0    0    -1  
$EndComp
Connection ~ 8200 4050
Wire Wire Line
	8200 4050 8450 4050
$Comp
L evoke-rescue:TestPoint-Connector-evoke-rescue TP4
U 1 1 5ED96D81
P 8200 4250
F 0 "TP4" H 8258 4368 50  0000 L CNN
F 1 "TestPoint" H 8258 4277 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 8400 4250 50  0001 C CNN
F 3 "~" H 8400 4250 50  0001 C CNN
	1    8200 4250
	1    0    0    -1  
$EndComp
Connection ~ 8200 4250
Wire Wire Line
	8200 4250 8450 4250
$Comp
L evoke-rescue:TestPoint-Connector-evoke-rescue TP5
U 1 1 5ED97130
P 10000 3650
F 0 "TP5" H 10058 3768 50  0000 L CNN
F 1 "TestPoint" H 10058 3677 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 10200 3650 50  0001 C CNN
F 3 "~" H 10200 3650 50  0001 C CNN
	1    10000 3650
	1    0    0    -1  
$EndComp
Connection ~ 10000 3650
Wire Wire Line
	10000 3650 10150 3650
$Comp
L evoke-rescue:TestPoint-Connector-evoke-rescue TP6
U 1 1 5ED97530
P 10000 3850
F 0 "TP6" H 10058 3968 50  0000 L CNN
F 1 "TestPoint" H 10058 3877 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 10200 3850 50  0001 C CNN
F 3 "~" H 10200 3850 50  0001 C CNN
	1    10000 3850
	1    0    0    -1  
$EndComp
Connection ~ 10000 3850
Wire Wire Line
	10000 3850 10150 3850
$Comp
L evoke-rescue:TestPoint-Connector-evoke-rescue TP7
U 1 1 5ED98084
P 10000 4050
F 0 "TP7" H 10058 4168 50  0000 L CNN
F 1 "TestPoint" H 10058 4077 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 10200 4050 50  0001 C CNN
F 3 "~" H 10200 4050 50  0001 C CNN
	1    10000 4050
	1    0    0    -1  
$EndComp
Connection ~ 10000 4050
Wire Wire Line
	10000 4050 9850 4050
$Comp
L evoke-rescue:TestPoint-Connector-evoke-rescue TP8
U 1 1 5ED9844C
P 10000 4250
F 0 "TP8" H 10058 4368 50  0000 L CNN
F 1 "TestPoint" H 10058 4277 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 10200 4250 50  0001 C CNN
F 3 "~" H 10200 4250 50  0001 C CNN
	1    10000 4250
	1    0    0    -1  
$EndComp
Connection ~ 10000 4250
Wire Wire Line
	10000 4250 10150 4250
Wire Wire Line
	3250 4750 3250 4900
Wire Wire Line
	3250 4900 3350 4900
Wire Wire Line
	3850 4750 3850 4900
Connection ~ 3850 4900
Wire Wire Line
	3850 4900 3950 4900
Wire Wire Line
	3750 4900 3750 4750
Connection ~ 3750 4900
Wire Wire Line
	3750 4900 3850 4900
Wire Wire Line
	3650 4750 3650 4900
Connection ~ 3650 4900
Wire Wire Line
	3650 4900 3750 4900
Wire Wire Line
	3350 4750 3350 4900
Connection ~ 3350 4900
Wire Wire Line
	3350 4900 3450 4900
Wire Wire Line
	3450 4750 3450 4900
Connection ~ 3450 4900
Wire Wire Line
	3450 4900 3550 4900
Wire Wire Line
	3550 4750 3550 4900
Connection ~ 3550 4900
Wire Wire Line
	3550 4900 3600 4900
Connection ~ 3600 4900
Wire Wire Line
	3600 4900 3650 4900
$Comp
L evoke-rescue:+3V3-power-evoke-rescue #PWR0101
U 1 1 5EE4FF46
P 2950 5050
F 0 "#PWR0101" H 2950 4900 50  0001 C CNN
F 1 "+3V3" H 2965 5223 50  0000 C CNN
F 2 "" H 2950 5050 50  0001 C CNN
F 3 "" H 2950 5050 50  0001 C CNN
	1    2950 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 4750 2950 5050
$Comp
L evoke-rescue:GND-power-evoke-rescue #PWR0103
U 1 1 5EE558B0
P 2850 5050
F 0 "#PWR0103" H 2850 4800 50  0001 C CNN
F 1 "GND" H 2855 4877 50  0000 C CNN
F 2 "" H 2850 5050 50  0001 C CNN
F 3 "" H 2850 5050 50  0001 C CNN
	1    2850 5050
	1    0    0    -1  
$EndComp
$Comp
L evoke-rescue:C-Device-evoke-rescue C1
U 1 1 5EE561A0
P 2750 4900
F 0 "C1" H 2850 5000 50  0000 L CNN
F 1 "1uF" H 2850 4850 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2788 4750 50  0001 C CNN
F 3 "~" H 2750 4900 50  0001 C CNN
F 4 "C28323" H 2750 4900 50  0001 C CNN "LCSC"
	1    2750 4900
	1    0    0    -1  
$EndComp
$Comp
L evoke-rescue:GND-power-evoke-rescue #PWR0104
U 1 1 5EE56A79
P 2750 5050
F 0 "#PWR0104" H 2750 4800 50  0001 C CNN
F 1 "GND" H 2755 4877 50  0000 C CNN
F 2 "" H 2750 5050 50  0001 C CNN
F 3 "" H 2750 5050 50  0001 C CNN
	1    2750 5050
	1    0    0    -1  
$EndComp
$Comp
L evoke-rescue:GND-power-evoke-rescue #PWR0108
U 1 1 5EE62F17
P 1500 5100
F 0 "#PWR0108" H 1500 4850 50  0001 C CNN
F 1 "GND" H 1505 4927 50  0000 C CNN
F 2 "" H 1500 5100 50  0001 C CNN
F 3 "" H 1500 5100 50  0001 C CNN
	1    1500 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 5100 1500 4750
$Comp
L evoke-rescue:+3V3-power-evoke-rescue #PWR0116
U 1 1 5EE67968
P 1350 5150
F 0 "#PWR0116" H 1350 5000 50  0001 C CNN
F 1 "+3V3" H 1365 5323 50  0000 C CNN
F 2 "" H 1350 5150 50  0001 C CNN
F 3 "" H 1350 5150 50  0001 C CNN
	1    1350 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 5150 1350 4750
$Comp
L evoke-rescue:C-Device-evoke-rescue C10
U 1 1 5EE6C622
P 2450 5300
F 0 "C10" H 2550 5400 50  0000 L CNN
F 1 "1uF" H 2550 5250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2488 5150 50  0001 C CNN
F 3 "~" H 2450 5300 50  0001 C CNN
F 4 "C28323" H 2450 5300 50  0001 C CNN "LCSC"
	1    2450 5300
	1    0    0    -1  
$EndComp
$Comp
L evoke-rescue:C-Device-evoke-rescue C11
U 1 1 5EE6CA8D
P 2650 5300
F 0 "C11" H 2750 5400 50  0000 L CNN
F 1 "1uF" H 2750 5250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2688 5150 50  0001 C CNN
F 3 "~" H 2650 5300 50  0001 C CNN
F 4 "C28323" H 2650 5300 50  0001 C CNN "LCSC"
	1    2650 5300
	1    0    0    -1  
$EndComp
$Comp
L evoke-rescue:C-Device-evoke-rescue C14
U 1 1 5EE6CDE6
P 2350 5300
F 0 "C14" H 2450 5400 50  0000 L CNN
F 1 "1uF" H 2450 5250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2388 5150 50  0001 C CNN
F 3 "~" H 2350 5300 50  0001 C CNN
F 4 "C28323" H 2350 5300 50  0001 C CNN "LCSC"
	1    2350 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 4750 2450 5150
Wire Wire Line
	2450 5450 2550 5450
Wire Wire Line
	2650 5150 2650 4750
Wire Wire Line
	2550 4750 2550 5450
Connection ~ 2550 5450
Wire Wire Line
	2550 5450 2650 5450
Wire Wire Line
	2250 4750 2250 5450
Wire Wire Line
	2250 5450 2350 5450
Wire Wire Line
	2350 5150 2350 4750
$Comp
L evoke-rescue:C-Device-evoke-rescue C15
U 1 1 5EE89AEF
P 1750 5000
F 0 "C15" H 1850 5100 50  0000 L CNN
F 1 "1uF" H 1850 4950 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1788 4850 50  0001 C CNN
F 3 "~" H 1750 5000 50  0001 C CNN
F 4 "C28323" H 1750 5000 50  0001 C CNN "LCSC"
	1    1750 5000
	1    0    0    -1  
$EndComp
$Comp
L evoke-rescue:C-Device-evoke-rescue C16
U 1 1 5EE89ECA
P 1850 5000
F 0 "C16" H 1950 5100 50  0000 L CNN
F 1 "1uF" H 1950 4950 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1888 4850 50  0001 C CNN
F 3 "~" H 1850 5000 50  0001 C CNN
F 4 "C28323" H 1850 5000 50  0001 C CNN "LCSC"
	1    1850 5000
	1    0    0    -1  
$EndComp
$Comp
L evoke-rescue:C-Device-evoke-rescue C17
U 1 1 5EE8A211
P 1950 5000
F 0 "C17" H 2050 5100 50  0000 L CNN
F 1 "1uF" H 2050 4950 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1988 4850 50  0001 C CNN
F 3 "~" H 1950 5000 50  0001 C CNN
F 4 "C28323" H 1950 5000 50  0001 C CNN "LCSC"
	1    1950 5000
	1    0    0    -1  
$EndComp
$Comp
L evoke-rescue:C-Device-evoke-rescue C18
U 1 1 5EE8A560
P 2050 5000
F 0 "C18" H 2150 5100 50  0000 L CNN
F 1 "1uF" H 2150 4950 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2088 4850 50  0001 C CNN
F 3 "~" H 2050 5000 50  0001 C CNN
F 4 "C28323" H 2050 5000 50  0001 C CNN "LCSC"
	1    2050 5000
	1    0    0    -1  
$EndComp
$Comp
L evoke-rescue:C-Device-evoke-rescue C19
U 1 1 5EE8A857
P 2150 5000
F 0 "C19" H 2250 5100 50  0000 L CNN
F 1 "1uF" H 2250 4950 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2188 4850 50  0001 C CNN
F 3 "~" H 2150 5000 50  0001 C CNN
F 4 "C28323" H 2150 5000 50  0001 C CNN "LCSC"
	1    2150 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 5150 1850 5150
Wire Wire Line
	1950 5150 1850 5150
Connection ~ 1850 5150
Wire Wire Line
	1950 5150 2000 5150
Connection ~ 1950 5150
Wire Wire Line
	2150 5150 2050 5150
Connection ~ 2050 5150
$Comp
L evoke-rescue:GND-power-evoke-rescue #PWR0117
U 1 1 5EEA0155
P 2000 5250
F 0 "#PWR0117" H 2000 5000 50  0001 C CNN
F 1 "GND" H 2005 5077 50  0000 C CNN
F 2 "" H 2000 5250 50  0001 C CNN
F 3 "" H 2000 5250 50  0001 C CNN
	1    2000 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 5250 2000 5150
Connection ~ 2000 5150
Wire Wire Line
	2000 5150 2050 5150
Wire Wire Line
	1750 4850 1750 4750
Wire Wire Line
	1850 4750 1850 4850
Wire Wire Line
	1950 4850 1950 4750
Wire Wire Line
	2050 4850 2050 4750
Wire Wire Line
	2150 4750 2150 4850
Text GLabel 4900 6650 0    50   Input ~ 0
LCD_BACKLIGHT_PWM
$Comp
L evoke-rescue:R-Device-evoke-rescue R2
U 1 1 5EEC6AFE
P 5050 6650
F 0 "R2" V 4843 6650 50  0000 C CNN
F 1 "500R" V 4934 6650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4980 6650 50  0001 C CNN
F 3 "" H 5050 6650 50  0001 C CNN
	1    5050 6650
	0    1    1    0   
$EndComp
$Comp
L evoke-rescue:R-Device-evoke-rescue R4
U 1 1 5EEC7169
P 5200 6800
F 0 "R4" H 5270 6846 50  0000 L CNN
F 1 "200K" H 5270 6755 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5130 6800 50  0001 C CNN
F 3 "" H 5200 6800 50  0001 C CNN
	1    5200 6800
	1    0    0    -1  
$EndComp
$Comp
L evoke-rescue:GND-power-evoke-rescue #PWR0118
U 1 1 5EEC7947
P 5200 6950
F 0 "#PWR0118" H 5200 6700 50  0001 C CNN
F 1 "GND-power" H 5205 6777 50  0000 C CNN
F 2 "" H 5200 6950 50  0001 C CNN
F 3 "" H 5200 6950 50  0001 C CNN
	1    5200 6950
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GSD Q1
U 1 1 5EE207E4
P 5400 6650
F 0 "Q1" H 5604 6696 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 5604 6605 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5600 6750 50  0001 C CNN
F 3 "~" H 5400 6650 50  0001 C CNN
F 4 "C347475" H 5400 6650 50  0001 C CNN "LCSC"
	1    5400 6650
	1    0    0    -1  
$EndComp
Connection ~ 5200 6650
Wire Wire Line
	5500 6850 5500 6950
Wire Wire Line
	5500 6950 5200 6950
Connection ~ 5200 6950
$Comp
L Connector:Conn_01x02_Male J2
U 1 1 5EE275C9
P 5300 6150
F 0 "J2" H 5408 6331 50  0000 C CNN
F 1 "BACKLIGHT_CONN" H 5408 6240 50  0000 C CNN
F 2 "Connector_JST:JST_PH_S2B-PH-SM4-TB_1x02-1MP_P2.00mm_Horizontal" H 5300 6150 50  0001 C CNN
F 3 "~" H 5300 6150 50  0001 C CNN
	1    5300 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 6250 5500 6450
$Comp
L evoke-rescue:+3V3-power-evoke-rescue #PWR0124
U 1 1 5EE2DC24
P 5500 6150
F 0 "#PWR0124" H 5500 6000 50  0001 C CNN
F 1 "+3V3" H 5515 6323 50  0000 C CNN
F 2 "" H 5500 6150 50  0001 C CNN
F 3 "" H 5500 6150 50  0001 C CNN
	1    5500 6150
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT VR_CONTRAST1
U 1 1 5EE54EEE
P 4100 2700
F 0 "VR_CONTRAST1" H 4030 2746 50  0000 R CNN
F 1 "100K" H 4030 2655 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Vishay_T73YP_Vertical" H 4100 2700 50  0001 C CNN
F 3 "~" H 4100 2700 50  0001 C CNN
	1    4100 2700
	1    0    0    -1  
$EndComp
$Comp
L evoke-rescue:GND-power-evoke-rescue #PWR0125
U 1 1 5EE61329
P 4100 2850
F 0 "#PWR0125" H 4100 2600 50  0001 C CNN
F 1 "GND" H 4105 2677 50  0000 C CNN
F 2 "" H 4100 2850 50  0001 C CNN
F 3 "" H 4100 2850 50  0001 C CNN
	1    4100 2850
	1    0    0    -1  
$EndComp
$Comp
L evoke-rescue:+3V3-power-evoke-rescue #PWR0126
U 1 1 5EE61F3D
P 4100 2550
F 0 "#PWR0126" H 4100 2400 50  0001 C CNN
F 1 "+3V3" H 4115 2723 50  0000 C CNN
F 2 "" H 4100 2550 50  0001 C CNN
F 3 "" H 4100 2550 50  0001 C CNN
	1    4100 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 2700 5050 2700
$Comp
L Connector:Conn_01x02_Male J3
U 1 1 5EE68371
P 6200 6150
F 0 "J3" H 6308 6331 50  0000 C CNN
F 1 "SUPP_PWR" H 6308 6240 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 6200 6150 50  0001 C CNN
F 3 "~" H 6200 6150 50  0001 C CNN
	1    6200 6150
	1    0    0    -1  
$EndComp
$Comp
L evoke-rescue:GND-power-evoke-rescue #PWR0127
U 1 1 5EE6922E
P 6500 6400
F 0 "#PWR0127" H 6500 6150 50  0001 C CNN
F 1 "GND-power" H 6505 6227 50  0000 C CNN
F 2 "" H 6500 6400 50  0001 C CNN
F 3 "" H 6500 6400 50  0001 C CNN
	1    6500 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 6250 6500 6250
Wire Wire Line
	6500 6250 6500 6400
$Comp
L evoke-rescue:+3V3-power-evoke-rescue #PWR0128
U 1 1 5EE70256
P 6500 6000
F 0 "#PWR0128" H 6500 5850 50  0001 C CNN
F 1 "+3V3" H 6515 6173 50  0000 C CNN
F 2 "" H 6500 6000 50  0001 C CNN
F 3 "" H 6500 6000 50  0001 C CNN
	1    6500 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 6000 6500 6150
Wire Wire Line
	6500 6150 6400 6150
Text GLabel 5050 2800 0    50   Input ~ 0
LCD_BACKLIGHT_PWM
Text Notes 700  5550 0    50   ~ 0
https://www.buydisplay.com/blue-2-6-inch-128x64-cog-lcd-module-display-with-touch-panel-serial-spi
Wire Wire Line
	1450 4750 1500 4750
Wire Wire Line
	1500 4750 1550 4750
Connection ~ 1500 4750
$EndSCHEMATC
