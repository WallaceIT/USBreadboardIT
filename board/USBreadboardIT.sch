EESchema Schematic File Version 2
LIBS:power
LIBS:analog_devices
LIBS:blackboxes
LIBS:cirrus
LIBS:connectors
LIBS:device
LIBS:diode
LIBS:dspic
LIBS:lineartech
LIBS:maxim
LIBS:microchip
LIBS:microchip_custom
LIBS:mosfet
LIBS:national
LIBS:ON_semiconductor
LIBS:raspberrypi
LIBS:rcl
LIBS:relays
LIBS:switches
LIBS:tbloc
LIBS:TI
LIBS:transistors
LIBS:ttlieee
LIBS:SquareInchProject-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "USBreadboardIT"
Date "2015-10-03"
Rev ""
Comp "Francesco Valla"
Comment1 "OSHW License"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L +5V #PWR01
U 1 1 560FB55E
P 8400 1900
F 0 "#PWR01" H 8400 1990 20  0001 C CNN
F 1 "+5V" H 8400 1990 30  0000 C CNN
F 2 "" H 8400 1900 60  0000 C CNN
F 3 "" H 8400 1900 60  0000 C CNN
	1    8400 1900
	1    0    0    -1  
$EndComp
$Comp
L USB J1
U 1 1 560FB5C5
P 8700 2150
F 0 "J1" H 8500 2400 60  0000 C CNN
F 1 "USB" H 8850 2400 60  0000 C CNN
F 2 "Connect:USB_Mini-B" H 8700 2150 60  0001 C CNN
F 3 "" H 8700 2150 60  0000 C CNN
	1    8700 2150
	0    1    1    0   
$EndComp
$Comp
L GND #PWR02
U 1 1 560FB668
P 8400 2400
F 0 "#PWR02" H 8400 2350 30  0001 C CNN
F 1 "GND" H 8400 2280 30  0001 C CNN
F 2 "" H 8400 2400 60  0000 C CNN
F 3 "" H 8400 2400 60  0000 C CNN
	1    8400 2400
	1    0    0    -1  
$EndComp
Text Label 8200 2100 0    60   ~ 0
D-
Text Label 8200 2200 0    60   ~ 0
D+
$Comp
L HEADER_2x2 J2
U 1 1 560FBE4D
P 8750 4050
F 0 "J2" H 8750 4200 60  0000 C CNN
F 1 "HEADER_2x2" H 8750 3900 60  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x02" H 8750 4050 60  0001 C CNN
F 3 "" H 8750 4050 60  0000 C CNN
	1    8750 4050
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR03
U 1 1 560FBFA0
P 8500 3900
F 0 "#PWR03" H 8500 3990 20  0001 C CNN
F 1 "+5V" H 8500 3990 30  0000 C CNN
F 2 "" H 8500 3900 60  0000 C CNN
F 3 "" H 8500 3900 60  0000 C CNN
	1    8500 3900
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR04
U 1 1 560FC08D
P 9000 3900
F 0 "#PWR04" H 9000 4000 30  0001 C CNN
F 1 "VDD" H 9000 4010 30  0000 C CNN
F 2 "" H 9000 3900 60  0000 C CNN
F 3 "" H 9000 3900 60  0000 C CNN
	1    9000 3900
	1    0    0    -1  
$EndComp
Text Label 8300 4100 0    60   ~ 0
REG_IN
Text Label 9200 4100 2    60   ~ 0
REG_OUT
Text Label 7850 5050 0    60   ~ 0
REG_IN
Text Label 9650 5050 2    60   ~ 0
REG_OUT
$Comp
L GND #PWR05
U 1 1 560FC2C0
P 6200 5100
F 0 "#PWR05" H 6200 5050 30  0001 C CNN
F 1 "GND" H 6200 4980 30  0001 C CNN
F 2 "" H 6200 5100 60  0000 C CNN
F 3 "" H 6200 5100 60  0000 C CNN
	1    6200 5100
	1    0    0    -1  
