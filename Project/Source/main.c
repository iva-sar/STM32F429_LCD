/* main.c */
#include <main.h>

int main(void)
{
		//char array[32];
		int  j;
		char c;
		char warning_MQ2[35]="Detektirana pristutnost dima!";
		char warning_MQ7[35]="Detektirana opasna razina CO!";
		char warning_MQ135[35]="Detektirana loša kvaliteta zraka!";
		char poruka[35]="Kvaliteta zraka: OK";

		float temp;
		USART1_Init();
		gpio_init();
		ADC1_Init();
		ADC2_Init();
		ADC3_Init();
		timer2_init();
		StartScreen();

		while(1)
		{
		 timer2_wait_millisec(1000);
		 	MQ_2_read ();
			MQ_135_read ();
			MQ_7_read ();

	if (USART1_Dequeue(&c) != 0){
				if(c == 's' || c == 'S'){

						USART1_SendChar('2');
						USART1_SendChar(0x0D);
							MQ_2_read ();

						USART1_SendChar('5');
						USART1_SendChar(0x0D);
							MQ_135_read ();

						USART1_SendChar('7');
						USART1_SendChar(0x0D);
							MQ_7_read ();

						timer2_wait_millisec(1000);
						}
		}
		if (MQ_2_flag() == 1){
			USART1_SendChar(0x0A);
			USART1_SendChar(0x0D);
			for(j=0; j<sizeof(warning_MQ2); ++j){
				USART1_SendChar(warning_MQ2[j]);
			}
		}

		if (MQ_7_flag() == 1){
			USART1_SendChar(0x0A);
			USART1_SendChar(0x0D);
			for(j=0; j<sizeof(warning_MQ7); ++j){
				USART1_SendChar(warning_MQ7[j]);
			}
		}

		if (MQ_135_flag() == 1){
			USART1_SendChar(0x0A);
			USART1_SendChar(0x0D);
			for(j=0; j<sizeof(warning_MQ135); ++j){
				USART1_SendChar(warning_MQ135[j]);
			}
		}

		//if ((MQ_2_flag() == 0) && (MQ_7_flag() == 0) && (MQ_135_flag() == 0))
	//		USART1_SendChar(0x0A);
	//		USART1_SendChar(0x0D);
	//		for(j=0; j<sizeof(poruka); ++j){
	//			USART1_SendChar(poruka[j]);
	//		}
}
		//OpenWin();
		//Write(LM_temp (), 5);

		// gpio_led_state(LED3_ORANGE_ID, 1); // turn on
		// gpio_led_state(LED5_RED_ID, 0); // turn off
}
