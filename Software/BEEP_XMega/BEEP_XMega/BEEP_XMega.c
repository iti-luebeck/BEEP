/*
 * BEEP_XMega.c
 *
 * Created: 02.09.2013 13:49:19
 *  Author: hanse
 */ 

#define F_CPU 32000000UL

#include <avr/io.h>
#include "lib/avr_compiler.h"
#include "lib/usart_driver.h"
#include "lib/motor_driver.h"
#include <stdbool.h>
#include <stdlib.h>

#define beep_dev_mask 0xf0
#define beep_command_mask 0x0f
//devices
#define beep_dev_ir 0x00
#define beep_dev_ir_filtered 0x10
#define beep_dev_motors 0x40
#define BEEP_DEV_RGB_LED 0x50

//commands
#define beep_com_left_motor 0x01
#define beep_com_right_motor 0x02
#define beep_com_both_motors 0x03
#define beep_com_motor_shutdown 0x0f
#define beep_com_motor_enable 0x0e
#define beep_com_ir0 0x00
#define beep_com_ir1 0x01
#define beep_com_ir2 0x02
#define beep_com_ir3 0x03
#define beep_com_ir4 0x04
#define beep_com_ir5 0x05
#define beep_com_ir6 0x06
#define beep_com_ir7 0x07
#define beep_com_ir_all 0x0f
#define BEEP_COM_LEDS_OFF 0x0f
#define BEEP_COM_LEDS_ON 0x0e

#define MAX_COMMAND_DATA 4


#define PWM_GREEN TCE0.CCA
#define PWM_BLUE TCE0.CCB
#define PWM_RED TCE0.CCC
#define PWM_GREEN_ENABLE_gc TC0_CCAEN_bm
#define PWM_BLUE_ENABLE_gc TC0_CCBEN_bm
#define PWM_RED_ENABLE_gc TC0_CCCEN_bm

typedef struct RGB {
	uint8_t red;
	uint8_t green;
	uint8_t blue;
} RGB;

//calculated using wolfram alpha
//table[round(pow(2, log2(2^12-1) * (x+1) / 256)) ,{x,0,255,1}
//first value =0
const uint16_t pwmtable_12[256] PROGMEM = {
	0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 11, 11, 11, 12, 12, 13, 13, 13, 14, 14, 15, 15, 16, 16, 17, 17, 18, 19, 19, 20, 21, 21, 22, 23, 23, 24, 25, 26, 27, 27, 28, 29, 30, 31, 32, 33, 35, 36, 37, 38, 39, 41, 42, 43, 45, 46, 48, 49, 51, 53, 54, 56, 58, 60, 62, 64, 66, 68, 71, 73, 75, 78, 80, 83, 86, 89, 91, 95, 98, 101, 104, 108, 111, 115, 119, 123, 127, 131, 135, 140, 144, 149, 154, 159, 164, 170, 175, 181, 187, 193, 200, 206, 213, 220, 227, 235, 242, 250, 259, 267, 276, 285, 295, 304, 314, 325, 336, 347, 358, 370, 382, 395, 408, 421, 435, 450, 464, 480, 496, 512, 529, 546, 564, 583, 602, 622, 643, 664, 686, 708, 732, 756, 781, 807, 833, 861, 889, 919, 949, 980, 1013, 1046, 1081, 1116, 1153, 1191, 1231, 1271, 1313, 1357, 1402, 1448, 1496, 1545, 1596, 1649, 1703, 1759, 1818, 1878, 1940, 2004, 2070, 2138, 2209, 2282, 2357, 2435, 2515, 2598, 2684, 2773, 2864, 2959, 3057, 3158, 3262, 3370, 3481, 3596, 3715, 3837, 3964, 4095
};

volatile RGB myColors[8];



typedef struct Command_Buffer{
	/* \brief device the received command referes to*/
	uint8_t device;
	/* \brief command for the device*/
	uint8_t command;
	/* \brief number of missing data-bytes to execute command*/
	int8_t data_missing;
	/* \brief Array of data needed for command. -1 if no command/device received*/
	uint8_t data[MAX_COMMAND_DATA];
	/* \brief index of the next position to store data in*/
	uint8_t head;
	}Command_Buffer_t;