$EndComp
$Comp
L C_EU C4
U 1 1 560FC48B
P 5900 4750
F 0 "C4" H 5960 4815 50  0000 L BNN
F 1 "100n" H 5960 4615 50  0000 L BNN
F 2 "Capacitors_SMD:C_0805" H 5900 4750 60  0001 C CNN
F 3 "" H 5900 4750 60  0000 C CNN
	1    5900 4750
	1    0    0    -1  
$EndComp
$Comp
L C_EU C3
U 1 1 560FC591
P 9350 5300
F 0 "C3" H 9410 5365 50  0000 L BNN
F 1 "1u" H 9410 5165 50  0000 L BNN
F 2 "Capacitors_SMD:C_0805" H 9350 5300 60  0001 C CNN
F 3 "" H 9350 5300 60  0000 C CNN
	1    9350 5300
	1    0    0    -1  
$EndComp
$Comp
L C_EU C2
U 1 1 560FCB27
P 8150 5300
F 0 "C2" H 8210 5365 50  0000 L BNN
F 1 "1u" H 8210 5165 50  0000 L BNN
F 2 "Capacitors_SMD:C_0805" H 8150 5300 60  0001 C CNN
F 3 "" H 8150 5300 60  0000 C CNN
	1    8150 5300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 560FCE0F
P 8750 5700
F 0 "#PWR06" H 8750 5650 30  0001 C CNN
F 1 "GND" H 8750 5580 30  0001 C CNN
F 2 "" H 8750 5700 60  0000 C CNN
F 3 "" H 8750 5700 60  0000 C CNN
	1    8750 5700
	1    0    0    -1  
$EndComp
$Comp
L R_EU R2
U 1 1 560FD28C
P 3300 4200
F 0 "R2" H 3150 4259 50  0000 L BNN
F 1 "100R" H 3300 4250 50  0000 L BNN
F 2 "Resistors_SMD:R_0805" H 3300 4200 60  0001 C CNN
F 3 "" H 3300 4200 60  0000 C CNN
	1    3300 4200
	1    0    0    -1  
$EndComp
$Comp
L R_EU R1
U 1 1 560FD399
P 2900 3700
F 0 "R1" H 2750 3759 50  0000 L BNN
F 1 "10k" H 2900 3750 50  0000 L BNN
F 2 "Resistors_SMD:R_0805" H 2900 3700 60  0001 C CNN
F 3 "" H 2900 3700 60  0000 C CNN
	1    2900 3700
	0    -1   -1   0   
$EndComp
$Comp
L VDD #PWR07
U 1 1 560FD415
P 2900 3400
F 0 "#PWR07" H 2900 3500 30  0001 C CNN
F 1 "VDD" H 2900 3510 30  0000 C CNN
F 2 "" H 2900 3400 60  0000 C CNN
F 3 "" H 2900 3400 60  0000 C CNN
	1    2900 3400
	1    0    0    -1  
$EndComp
$Comp
L C_EU C1
U 1 1 560FD43B
P 2900 4450
F 0 "C1" H 2960 4515 50  0000 L BNN
F 1 "100n" H 2960 4315 50  0000 L BNN
F 2 "Capacitors_SMD:C_0805" H 2900 4450 60  0001 C CNN
F 3 "" H 2900 4450 60  0000 C CNN
	1    2900 4450
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 560FF4D3
P 8900 2500
F 0 "#PWR08" H 8900 2450 30  0001 C CNN
F 1 "GND" H 8900 2380 30  0001 C CNN
F 2 "" H 8900 2500 60  0000 C CNN
F 3 "" H 8900 2500 60  0000 C CNN
	1    8900 2500
	1    0    0    -1  
$EndComp
Text Label 3500 3200 1    60   ~ 0
PGC
Text Label 3400 3200 1    60   ~ 0
PGD
$Comp
L GND #PWR09
U 1 1 560FC942
P 3300 3100
F 0 "#PWR09" H 3300 3050 30  0001 C CNN
F 1 "GND" H 3300 2980 30  0001 C CNN
F 2 "" H 3300 3100 60  0000 C CNN
F 3 "" H 3300 3100 60  0000 C CNN
	1    3300 3100
	1    0    0    -1  
