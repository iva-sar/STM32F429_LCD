#ifndef MQ_2_H
#define MQ_2_H

#include <stm32f4xx.h> // common stuff
#include <stm32f4xx_gpio.h> // gpio control
#include <stm32f4xx_rcc.h> // reset anc clocking
#include <usart.h>
#include "timer.h"
#include "stm32f4xx_adc.h"
#include <stdio.h>
#include <string.h>

#define MQ_2_RCC_ADC			RCC_APB2Periph_ADC1
#define MQ_2_RCC_GPIO			RCC_AHB1Periph_GPIOA
#define MQ_2_PIN					GPIO_Pin_1
#define MQ_2_ADC					ADC1
#define MQ_2_ADC_CHANNEL	ADC_Channel_1

float MQ_2_read (void);
void ADC1_Init (void);

#endif
