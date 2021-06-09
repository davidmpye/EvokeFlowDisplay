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
L evoke-rescue:GND-power #PWR0107
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
L evoke-rescue:Conn_01x08-Connector_Generic INPUT_CONN1
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
L evoke-rescue:Conn_01x30-Connector_Generic LCD_CONN1
U 1 1 5EA08ED1
P 3100 4800
F 0 "LCD_CONN1" V 3317 4746 50  0000 C CNN
F 1 "Conn_01x30" V 3226 4746 50  0000 C CNN
F 2 "Connector_FFC-FPC:Hirose_FH12-30S-0.5SH_1x30-1MP_P0.50mm_Horizontal" H 3100 4800 50  0001 C CNN
F 3 "~" H 3100 4800 50  0001 C CNN
	1    3100 4800
	0    1    -1   0   
$EndComp
$Comp
L evoke-rescue:+3V3-power #PWR0106
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
L evoke-rescue:+3V3-power #PWR0109
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
L evoke-rescue:GND-power #PWR0110
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
L evoke-rescue:R-Device R1
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
L evoke-rescue:GND-power #PWR0111
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
L evoke-rescue:C-Device C9
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
	1700 5000 1700 5300
Wire Wire Line
	2000 5000 2000 5300
Wire Wire Line
	2100 5000 2100 5300
Wire Wire Line
	2200 5000 2200 5300
Wire Wire Line
	2300 5000 2300 5300
Wire Wire Line
	2400 5000 2400 5300
Wire Wire Line
	4500 5000 4500 5250
Wire Wire Line
	2600 5000 2600 5300
Wire Wire Line
	2700 5000 2700 5300
Wire Wire Line
	2800 5000 2800 5300
Wire Wire Line
	2900 5000 2900 5300
Wire Wire Line
	3000 5000 3000 5300
Wire Wire Line
	3100 5000 3100 5300
Wire Wire Line
	4400 5000 4400 5250
Wire Wire Line
	4200 5000 4200 5250
Wire Wire Line
	3600 5000 3600 5250
Wire Wire Line
	3500 5000 3500 5250
Wire Wire Line
	3400 5000 3400 5250
Wire Wire Line
	3200 5000 3200 5300
Wire Wire Line
	1600 5000 1600 5300
$Comp
L evoke-rescue:GND-power #PWR0101
U 1 1 5EAB5C92
P 1600 5300
F 0 "#PWR0101" H 1600 5050 50  0001 C CNN
F 1 "GND" H 1605 5127 50  0000 C CNN
F 2 "" H 1600 5300 50  0001 C CNN
F 3 "" H 1600 5300 50  0001 C CNN
	1    1600 5300
	1    0    0    -1  
$EndComp
Text GLabel 2600 5300 3    50   Input ~ 0
LCD_DATA
Text GLabel 2700 5300 3    50   Input ~ 0
LCD_SCK
Text GLabel 1700 5300 3    50   Input ~ 0
VCC
Text GLabel 3000 5300 3    50   Input ~ 0
LCD_D_C
Text GLabel 3100 5300 3    50   Input ~ 0
LCD_RST
Text GLabel 3200 5300 3    50   Input ~ 0
LCD_CS
$Comp
L evoke-rescue:GND-power #PWR0103
U 1 1 5EABAA37
P 3500 5250
F 0 "#PWR0103" H 3500 5000 50  0001 C CNN
F 1 "GND" H 3505 5077 50  0000 C CNN
F 2 "" H 3500 5250 50  0001 C CNN
F 3 "" H 3500 5250 50  0001 C CNN
	1    3500 5250
	1    0    0    -1  
$EndComp
$Comp
L evoke-rescue:+3V3-power #PWR0105
U 1 1 5EABCA46
P 4200 5250
F 0 "#PWR0105" H 4200 5100 50  0001 C CNN
F 1 "+3V3" H 4215 5423 50  0000 C CNN
F 2 "" H 4200 5250 50  0001 C CNN
F 3 "" H 4200 5250 50  0001 C CNN
	1    4200 5250
	1    0    0    -1  
$EndComp
$Comp
L evoke-rescue:R-Device R2
U 1 1 5EABCFCA
P 1900 5150
F 0 "R2" H 1970 5196 50  0000 L CNN
F 1 "1.2M" H 1970 5105 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1830 5150 50  0001 C CNN
F 3 "~" H 1900 5150 50  0001 C CNN
F 4 "C17380" H 1900 5150 50  0001 C CNN "LCSC"
	1    1900 5150
	1    0    0    -1  