$EndComp
$Comp
L PIC16F1454 U1
U 1 1 560FCE86
P 5000 4200
F 0 "U1" H 5000 4630 50  0000 C CNN
F 1 "PIC16F1454" H 5000 4700 50  0000 C CNN
F 2 "Housings_SOIC:SOIC-14_3.9x8.7mm_Pitch1.27mm" H 5000 4200 60  0001 C CNN
F 3 "" H 5000 4200 60  0000 C CNN
	1    5000 4200
	1    0    0    -1  
$EndComp
Text Label 6100 4000 2    60   ~ 0
D+
Text Label 6100 4100 2    60   ~ 0
D-
$Comp
L VDD #PWR010
U 1 1 560FE57E
P 4100 3800
F 0 "#PWR010" H 4100 3900 30  0001 C CNN
F 1 "VDD" H 4100 3910 30  0000 C CNN
F 2 "" H 4100 3800 60  0000 C CNN
F 3 "" H 4100 3800 60  0000 C CNN
	1    4100 3800
	1    0    0    -1  
$EndComp
$Comp
L HEADER_7 J5
U 1 1 560FEC67
P 6600 4200
F 0 "J5" H 6600 4600 60  0000 C CNN
F 1 "HEADER_7" H 6600 3800 60  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x07" H 6600 4200 60  0001 C CNN
F 3 "" H 6600 4200 60  0000 C CNN
	1    6600 4200
	1    0    0    -1  
$EndComp
$Comp
L HEADER_7 J4
U 1 1 560FFABC
P 3800 4200
F 0 "J4" H 3800 4600 60  0000 C CNN
F 1 "HEADER_7" H 3800 3800 60  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x07" H 3800 4200 60  0001 C CNN
F 3 "" H 3800 4200 60  0000 C CNN
	1    3800 4200
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR011
U 1 1 561008FE
P 2900 4800
F 0 "#PWR011" H 2900 4750 30  0001 C CNN
F 1 "GND" H 2900 4680 30  0001 C CNN
F 2 "" H 2900 4800 60  0000 C CNN
F 3 "" H 2900 4800 60  0000 C CNN
	1    2900 4800
	1    0    0    -1  
$EndComp
Text Label 6100 4400 2    60   ~ 0
PGC
Text Label 6100 4300 2    60   ~ 0
PGD
$Comp
L ICSP_06 J3
U 1 1 56102A2A
P 3350 2700
F 0 "J3" H 3350 3050 60  0000 C CNN
F 1 "ICSP_06" H 3350 2300 60  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06" H 2800 2700 60  0001 C CNN
F 3 "" H 2800 2700 60  0000 C CNN
	1    3350 2700
	0    -1   -1   0   
$EndComp
$Comp
L LED D2
U 1 1 56103421
P 4450 3300
F 0 "D2" H 4650 3200 60  0000 C CNN
F 1 "LED" H 4600 3450 60  0000 C CNN
F 2 "LEDs:LED-0805" H 4450 3300 60  0001 C CNN
F 3 "" H 4450 3300 60  0000 C CNN
	1    4450 3300
	0    1    1    0   
$EndComp
$Comp
L LED D1
U 1 1 56103869
P 4450 3100
F 0 "D1" H 4650 3000 60  0000 C CNN
F 1 "LED" H 4600 3250 60  0000 C CNN
F 2 "LEDs:LED-0805" H 4450 3100 60  0001 C CNN
F 3 "" H 4450 3100 60  0000 C CNN
	1    4450 3100
	0    1    1    0   
$EndComp
$Comp
L VDD #PWR012
U 1 1 56103903
P 4200 3000
F 0 "#PWR012" H 4200 3100 30  0001 C CNN
F 1 "VDD" H 4200 3110 30  0000 C CNN
F 2 "" H 4200 3000 60  0000 C CNN
F 3 "" H 4200 3000 60  0000 C CNN
	1    4200 3000
	1    0    0    -1  
