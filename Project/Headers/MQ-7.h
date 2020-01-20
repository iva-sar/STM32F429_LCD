#ifndef MQ_7_H
#define MQ_7_H

#include <stm32f4xx.h> // common stuff
#include <stm32f4xx_gpio.h> // gpio control
#include <stm32f4xx_rcc.h> // reset anc clocking
#include <usart.h>
#include "timer.h"
#include "stm32f4xx_adc.h"
#include <stdio.h>
#include <string.h>

#define MQ_7_RCC_ADC			RCC_APB2Periph_ADC1
#define MQ_7_RCC_GPIO			RCC_AHB1Periph_GPIOA
#define MQ_7_PIN					GPIO_Pin_3
#define MQ_7_ADC					ADC1
#define MQ_7_ADC_CHANNEL	ADC_Channel_1

float MQ_7_read (void);
void ADC3_Init (void);

#endif