$EndComp
$Comp
L evoke-rescue:GND-power #PWR0108
U 1 1 5EABD732
P 1800 6050
F 0 "#PWR0108" H 1800 5800 50  0001 C CNN
F 1 "GND" H 1805 5877 50  0000 C CNN
F 2 "" H 1800 6050 50  0001 C CNN
F 3 "" H 1800 6050 50  0001 C CNN
	1    1800 6050
	1    0    0    -1  
$EndComp
$Comp
L evoke-rescue:CP-Device C1
U 1 1 5EABDE1F
P 1800 5900
F 0 "C1" H 1918 5946 50  0000 L CNN
F 1 "4.7uF" H 1918 5855 50  0000 L CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-3216-18_Kemet-A" H 1838 5750 50  0001 C CNN
F 3 "~" H 1800 5900 50  0001 C CNN
F 4 "C161817" H 1800 5900 50  0001 C CNN "LCSC"
	1    1800 5900
	1    0    0    -1  
$EndComp
$Comp
L evoke-rescue:GND-power #PWR0116
U 1 1 5EAC0D2A
P 2200 5300
F 0 "#PWR0116" H 2200 5050 50  0001 C CNN
F 1 "GND" H 2205 5127 50  0000 C CNN
F 2 "" H 2200 5300 50  0001 C CNN
F 3 "" H 2200 5300 50  0001 C CNN
	1    2200 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 5300 2100 5300
Wire Wire Line
	2100 5300 2200 5300
Connection ~ 2100 5300
Wire Wire Line
	2200 5300 2300 5300
Connection ~ 2200 5300
Wire Wire Line
	2300 5300 2400 5300
Connection ~ 2300 5300
Wire Wire Line
	1900 5300 2000 5300
Connection ~ 2000 5300
Wire Wire Line
	1800 5000 1800 5750
Wire Wire Line
	2800 5300 2850 5300
$Comp
L evoke-rescue:GND-power #PWR0117
U 1 1 5EAD237C
P 2850 5300
F 0 "#PWR0117" H 2850 5050 50  0001 C CNN
F 1 "GND" H 2855 5127 50  0000 C CNN
F 2 "" H 2850 5300 50  0001 C CNN
F 3 "" H 2850 5300 50  0001 C CNN
	1    2850 5300
	1    0    0    -1  
$EndComp
Connection ~ 2850 5300
Wire Wire Line
	2850 5300 2900 5300
Wire Wire Line
	4400 5250 4450 5250
$Comp
L evoke-rescue:GND-power #PWR0118
U 1 1 5EAD4917
P 4450 5250
F 0 "#PWR0118" H 4450 5000 50  0001 C CNN
F 1 "GND" H 4455 5077 50  0000 C CNN
F 2 "" H 4450 5250 50  0001 C CNN
F 3 "" H 4450 5250 50  0001 C CNN
	1    4450 5250
	1    0    0    -1  
$EndComp
Connection ~ 4450 5250
Wire Wire Line
	4450 5250 4500 5250
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
L evoke-rescue:STM32F103C8Tx-MCU_ST_STM32F1 U1
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
L evoke-rescue:CP-Device C2
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
L evoke-rescue:GND-power #PWR0119
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
L evoke-rescue:C-Device C3
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
L evoke-rescue:C-Device C4
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
L evoke-rescue:C-Device C5
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
L evoke-rescue:C-Device C6
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
L evoke-rescue:C-Device C7
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
L evoke-rescue:GND-power #PWR0120
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
L evoke-rescue:C-Device C8
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
L evoke-rescue:GND-power #PWR0121
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
L evoke-rescue:GND-power #PWR0112
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
L evoke-rescue:+3V3-power #PWR0113
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
L evoke-rescue:Conn_01x05-Connector_Generic ST_LINK1
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
L evoke-rescue:R-Device R3
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
	3400 5250 3500 5250
Connection ~ 3500 5250
Wire Wire Line
	4200 5250 3600 5250
Connection ~ 4200 5250
Wire Wire Line
	6350 3600 6550 3600
Wire Wire Line
	6350 3700 6550 3700
Text GLabel 6550 3600 2    50   Input ~ 0
USART1_TX
Text GLabel 6550 3700 2    50   Input ~ 0
USART1_RX
$Comp
L evoke-rescue:Conn_01x03_Male-Connector J1
U 1 1 5ED86F10
P 5550 5700
F 0 "J1" H 5658 5981 50  0000 C CNN
F 1 "Conn_01x03_Male" H 5658 5890 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 5550 5700 50  0001 C CNN
F 3 "~" H 5550 5700 50  0001 C CNN
	1    5550 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 5600 6050 5600
Wire Wire Line
	5750 5700 6050 5700
Wire Wire Line
	5750 5800 6050 5800
