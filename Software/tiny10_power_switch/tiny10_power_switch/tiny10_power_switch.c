/*
 * tiny10_power_switch.c
 *
 * Created: 09.10.2013 12:56:20
 *  Author: Felix Vollmer
 */ 

#define F_CPU 31250UL

#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>


// save state for power down
volatile uint8_t state = 0;
#define ADC_IN_PROGRESS_bm 0b01
#define BUTTON_PRESSED_bm 0b10


int main(void)
{
	CCP = 0xD8; //allow writing to protected registers for 4 cycles
	CLKPSR = (1<<CLKPS3); // 256 clock divider (31250kHz)
	while(!(PINB & (1<<PINB2))){}; //wait until user stopped pressing button
	_delay_ms(50); // lazy debounce ;)
	OCR0A = 2UL*(F_CPU/8); // set compare a to ca 2s (using clockdevider 8)
	TIMSK0 = (1<<OCIE0A); // enable compare match interrupt
	ADMUX = (1<<MUX0)|(1<<MUX1); //use ADC3 as input (PB3)
	ADCSRA = (1<<ADIE); //enable adc interrupt, 1/2 adc prescaler
	DIDR0 = (1<<ADC3D); //disable digital input for adc3
	EICRA = (1<<ISC00); //Any logical change on INT0 generates an interrupt request
	EIMSK = (1<<INT0); //enable INT0 Interrupt
	WDTCSR = (1<<WDIE)|(1<<WDP2)|(1<<WDP1); //use watchdog in interrupt mode (needs WDTON fuse unprogrammed), 128k cycles @ 128khz (about 1s)
	sleep_enable(); //enable sleep mode (allows cpu to sleep)

	while(1){
		cli(); //prevent interrupts (any pending interrupt will be executed after sei())
		//select sleep mode, depending on working tasks
		if(state&BUTTON_PRESSED_bm){
			set_sleep_mode(SLEEP_MODE_IDLE);
		}else if(state&ADC_IN_PROGRESS_bm){
			set_sleep_mode(SLEEP_MODE_ADC);
		}else{
			set_sleep_mode(SLEEP_MODE_PWR_DOWN);
		}
		sei(); //re enable interrupts (we need to wake up)
		sleep_cpu(); //sleep now (is guaranteed to be executed before next interrupt)
	}

}

//count the timer of the button press
ISR(INT0_vect){
	if(!(PINB & (1<<PINB2))){ //button pressed
		state |= BUTTON_PRESSED_bm;
		//start timer
		TCCR0B = (1<<CS01); //start timer (prescaler 1/8)
	} else{ //button released
		//stop, reset timer
		TCCR0B = 0;
		TCNT0 = 0;
		state &= ~BUTTON_PRESSED_bm;
	}
}

//if button was pressed long enough
 ISR(TIM0_COMPA_vect){
	//shut down
	DDRB |= (1<<DDB0);
}

//use wdt to measure voltage
ISR(WDT_vect){
	state |= ADC_IN_PROGRESS_bm;
	//measure voltage
	ADCSRA |= (1<<ADEN)|(1<<ADSC); //enable, start conversion
}

//adc result is ready
ISR(ADC_vect){
	if(ADCL < 186){ //2.4V*256/3.3V (see datasheet)
		//shutdown at 2.4V
		DDRB |= (1<<DDB0);
	} else if(ADCL < 190){ //2.45V*256/3.3V (see datasheet)
		//Warn LED on
		PORTB |= (1<<PORTB1);
		DDRB |= (1<<DDB1);
	}
	state &= ~ADC_IN_PROGRESS_bm;
}