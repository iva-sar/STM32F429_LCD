/* main.c */
#include <main.h>

int main(void)
{
		char array[32];


		float temp;
		USART1_Init();
		gpio_init();
		//ADC1_Init();
		ADC2_Init();
		//ADC3_Init();
		//ADC4_Init();
		timer2_init();
		//StartScreen();

		while(1)
		{
					USART1_SendChar('a');
					timer2_wait_millisec(1000);
					MQ_135_read();
					//MQ_2_read();
					//OpenWin();
					//Write(LM_temp (), 5);

					// gpio_led_state(LED3_ORANGE_ID, 1); // turn on
					// gpio_led_state(LED5_RED_ID, 0); // turn off

		}
}