$Comp
L evoke-rescue:GND-power #PWR0102
U 1 1 5ED93166
P 6050 5800
F 0 "#PWR0102" H 6050 5550 50  0001 C CNN
F 1 "GND" H 6055 5627 50  0000 C CNN
F 2 "" H 6050 5800 50  0001 C CNN
F 3 "" H 6050 5800 50  0001 C CNN
	1    6050 5800
	1    0    0    -1  
$EndComp
Text GLabel 6050 5600 2    50   Input ~ 0
USART1_TX
Text GLabel 6050 5700 2    50   Input ~ 0
USART1_RX
$Comp
L evoke-rescue:C-Device C10
U 1 1 5ED7135E
P 1950 6650
F 0 "C10" H 1750 6700 50  0000 L CNN
F 1 "100nF" H 1650 6600 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1988 6500 50  0001 C CNN
F 3 "~" H 1950 6650 50  0001 C CNN
F 4 "C49678" H 1950 6650 50  0001 C CNN "LCSC"
	1    1950 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 6800 2100 6800
Wire Wire Line
	1950 6500 2100 6500
$Comp
L evoke-rescue:GND-power #PWR0104
U 1 1 5ED7C439
P 2100 6800
F 0 "#PWR0104" H 2100 6550 50  0001 C CNN
F 1 "GND" H 2105 6627 50  0000 C CNN
F 2 "" H 2100 6800 50  0001 C CNN
F 3 "" H 2100 6800 50  0001 C CNN
	1    2100 6800
	1    0    0    -1  
$EndComp
Connection ~ 2100 6800
Wire Wire Line
	2100 6800 2250 6800
Text GLabel 2100 6400 1    50   Input ~ 0
VCC
Wire Wire Line
	2100 6400 2100 6500
Connection ~ 2100 6500
Wire Wire Line
	2100 6500 2250 6500
$Comp
L evoke-rescue:C-Device C12
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
L evoke-rescue:+3V3-power #PWR0114
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
L evoke-rescue:GND-power #PWR0115
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
L evoke-rescue:C-Device C13
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
L evoke-rescue:C-Device C11
U 1 1 5ED738B1
P 2250 6650
F 0 "C11" H 2350 6750 50  0000 L CNN
F 1 "10uF" H 2350 6600 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2288 6500 50  0001 C CNN
F 3 "~" H 2250 6650 50  0001 C CNN
F 4 "C15850" H 2250 6650 50  0001 C CNN "LCSC"
	1    2250 6650
	1    0    0    -1  
$EndComp
$Comp
L evoke-rescue:TestPoint-Connector TP1
U 1 1 5ED9606D
P 8200 3650
F 0 "TP1" H 8258 3768 50  0000 L CNN
F 1 "TestPoint" H 8258 3677 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_1.5x1.5mm_Drill0.7mm" H 8400 3650 50  0001 C CNN
F 3 "~" H 8400 3650 50  0001 C CNN
	1    8200 3650
	1    0    0    -1  
$EndComp
Connection ~ 8200 3650
Wire Wire Line
	8200 3650 8450 3650
$Comp
L evoke-rescue:TestPoint-Connector TP2
U 1 1 5ED9662E
P 8200 3850
F 0 "TP2" H 8258 3968 50  0000 L CNN
F 1 "TestPoint" H 8258 3877 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_1.5x1.5mm_Drill0.7mm" H 8400 3850 50  0001 C CNN
F 3 "~" H 8400 3850 50  0001 C CNN
	1    8200 3850
	1    0    0    -1  
$EndComp
Connection ~ 8200 3850
Wire Wire Line
	8200 3850 8450 3850
$Comp
L evoke-rescue:TestPoint-Connector TP3
U 1 1 5ED969D3
P 8200 4050
F 0 "TP3" H 8258 4168 50  0000 L CNN
F 1 "TestPoint" H 8258 4077 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_1.5x1.5mm_Drill0.7mm" H 8400 4050 50  0001 C CNN
F 3 "~" H 8400 4050 50  0001 C CNN
	1    8200 4050
	1    0    0    -1  
$EndComp
Connection ~ 8200 4050
Wire Wire Line
	8200 4050 8450 4050
$Comp
L evoke-rescue:TestPoint-Connector TP4
U 1 1 5ED96D81
P 8200 4250
F 0 "TP4" H 8258 4368 50  0000 L CNN
F 1 "TestPoint" H 8258 4277 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_1.5x1.5mm_Drill0.7mm" H 8400 4250 50  0001 C CNN
F 3 "~" H 8400 4250 50  0001 C CNN
	1    8200 4250
	1    0    0    -1  
$EndComp
Connection ~ 8200 4250
Wire Wire Line
	8200 4250 8450 4250