USART_data_t USART_data;
uint32_t baudrate = 115200;
uint8_t ir_data[8];
volatile bool direct_send_adc_res = true;
volatile uint8_t conv_left = 0;
volatile uint8_t adc_channel; //used to measure multiple channels




void init_enable_32mhz(void){
		OSC.CTRL |= OSC_RC32MEN_bm; //Enable 32 Mhz oscillator
		while(!(OSC.STATUS & OSC_RC32MRDY_bm)); //Wait until 32 Mhz oscillator is ready
		CCP = CCP_IOREG_gc; //Disable configuration change protection for four cycles
		CLK.CTRL = CLK_SCLKSEL_RC32M_gc; //Set 32Mhz as main clock
		OSC.CTRL &= ~OSC_RC2MEN_bm; //Disable 2 Mhz oscillator
}

void init_usart(void){
	// Output TX
	PORTD.DIRSET = PIN3_bm;
	// Input RX
	PORTD.DIRCLR = PIN2_bm;
	
	// init Buffers using USARTD0
	USART_InterruptDriver_Initialize(&USART_data, &USARTD0, USART_DREINTLVL_LO_gc);
	
	/* USARTD0, 8 Data bits, No Parity, 1 Stop bit. */
	USART_Format_Set(USART_data.usart, USART_CHSIZE_8BIT_gc,
                     USART_PMODE_DISABLED_gc, false);

	/* Enable RXC interrupt. */
	USART_RxdInterruptLevel_Set(USART_data.usart, USART_RXCINTLVL_LO_gc);

	/* Set Baudrate to 9600 bps:
	 * Do not use the baudrate scale factor
	 * Baudrate ((I/O clock frequency)/(2^(ScaleFactor)*16*Baudrate))-1
	 */
	
	USART_Baudrate_Set(&USARTD0, ((F_CPU/(16*baudrate))-1) , 0);
	
	//USART_Baudrate_Set(&USARTD0, 1/(16*((F_CPU/baudrate)-1)) , 0);

	/* Enable both RX and TX. */
	USART_Rx_Enable(USART_data.usart);
	USART_Tx_Enable(USART_data.usart);
}


void init_adc(void){
	ADCA.CTRLA = ADC_ENABLE_bm; //enable adc
	ADCA.CTRLB = ADC_CONMODE_bm | ADC_RESOLUTION_12BIT_gc; //signed mode, no current limit, no freerun, 12 bit resolution
	ADCA.PRESCALER = ADC_PRESCALER_DIV128_gc; //Set 32 clock devider
	ADCA.REFCTRL = ADC_REFSEL_INT1V_gc; // use inernal 1V ref
	
	ADCA.CH0.INTCTRL = ADC_CH_INTMODE_COMPLETE_gc|ADC_CH_INTLVL_LO_gc; //low priority interrupt on conv complete
	//TODO decide about priorities
	
}

inline void init_rgb_led(void){
	PORTF.DIRSET = PIN3_bm | PIN4_bm | PIN5_bm; //LED multiplexer Pins as output
	PORTE.DIRSET = PIN0_bm | PIN1_bm | PIN2_bm; //Set LED PWM as output
	PORTE.PIN0CTRL |= PORT_INVEN_bm; //Invert PWM Channels for NAND driver
	PORTE.PIN1CTRL |= PORT_INVEN_bm;
	PORTE.PIN2CTRL |= PORT_INVEN_bm;

	TCE0.CTRLB = PWM_RED_ENABLE_gc|PWM_GREEN_ENABLE_gc|PWM_BLUE_ENABLE_gc| TC_WGMODE_SS_gc; //enable pwm output, Single slope pwm
	
	TCE0.PER = 0xfff; //12 Bit resolution per period
	
	//Enable overflow interrupt for Timer 0 on Port C to swich rgb LED
	TCE0.INTCTRLA = TC_OVFINTLVL_LO_gc;
}