$EndComp
$Comp
L R_EU R3
U 1 1 56103A4B
P 4900 3100
F 0 "R3" H 4750 3159 50  0000 L BNN
F 1 "5k" H 4900 3150 50  0000 L BNN
F 2 "Resistors_SMD:R_0805" H 4900 3100 60  0001 C CNN
F 3 "" H 4900 3100 60  0000 C CNN
	1    4900 3100
	1    0    0    -1  
$EndComp
$Comp
L R_EU R4
U 1 1 56103AD5
P 4900 3300
F 0 "R4" H 4750 3359 50  0000 L BNN
F 1 "5k" H 4900 3350 50  0000 L BNN
F 2 "Resistors_SMD:R_0805" H 4900 3300 60  0001 C CNN
F 3 "" H 4900 3300 60  0000 C CNN
	1    4900 3300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR013
U 1 1 56103E69
P 5200 3400
F 0 "#PWR013" H 5200 3350 30  0001 C CNN
F 1 "GND" H 5200 3280 30  0001 C CNN
F 2 "" H 5200 3400 60  0000 C CNN
F 3 "" H 5200 3400 60  0000 C CNN
	1    5200 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 2000 8400 2000
Wire Wire Line
	8400 2000 8400 1900
Wire Wire Line
	8500 2100 8200 2100
Wire Wire Line
	8200 2200 8500 2200
Wire Wire Line
	8500 2300 8400 2300
Wire Wire Line
	8400 2300 8400 2400
Wire Wire Line
	8600 4000 8500 4000
Wire Wire Line
	8500 4000 8500 3900
Wire Wire Line
	8900 4000 9000 4000
Wire Wire Line
	9000 4000 9000 3900
Wire Wire Line
	8600 4100 8300 4100
Wire Wire Line
	8900 4100 9200 4100
Wire Wire Line
	9250 5050 9650 5050
Wire Wire Line
	7850 5050 8250 5050
Wire Wire Line
	9350 5150 9350 5050
Connection ~ 9350 5050
Wire Wire Line
	8750 5450 8750 5700
Wire Wire Line
	8150 5600 9350 5600
Wire Wire Line
	9350 5600 9350 5450
Connection ~ 8750 5600
Wire Wire Line
	8150 5050 8150 5150
Connection ~ 8150 5050
Wire Wire Line
	8150 5450 8150 5600
Wire Wire Line
	3500 4200 4200 4200
Wire Wire Line
	2600 4200 3100 4200
Wire Wire Line
	2900 3900 2900 4300
Wire Wire Line
	2900 3500 2900 3400
Connection ~ 2900 4000
Wire Wire Line
	3100 2900 3100 4000
Wire Wire Line
	3300 2900 3300 3100
Wire Wire Line
	5800 3900 6500 3900
Wire Wire Line
	3900 3900 4200 3900
Wire Wire Line
	4100 3900 4100 3800
Wire Wire Line
	5800 4300 6500 4300
Wire Wire Line
	6500 4400 5800 4400
Wire Wire Line
	5800 4500 6500 4500
Wire Wire Line
	6200 3900 6200 5100
Connection ~ 6200 3900
Wire Wire Line
	6500 4200 6200 4200
Connection ~ 6200 4200
Wire Wire Line
	5800 4200 5900 4200
Wire Wire Line
	5900 4200 5900 4600
Wire Wire Line
	5900 4900 5900 5000
Wire Wire Line
	5900 5000 6200 5000
Connection ~ 6200 5000
Connection ~ 4100 3900
Wire Wire Line
	3900 4000 4200 4000
Wire Wire Line
	4200 4100 3900 4100
Wire Wire Line
	3900 4300 4200 4300
Wire Wire Line
	4200 4400 3900 4400
Wire Wire Line
	3900 4500 4200 4500
Connection ~ 3900 4200
Wire Wire Line
	3100 4000 2900 4000