$Comp
L evoke-rescue:TestPoint-Connector TP5
U 1 1 5ED97130
P 10000 3650
F 0 "TP5" H 10058 3768 50  0000 L CNN
F 1 "TestPoint" H 10058 3677 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_1.5x1.5mm_Drill0.7mm" H 10200 3650 50  0001 C CNN
F 3 "~" H 10200 3650 50  0001 C CNN
	1    10000 3650
	1    0    0    -1  
$EndComp
Connection ~ 10000 3650
Wire Wire Line
	10000 3650 10150 3650
$Comp
L evoke-rescue:TestPoint-Connector TP6
U 1 1 5ED97530
P 10000 3850
F 0 "TP6" H 10058 3968 50  0000 L CNN
F 1 "TestPoint" H 10058 3877 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_1.5x1.5mm_Drill0.7mm" H 10200 3850 50  0001 C CNN
F 3 "~" H 10200 3850 50  0001 C CNN
	1    10000 3850
	1    0    0    -1  
$EndComp
Connection ~ 10000 3850
Wire Wire Line
	10000 3850 10150 3850
$Comp
L evoke-rescue:TestPoint-Connector TP7
U 1 1 5ED98084
P 10000 4050
F 0 "TP7" H 10058 4168 50  0000 L CNN
F 1 "TestPoint" H 10058 4077 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_1.5x1.5mm_Drill0.7mm" H 10200 4050 50  0001 C CNN
F 3 "~" H 10200 4050 50  0001 C CNN
	1    10000 4050
	1    0    0    -1  
$EndComp
Connection ~ 10000 4050
Wire Wire Line
	10000 4050 9850 4050
$Comp
L evoke-rescue:TestPoint-Connector TP8
U 1 1 5ED9844C
P 10000 4250
F 0 "TP8" H 10058 4368 50  0000 L CNN
F 1 "TestPoint" H 10058 4277 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_1.5x1.5mm_Drill0.7mm" H 10200 4250 50  0001 C CNN
F 3 "~" H 10200 4250 50  0001 C CNN
	1    10000 4250
	1    0    0    -1  
$EndComp
Connection ~ 10000 4250
Wire Wire Line
	10000 4250 10150 4250
$Comp
L evoke-rescue:TestPoint-Connector TP9
U 1 1 5EDB4575
P 8150 5450
F 0 "TP9" H 8208 5568 50  0000 L CNN
F 1 "TestPoint" H 8208 5477 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_1.5x1.5mm_Drill0.7mm" H 8350 5450 50  0001 C CNN
F 3 "~" H 8350 5450 50  0001 C CNN
	1    8150 5450
	1    0    0    -1  
$EndComp
$Comp
L evoke-rescue:TestPoint-Connector TP10
U 1 1 5EDB49DE
P 8800 5450
F 0 "TP10" H 8858 5568 50  0000 L CNN
F 1 "TestPoint" H 8858 5477 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_1.5x1.5mm_Drill0.7mm" H 9000 5450 50  0001 C CNN
F 3 "~" H 9000 5450 50  0001 C CNN
	1    8800 5450
	1    0    0    -1  
$EndComp
$Comp
L evoke-rescue:TestPoint-Connector TP11
U 1 1 5EDB4E21
P 9350 5450
F 0 "TP11" H 9408 5568 50  0000 L CNN
F 1 "TestPoint" H 9408 5477 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_1.5x1.5mm_Drill0.7mm" H 9550 5450 50  0001 C CNN
F 3 "~" H 9550 5450 50  0001 C CNN
	1    9350 5450
	1    0    0    -1  
$EndComp
Text GLabel 8150 5450 3    50   Input ~ 0
VCC
$Comp
L evoke-rescue:+3V3-power #PWR0122
U 1 1 5EDCAEA9
P 8800 5550
F 0 "#PWR0122" H 8800 5400 50  0001 C CNN
F 1 "+3V3" H 8815 5723 50  0000 C CNN
F 2 "" H 8800 5550 50  0001 C CNN
F 3 "" H 8800 5550 50  0001 C CNN
	1    8800 5550
	-1   0    0    1   
$EndComp
$Comp
L evoke-rescue:GND-power #PWR0123
U 1 1 5EDCB476
P 9350 5550
F 0 "#PWR0123" H 9350 5300 50  0001 C CNN
F 1 "GND" H 9355 5377 50  0000 C CNN
F 2 "" H 9350 5550 50  0001 C CNN
F 3 "" H 9350 5550 50  0001 C CNN
	1    9350 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 5550 9350 5450
Wire Wire Line
	8800 5550 8800 5450
$EndSCHEMATC
