/* main.c */
#include <main.h>

int main(void)
{

		gpio_init();
		timer2_init();
		StartScreen();

		while(1)
		{
					timer2_wait_millisec(1000);
					// gpio_led_state(LED3_ORANGE_ID, 1); // turn on
					// gpio_led_state(LED5_RED_ID, 0); // turn off

		}
}