Connection ~ 2900 4200
Wire Wire Line
	2900 4600 2900 4800
Wire Wire Line
	3500 2900 3500 3200
Wire Wire Line
	3400 2900 3400 3200
Wire Wire Line
	5800 4000 6100 4000
Wire Wire Line
	5800 4100 6300 4100
Wire Wire Line
	6300 4100 6300 4000
Wire Wire Line
	6300 4000 6500 4000
Connection ~ 4000 4000
Wire Wire Line
	4000 4000 4000 3300
Wire Wire Line
	4000 3300 4300 3300
Wire Wire Line
	4300 3100 4200 3100
Wire Wire Line
	4200 3100 4200 3000
Wire Wire Line
	4600 3300 4700 3300
Wire Wire Line
	4600 3100 4700 3100
Wire Wire Line
	5100 3100 5200 3100
Wire Wire Line
	5200 3100 5200 3400
Wire Wire Line
	5200 3300 5100 3300
Connection ~ 5200 3300
Wire Wire Line
	6100 4000 6100 3700
Wire Wire Line
	6100 3700 6800 3700
Wire Wire Line
	6800 3700 6800 4100
Wire Wire Line
	6800 4100 6500 4100
$Comp
L TACTILE_SWITCH_HORIZONTAL SW1
U 1 1 56124139
P 2400 4200
F 0 "SW1" H 2400 4450 60  0000 C CNN
F 1 "Reset" H 2400 4350 60  0000 C CNN
F 2 "Buttons_Switches_SMD:SW_SPST_PTS645" H 2400 4200 60  0001 C CNN
F 3 "" H 2400 4200 60  0000 C CNN
	1    2400 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 4200 2100 4200
Wire Wire Line
	2100 4200 2100 4700
Wire Wire Line
	2100 4700 2900 4700
Connection ~ 2900 4700
Wire Wire Line
	2200 4300 2200 4200
Wire Wire Line
	2600 4300 2600 4200
Connection ~ 2200 4200
Connection ~ 2600 4200
$Comp
L C_EU C5
U 1 1 561266BD
P 9800 4150
F 0 "C5" H 9860 4215 50  0000 L BNN
F 1 "10u" H 9860 4015 50  0000 L BNN
F 2 "Capacitors_SMD:C_0805" H 9800 4150 60  0001 C CNN
F 3 "" H 9800 4150 60  0000 C CNN
	1    9800 4150
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR014
U 1 1 561268A7
P 9800 3900
F 0 "#PWR014" H 9800 4000 30  0001 C CNN
F 1 "VDD" H 9800 4010 30  0000 C CNN
F 2 "" H 9800 3900 60  0000 C CNN
F 3 "" H 9800 3900 60  0000 C CNN
	1    9800 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 4000 9800 3900
Wire Wire Line
	9800 4300 9800 4400
$Comp
L GND #PWR015
U 1 1 56126B4E
P 9800 4400
F 0 "#PWR015" H 9800 4350 30  0001 C CNN
F 1 "GND" H 9800 4280 30  0001 C CNN
F 2 "" H 9800 4400 60  0000 C CNN
F 3 "" H 9800 4400 60  0000 C CNN
	1    9800 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 2900 3200 3000
$Comp
L VDD #PWR016
U 1 1 56128F12
P 3200 3000
F 0 "#PWR016" H 3200 3100 30  0001 C CNN
F 1 "VDD" H 3200 3110 30  0000 C CNN
F 2 "" H 3200 3000 60  0000 C CNN
F 3 "" H 3200 3000 60  0000 C CNN
	1    3200 3000
	-1   0    0    1   
$EndComp
$Comp
L MCP1700_sot23 U2
U 1 1 56129BEB
P 8750 5050
F 0 "U2" H 8750 5400 60  0000 C CNN
F 1 "MCP1700_sot23" H 8750 5300 60  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 8750 5050 60  0001 C CNN
F 3 "" H 8750 5050 60  0000 C CNN
	1    8750 5050
	1    0    0    -1  
$EndComp
$EndSCHEMATC
