/* This file has been prepared for Doxygen automatic documentation generation.*/
/*! \file ********************************************************************
*
* Atmel Corporation
*
* File              : xmega_freq_cntr.h
* Compiler          : WinAVR GCC
* Revision          : $20100110
* Date              : $Date: 14 Apr 11
* Updated by        : $Author: Marv Kausch
*
* Support mail      : avr@atmel.com
*
* Supported devices : The example is written for virtually all xmega devices using 2-3 Event SYstem channels and 2-3 Timer/counters
*
* AppNote           : AVR1617 - Frequency Measurement Using the XMEGA Event System
*
* Description       : Header file for AVR1617
*
*
*
****************************************************************************/

/*! \page License
Copyright (c) 2009 Atmel Corporation. All rights reserved. 
 
Redistribution and use in source and binary forms, with or without 
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer. 

2. Redistributions in binary form must reproduce the above copyright notice, 
this list of conditions and the following disclaimer in the documentation 
and/or other materials provided with the distribution.

3. The name of Atmel may not be used to endorse or promote products derived 
from this software without specific prior written permission.  

4. This software may only be redistributed and used in connection with an Atmel 
AVR product. 

THIS SOFTWARE IS PROVIDED BY ATMEL "AS IS" AND ANY EXPRESS OR IMPLIED 
WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF 
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT ARE 
EXPRESSLY AND SPECIFICALLY DISCLAIMED. IN NO EVENT SHALL ATMEL BE LIABLE FOR 
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES 
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; 
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND 
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS 
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE
 */




/* Doxygen documentation mainpage ********************************************/
/*! \mainpage
 * \section intro Introduction
 * This documents the software for application note AVR1617.
 *
 * \section compinfo Compilation Info
 * This software was compiled with WinAVR GCC 20100110.
 * the source have to be modified.\n
 *
 * \section deviceinfo Device Info
 * Virtually all XMEGA AVRs that offer 32 MHz clock operation, 2-3 16 bit Timer/Counters and 2-3 Event SYstem channels
 *
 * \section codesize Code Size
 * 1082 program bytes Optimization level -O1), 7 SRAM bytes
 *
 *
 * \section contactinfo Contact Info
 * For more info about Atmel AVR visit http://www.atmel.com/products/AVR/ \n
 * For application notes visit 
 * http://www.atmel.com/dyn/products/app_notes.asp?family_id=607 \n
 * Support mail: avr@atmel.com
 */

 /*If this #define is set to '1',the 32 bit frequency counter option is enabled using TCCC.
 Otherwise the 16-bit result will be available using TCCB */


#define EXPAND_TO_32_BITS	0 // 1

/* If it is desired to change one or more of the the three timer/counter assignments (such
 * as changing TCD0 to another timer, the event channel assignments for clock and capture/
 * compare will have to be changed to this new timer/counter.
 */

#define TCCA	TCD0	
#define TCCB	TCF0
#define TCCC	TCD0 //32 bit mode only

#define TCCA_INTFLAGS	TCD0_INTFLAGS
#define TCCB_INTFLAGS	TCF0_INTFLAGS
#define TCCC_INTFLAGS	TCD0_INTFLAGS

#define	TCCA_OVFIF_bm	TC0_OVFIF_bm
#define TCCB_OVFIF_bm	TC1_OVFIF_bp
#define TCCC_OVFIF_bm	TD0_OVFIF_bp

#define TCCA_OVF_vect 	TCD0_OVF_vect


#define TCCA_CNT_TO_OVF	 ((0xffffUL)-(F_CPU/(64UL*8UL)))

#define EVENT_SYSTEM_INPUT_PIN	EVSYS_CHMUX_PORTD_PIN0_gc;
#define EVSYS_CHMUX_TCCA_OVF_gc	EVSYS_CHMUX_TCD0_OVF_gc   
#define EVSYS_CHMUX_TCCB_OVF_gc	EVSYS_CHMUX_TCF0_OVF_gc	  

#define TCA_EVAVT_gm	TC0_EVACT_gm
#define	TCA_EVACT0_bm	TC0_EVACT0_bm
#define	TCA_EVSEL_gm	TC0_EVSEL_gm
#define	TCA_EVSEL3_bm	TC0_EVSEL3_bm
#define	TCA_EVSEL0_bm	TC0_EVSEL0_bm

#define TCB_EVAVT_gm	TC1_EVACT_gm
#define	TCB_EVACT0_bm	TC1_EVACT0_bm
#define	TCB_EVSEL_gm	TC1_EVSEL_gm
#define	TCB_EVSEL3_bm	TC1_EVSEL3_bm
#define	TCB_EVSEL0_bm	TC1_EVSEL0_bm

#define TCC_CCAEN_bm	TC0_CCAEN_bm;

#define	TCB_CCAEN_bm	TC1_CCAEN_bm

/*! Prototypes */



/*!		/brief Initializtion of xmega counters and event system
 *
 *		The xmega peripherals such as Timers and the Event System must be
 *		initialized. This function executes the necessary instructions.
 *		Input: none
 *		Output: none
 */

void  xmega_freq_cntr_init(void);



/*!		/brief	Function to start the measure frequency via the Event System and TCCA and TCCB have been initialized
 *		After Event System and TCCA and TCCB have been initialized, this function pre-loads TCCA
 *		with .125 second (125 msec) of counts before OVF.
 *			
 *		At OVF, 125 msec has elapsed and thiss OVVF triggers and Event that clocks in TCCb's
 *		count into TCCA's Capture register CCA.
 *		Input: none
 *		Output: none
 */
void  xmega_freq_cntr_start_meas(void);
 
/* CLK_SEL values
CLK_SEL		CPU_clk_div_by

0			OFF
1			div by 1
2			div by 2
3			div by 4
4			div by 8
5			div by 64
6			div by 256
7			div by 1024


This function sets the TCCA prescaler to divide the clkCPU as shown in the table below.  The millisecond values are based on a clkCPU of 32 MHz, although another frequency could be used, such as a crystal oscillator.   	
Input: CK_SEL    Output:none
		
*/

void xmega_tcca_clk_freq_sel(unsigned char CK_SEL);

/*!		/brief	Function to return freq measurement results to the application code
* 
*		Input:none
*		if the #define 'EXPAND_TO_32_BITS = 0, then Output: 16-bit unsigned int for the frequency/4,
*		 due to the 125 msec (1/8 second) count interval
*		if the #define 'EXPAND_TO_32_BITS = 1, then Output: 32-bit unsigned int for the frequency/4,
*		 due to the 125 msec (1/8 second) count interval
*		Input: unsigned char clk_sel
*		Output: none
*		
*/
#if EXPAND_TO_32_BITS
	
unsigned long xmega_get_result(void); //long variable needed for 32 bit result

#endif

#if !EXPAND_TO_32_BITS

unsigned int xmega_get_result(void); // 16 bit variable for 16 bit result

#endif


/*!		/brief	Function to clear the result coming from the driver
* 
*		Input:none   Output:none
*		After the driver returns the frequency to the application, it is necessary to clear the results
*		in the driver to set it up for the next frequency measurement.
*		This is accomplished by the application code, by calling this function.
*		 due to the 125 msec (1/8 second) count interval*		
*/

void	xmega_freq_cntr_clr_result(void);




