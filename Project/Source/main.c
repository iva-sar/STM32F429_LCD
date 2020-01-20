/* main.c */
#include <main.h>

int main(void)
{
		char array[32];
		float temp;
		gpio_init();
		ADC1_Init();
		ADC2_Init();
		ADC3_Init();
		ADC4_Init();
		timer2_init();
		StartScreen();

		while(1)
		{
					timer2_wait_millisec(1000);
					OpenWin();
					Write(LM_temp (), 5);

					// gpio_led_state(LED3_ORANGE_ID, 1); // turn on
					// gpio_led_state(LED5_RED_ID, 0); // turn off

		}
}