inline void enable_rgb_leds(bool enable){
	if (enable){
		//reset counter
		TCE0.CNT = 0x00;
		//restart counter
		TCE0.CTRLA = TC_CLKSEL_DIV1_gc;
	}else{
		TCE0.CTRLA = 0; // disable pwm output
		PORTE.OUTCLR = PIN0_bm | PIN1_bm | PIN2_bm; // clear outputs
	}
}

//lookup table for RGB darlington
const uint8_t rgb_led_lut[8] PROGMEM = {
	0b000<<3, 0b100<<3 ,0b010<<3, 0b110<<3, 0b001<<3, 0b101<<3, 0b011<<3, 0b111<<3};




void start_adc(uint8_t input){
	//input between 0 and 15
	ADCA.CH0.MUXCTRL = (input<<3) | ADC_CH_MUXNEG_PIN1_gc; //setup mux: input channel | refference voltage
	ADCA.CH0.CTRL = ADC_CH_START_bm | ADC_CH_GAIN_1X_gc | ADC_CH_INPUTMODE_DIFF_gc; //start conv with 1x gain, diff mode
}



void set_beepmotor_speed(motor_t motor, int8_t speed){
	motor_op_mode_t op = motor_stop;
	
	if (speed<0){
		if(speed == INT8_MIN){
			speed = INT8_MAX;
		}else{
			speed = -speed;
		}		
		if(motor == motor_l){
			op = motor_cw;
		}else if(motor == motor_r){
			op = motor_ccw;
		}
	}else{
		if(motor == motor_l){
			op = motor_ccw;
		}else if(motor == motor_r){
			op = motor_cw;
		}
	}
	uint8_t new_speed = speed * (UINT8_MAX / INT8_MAX);
	set_motor_operation_mode(motor, op);
	set_motor_speed(motor, new_speed);
	
}

const uint8_t ir_led_lut[8] PROGMEM = {
0b000,0b001,0b010,0b011,0b101,0b110,0b111,0b100};


