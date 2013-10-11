
/* This file has been prepared for Doxygen automatic documentation generation.*/
/*! \file ********************************************************************
*
* Atmel Corporation
*
* File              : xmega_freq_cntr.c
* Compiler          : WinAVR GCC
* Revision          : $20100110
* Date              : $Date: 13 Apr 11
* Updated by        : $Author: Marv Kausch
*
* Support mail      : avr@atmel.com
*
* Supported devices : The example is written for virtually all xmega devices using 2-3 Event SYstem channels and 2-3 Timer/counters
*
* AppNote           : AVR1617 - Frequency Measurement Using the XMEGA Event System
*
* Description       : Frequency measurement driver C code for AVR1617
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

 
#include <stdint.h>
#include "xmega_freq_cntr.h"
#include <avr/interrupt.h>

#if EXPAND_TO_32_BITS
unsigned long ic_result = 0;
#else
unsigned int ic_result = 0;
#endif

unsigned char clk_sel = 0;


void xmega_tcca_clk_freq_sel(unsigned char select){
	clk_sel = select;

	}
 
void  xmega_freq_cntr_init(void){


// Connect Event Chan to the input pin EVENT_SYSTEM_INPUT PIN to TCCA's clock input pin.


    EVSYS.CH0MUX = EVENT_SYSTEM_INPUT_PIN; 


// Set Event Chan 1 to trigger on CNTRA OVF causing an Input Capture on CNTB  
	
	EVSYS.CH1MUX = EVSYS_CHMUX_TCCA_OVF_gc; 

//Select event channel 0 as clock source for TCCB

	TCCB.CTRLA = TC_CLKSEL_EVCH0_gc; 

// Select Event Action 0001 => Input Capture, and Event Source select = 0b1001 => 

	TCCB.CTRLD = (TC1_EVACT_gm & TCB_EVACT0_bm) | (TCB_EVSEL_gm & (TCB_EVSEL3_bm | TCB_EVSEL0_bm));

#if EXPAND_TO_32_BITS

	TCCC.CTRLA = TC_CLKSEL_EVCH2_gc; 
	TCCC.CTRLD = (TCA_EVAVT_gm & TCA_EVACT0_bm) | (TCA_EVSEL_gm & (TCA_EVSEL3_bm | TCA_EVSEL0_bm));
	TCCC.CTRLB =  TCC_CCAEN_bm; // Capture enable
	EVSYS.CH2MUX = EVSYS_CHMUX_TCCB_OVF_gc; 

#endif

//Select Event Chan1 as TCCB Input Capture enable to Capt Channel A

	TCCB.CTRLB = TCB_CCAEN_bm; // Capture enable
} 

void  xmega_freq_cntr_start_meas(void){ 

/*	Clear input signal counter CCCB (Timer B) */
	TCCB.CNTL =	0;
	TCCB.CNTH =	0;
	ic_result = 0;
	TCCB_INTFLAGS |= TCCB_OVFIF_bm;
/*	Clear TCCA OVF Flag 
 *	This flag is used to signal to the application code that input capture
 *	results are ready.
 *
 */


	TCCA_INTFLAGS |= TCCA_OVFIF_bm;

/*	Load CCCA (timer A) with gate count to OVF value (nominally  125 msec)*/

	TCCA.CNT = TCCA_CNT_TO_OVF;
/*  Set TCCA interrupt priority level to Medium */

	TCCA.INTCTRLA = TC_OVFINTLVL_MED_gc;

/*  Set Prog Interrupt Ctrlr to mid-level Ints enabled for TCCA */

	PMIC.CTRL |= PMIC_MEDLVLEN_bm;


// TimerA set clock input based on divider to clk_sel.

	TCCA.CTRLA =  (clk_sel & TC0_CLKSEL_gm);
}

#if EXPAND_TO_32_BITS

unsigned long xmega_get_result(void){ 
	
	return	ic_result;
}
#endif

#if !EXPAND_TO_32_BITS

unsigned int xmega_get_result(void){ 
	
	return	ic_result;
}
#endif


void	xmega_freq_cntr_clr_result(void){

		ic_result = 0;
		}

/*!  The following ISR is executed when TCCA overflows.  This will stop the clock to TCCA 
 *  and combine the upper and lower 8 bits of the TCCB capture register into ic_result
 */


ISR(TCCA_OVF_vect){
/* Stop TCCA timer */
		TCCA.CTRLA = ( TCCA.CTRLA & ~TC0_CLKSEL_gm ) | TC_CLKSEL_OFF_gc;

#if !EXPAND_TO_32_BITS
		{																						;
		if((TCCB_INTFLAGS & 0x01) != 0)	ic_result = 0xffff; //return TCCB OVF via 0xffff
		else 	ic_result= TCCB.CCABUFL + (TCCB.CCABUFH<<8);
		}
#endif

	/* The following instructions assemble the Input capture register values 8 bits at a time */


#if EXPAND_TO_32_BITS
		{
/* Compine two 16-bit Capture Compare register contents into one result */

			ic_result= (TCCC.CCABUFL*65536) + (0xffff&(unsigned long)(TCCB.CCABUFL + (TCCB.CCABUFH<<8)));
		}

#endif

}





