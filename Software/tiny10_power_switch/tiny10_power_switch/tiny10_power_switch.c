/*
 * tiny10_power_switch.c
 *
 * Created: 09.10.2013 12:56:20
 *  Author: hanse
 */ 

#define F_CPU 31250UL

#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>



int main(void)
{
	CCP = 0xD8; //allow writing to protected registers for 4 cycles
	CLKPSR = (1<<CLKPS3); // 256 clock divider (31250kHz)
	while(!(PINB & (1<<PINB2))){}; //wait until user stopped pressing button
	//_delay_ms(50); // lazy debounce ;)
	OCR0A = 15625; // set compare a to ca 4s
	TIMSK0 = (1<<OCIE0A); // enable compare match a
	sei(); // enable interrupts
	
	while(1){
		if(!(PINB & (1<<PINB2))){
			//start timer
			TCCR0B = (1<<CS01); //start timer (prescaler 1/8)
		} else{
			//stop, reset timer
			TCCR0B = 0;
			TCNT0 = 0;
		}
		
	}

}

 ISR(TIM0_COMPA_vect){
 	DDRB |= (1<<DDB0);
}

