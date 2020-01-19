/* gpio.h */
#ifndef GPIO_H
#define GPIO_H

#include <stm32f4xx.h> 					// common stuff
#include <stm32f4xx_gpio.h> 		// gpio control
#include <stm32f4xx_rcc.h> 			// reset anc clocking

#define LED3_ORANGE_RCC_GPIOx 		RCC_AHB1Periph_GPIOG
#define LED5_RED_RCC_GPIOx 				RCC_AHB1Periph_GPIOG

#define LED3_ORANGE_GPIOx 				GPIOG
#define LED5_RED_GPIOx 						GPIOG

#define LED3_ORANGE_PinNumber 		GPIO_Pin_13
#define LED5_RED_PinNumber 				GPIO_Pin_14

#define LED3_ORANGE_ID 						1
#define LED5_RED_ID 							2

void gpio_init(void);
void gpio_led_state(uint8_t LED_ID, uint8_t state);

#endif
