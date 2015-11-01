/*
 *  USBreadboardIT device firmware
 *
 *  based on M-Stack by Alan Ott, Signal 11 Software
 *
 *  Copyright (C) 2015 Francesco Valla
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a 
 *  copy of this software and associated documentation files (the "Software"), 
 *  to deal in the Software without restriction, including without limitation 
 *  the rights to use, copy, modify, merge, publish, distribute, sublicense, 
 *  and/or sell copies of the Software, and to permit persons to whom the 
 *  Software is furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in 
 *  all copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
 *  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
 *  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
 *  DEALINGS IN THE SOFTWARE.
*/

#include "usb.h"
#include <xc.h>
#include <string.h>
#include "usb_config.h"
#include "usb_ch9.h"
#include "usb_hid.h"

#ifdef _16F1454
#define DEVICE_ID 0x00
#elif _16F1455
#define DEVICE_ID 0x01
#define HAS_ANALOG
#elif _16F1459
#define DEVICE_ID 0x02
#define HAS_PORTB
#define HAS_ANALOG
#endif

int main(void)
{
	uint8_t *TxDataBuffer;
	const uint8_t *RxDataBuffer;
    uint8_t value = 0;

#ifdef USB_USE_INTERRUPTS
	INTCONbits.PEIE = 1;
	INTCONbits.GIE = 1;
#endif

	usb_init();

	TxDataBuffer = usb_get_in_buffer(1);

	for (;;)
	{
#ifndef USB_USE_INTERRUPTS
		usb_service();
#endif

		/* if USB isn't configured, there is no point in proceeding further */
		if (!usb_is_configured())
			continue;

		/*
		we check these *BEFORE* calling usb_out_endpoint_has_data() as the documentation indicates this 
		must be followed usb_arm_out_endpoint() to enable reception of the next transaction
		*/
		if (usb_in_endpoint_halted(1) || usb_in_endpoint_busy(1))
			continue;

		/* if we pass this test, we are committed to make the usb_arm_out_endpoint() call */
		if (!usb_out_endpoint_has_data(1))
			continue;

		/* obtain a pointer to the receive buffer and the length of data contained within it */
		usb_get_out_buffer(1, &RxDataBuffer);

		/* pre-fill the response with an echo back of the command */
		TxDataBuffer[0] = RxDataBuffer[0];

#ifndef HAS_PORTB
        TxDataBuffer[2] = 0xFF;
#endif

		/*
		note to would-be developer: be VERY WARY about using a switch() statement
		the XC8 compiler generates bloated code, particularly if the case values are not all consecutive
		if, else if, else if statements are more efficient with XC8, albeit at the cost of readability
		*/
		switch (RxDataBuffer[0])
		{
            case 0x00:      // Device ID
                TxDataBuffer[1] = DEVICE_ID;
                usb_send_in_buffer(1, EP_1_IN_LEN);
                break;

            case 0x01:      // Get Pin Mode
                TxDataBuffer[1] = TRISA;
#ifdef HAS_PORTB
                TxDataBuffer[2] = TRISB;
#endif
                TxDataBuffer[3] = TRISC;
                usb_send_in_buffer(1, EP_1_IN_LEN);
                break;
                
            case 0x02:      // Set Pin Mode
                TRISA = RxDataBuffer[1];
#ifdef HAS_PORTB
                TRISB = RxDataBuffer[2];
#endif
                TRISC = RxDataBuffer[3];
                break;
                
            case 0x03:      // Get Pin Value
                TxDataBuffer[1] = PORTA;
#ifdef HAS_PORTB
                TxDataBuffer[2] = PORTB;
#endif
                TxDataBuffer[3] = PORTC;
                usb_send_in_buffer(1, EP_1_IN_LEN);
                break;
                
            case 0x04:      // Set Pin Value
                LATA = RxDataBuffer[1];
#ifdef HAS_PORTB
                LATB = RxDataBuffer[2];
#endif
                LATC = RxDataBuffer[3];
                break;
                
            case 0x05:      // Get Single Pin Direction
                if(RxDataBuffer[1] / 10 == 1)
                    TxDataBuffer[1] = (TRISA << (RxDataBuffer[1] % 10)) & 0x01;
#ifdef HAS_PORTB
                else if(RxDataBuffer[1] / 10 == 2)
                    TxDataBuffer[1] = (TRISB << (RxDataBuffer[1] % 10)) & 0x01;
#endif
                else if(RxDataBuffer[1] / 10 == 3)
                    TxDataBuffer[1] = (TRISC << (RxDataBuffer[1] % 10)) & 0x01;
                else
                    TxDataBuffer[1] = 0xFF;     // Unknown pin
                
                break;
                
            case 0x06:      // Set Single Pin Direction
                value = (RxDataBuffer[2] & 0x01);
                if(RxDataBuffer[1] / 10 == 1)
                    TRISA = (TRISA & (value  << (RxDataBuffer[1] % 10))) | (value << (RxDataBuffer[1] % 10));
#ifdef HAS_PORTB
                else if(RxDataBuffer[1] / 10 == 2)
                    TRISB = (TRISB & (value  << (RxDataBuffer[1] % 10))) | (value << (RxDataBuffer[1] % 10));
#endif
                else if(RxDataBuffer[1] / 10 == 3)
                    TRISC = (TRISC & (value  << (RxDataBuffer[1] % 10))) | (value << (RxDataBuffer[1] % 10));                
                break;
                
            case 0x07:      // Get Single Pin Value
                if(RxDataBuffer[1] / 10 == 1)
                    TxDataBuffer[1] = (PORTA << (RxDataBuffer[1] % 10)) & 0x01;
#ifdef HAS_PORTB
                else if(RxDataBuffer[1] / 10 == 2)
                    TxDataBuffer[1] = (PORTB << (RxDataBuffer[1] % 10)) & 0x01;
#endif
                else if(RxDataBuffer[1] / 10 == 3)
                    TxDataBuffer[1] = (PORTC << (RxDataBuffer[1] % 10)) & 0x01;
                else
                    TxDataBuffer[1] = 0xFF;     // Unknown pin
                
                break;
                
            case 0x08:      // Set Single Pin Value
                value = (RxDataBuffer[2] & 0x01);
                if(RxDataBuffer[1] / 10 == 1)
                    LATA = (LATA & (value  << (RxDataBuffer[1] % 10))) | (value << (RxDataBuffer[1] % 10));
#ifdef HAS_PORTB
                else if(RxDataBuffer[1] / 10 == 2)
                    LATB = (LATB & (value  << (RxDataBuffer[1] % 10))) | (value << (RxDataBuffer[1] % 10));
#endif
                else if(RxDataBuffer[1] / 10 == 3)
                    LATC = (LATC & (value  << (RxDataBuffer[1] % 10))) | (value << (RxDataBuffer[1] % 10));
                break;

#ifdef HAS_ANALOG
            case 0x05:      // Get Analog pin status
                TxDataBuffer[1] = ANSELA;
#ifdef HAS_PORTB
                TxDataBuffer[2] = ANSELB;
#endif
                TxDataBuffer[3] = ANSELC;
                usb_send_in_buffer(1, EP_1_IN_LEN);
                break;

            case 0x06:      // Set Analog pin status
                ANSELA = RxDataBuffer[1];
#ifdef HAS_PORTB
                ANSELB = RxDataBuffer[2];
#endif
                ANSELC = RxDataBuffer[3];
                break;

            case 0x07:      // Get Analog Pin level
                ADCON0bits.CHS = RxDataBuffer[1] & 0x0F; // Select channel
                ADCON1 = 0b11110000; //Right justify, Frc clock
                ADCON0bits.ADON = 1;// Turn on ADC
                __delay_us(10);      // Acquisition delay
                ADCON0bits.ADGO = 1; // Start acquisition
                while(ADCON0bits.ADGO == 1);    // wait for conversion
                TxDataBuffer[1] =  ADRESH;
                TxDataBuffer[2] =  ADRESL;
                usb_send_in_buffer(1, EP_1_IN_LEN);
                break;
                
            default:
                TxDataBuffer[0] = 0xFF; // unknown command
                usb_send_in_buffer(1, EP_1_IN_LEN);
                break;
#endif        
		}

		/* re-arm the endpoint to receive the next EP1 OUT */
		usb_arm_out_endpoint(1);
	}
}

/* Callbacks. These function names are set in usb_config.h. */
int8_t app_unknown_setup_request_callback(const struct setup_packet *setup)
{
	return process_hid_setup_request(setup);
}

void interrupt isr()
{
#ifdef USB_USE_INTERRUPTS
    usb_service();
#endif
}