int main(void){
	
	init_enable_32mhz();
	init_usart();
	init_motor();
	init_adc();
	
	init_rgb_led();
	enable_rgb_leds(true);
	

	/* Enable PMIC interrupt level low. */
	PMIC.CTRL |= PMIC_LOLVLEX_bm;

	/* Enable global interrupts. */
	sei();

	// set some colors
	myColors[0].red = 0x00;
	myColors[0].green = 0x00;
	myColors[0].blue = 0x00;
	
	myColors[1].red = 0x00;
	myColors[1].green = 0xaf;
	myColors[1].blue = 0x00;
	
	myColors[2].red = 0xaf;
	myColors[2].green = 0x00;
	myColors[2].blue = 0x00;
	
	myColors[3].red = 0x00;
	myColors[3].green = 0x00;
	myColors[3].blue = 0x00;
	
	myColors[4].red = 0x00;
	myColors[4].green = 0x00;
	myColors[4].blue = 0x00;
	
	myColors[5].red = 0xaf;
	myColors[5].green = 0xaf;
	myColors[5].blue = 0x00;
	
	myColors[6].red = 0xaf;
	myColors[6].green = 0x00;
	myColors[6].blue = 0xaf;
	
	myColors[7].red = 0x00;
	myColors[7].green = 0x00;
	myColors[7].blue = 0x00;
	

	
	
	//set_motor_on(true);
	// TODO Interrupts erst später aktivieren

	Command_Buffer_t next_command;
	next_command.data_missing =- 1;
	next_command.head = 0;
	next_command.command = 0;
	next_command.device = 0;
	
	//TEMP IR LED TEST
	PORTF.DIRSET = PIN0_bm | PIN1_bm | PIN2_bm;
	PORTF.OUTSET = pgm_read_word(&ir_led_lut[2]);;
	
	set_motor_on(false);
	set_beepmotor_speed(motor_r, 50);
	set_beepmotor_speed(motor_l, -50);
	
	
    while(1){		
		if(conv_left == 0){
			if(USART_RXBufferData_Available(&USART_data)){
				uint8_t data = USART_RXBuffer_GetByte(&USART_data);
				if(next_command.data_missing == -1){
					next_command.device = data & beep_dev_mask;
					next_command.command = data & beep_command_mask;
					//get number of missing data to execute command
					if(next_command.device == beep_dev_motors){
						if(next_command.command == beep_com_left_motor){
							next_command.data_missing = 1;
						}else if (next_command.command == beep_com_right_motor){
							next_command.data_missing = 1;
						}else if (next_command.command == beep_com_both_motors){
							next_command.data_missing = 2;
						}else if (next_command.command == beep_com_motor_enable){
							set_motor_on(true);
							//next_command.data_missing = -1;
						}else if (next_command.command == beep_com_motor_shutdown){
							set_motor_on(false);
							//next_command.data_missing = -1;
						}
					}else if(next_command.device == beep_dev_ir){			
						if(next_command.command <= 7){
							conv_left = 1;
							direct_send_adc_res = true;
							start_adc(next_command.command);
						}else if (next_command.command == beep_com_ir_all){							
							conv_left = 8;
							direct_send_adc_res = true;
							adc_channel = 0;
							start_adc(adc_channel);
						}
					
						//next_command.data_missing = -1;
					}else if(next_command.device == BEEP_DEV_RGB_LED){
						if(next_command.command == BEEP_COM_LEDS_OFF){
							enable_rgb_leds(false);
						}else if(next_command.command == BEEP_COM_LEDS_ON){
							enable_rgb_leds(true);
						}else if(next_command.command < 8){
							next_command.data_missing = 3;
						}
					}
				}else{
					next_command.data[next_command.head] = data;
					next_command.head += 1;
					next_command.data_missing -= 1;
					if (next_command.data_missing == 0){					
						if(next_command.device==beep_dev_motors){
							if(next_command.command == beep_com_left_motor){
								set_beepmotor_speed(motor_l, next_command.data[0]);
							}else if(next_command.command == beep_com_right_motor){
								set_beepmotor_speed(motor_r, next_command.data[0]);
							}else if(next_command.command == beep_com_both_motors){
								set_beepmotor_speed(motor_l, next_command.data[0]);
								set_beepmotor_speed(motor_r, next_command.data[1]);
							}
						}else if(next_command.device == BEEP_DEV_RGB_LED){
							if (next_command.command < 8){
								myColors[next_command.command].red = next_command.data[0];
								myColors[next_command.command].green = next_command.data[1];
								myColors[next_command.command].blue = next_command.data[2];
							}
						}
					
						//command executed, prepare for new command
						next_command.head = 0;
						next_command.data_missing =- 1;
					}
				}
			}
		}
    }
}


ISR(USARTD0_RXC_vect){
	USART_RXComplete(&USART_data);
}


ISR(USARTD0_DRE_vect){
	USART_DataRegEmpty(&USART_data);
}

ISR(ADCA_CH0_vect){
	if(direct_send_adc_res){
		USART_TXBuffer_PutByte(&USART_data, ADCA.CH0.RES / (2047 / 255));
		adc_channel += 1;
		conv_left -= 1;
		if (conv_left>0){
			start_adc(adc_channel);
		}
	}
}

ISR(TCE0_OVF_vect){
	static uint8_t led_multiplex_counter = 0; //software prescale
	static uint8_t led = 0; //next led number
	if(led_multiplex_counter++ > 0x5){
		led_multiplex_counter=0;
		//disable LED OUTPUT

		enable_rgb_leds(false);

		_delay_ms(1);
		
		//set pwm values
		PWM_RED = pgm_read_word (&pwmtable_12[myColors[led].red]);
		PWM_GREEN = pgm_read_word(&pwmtable_12[myColors[led].green]);
		PWM_BLUE = pgm_read_word (&pwmtable_12[myColors[led].blue]);

		//choose LED on multiplexer
		PORTF.OUTCLR = (0b111 << 3);
		PORTF.OUTSET = (pgm_read_word (&rgb_led_lut[led]));

		enable_rgb_leds(true);

		//select next LED
		led++;
		led &= 0b111;
	}
}