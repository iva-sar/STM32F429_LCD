#ifndef MQ_135_H
#define MQ_135_H

#include <stm32f4xx.h> // common stuff
#include <stm32f4xx_gpio.h> // gpio control
#include <stm32f4xx_rcc.h> // reset anc clocking
#include <usart.h>
#include "timer.h"
#include "stm32f4xx_adc.h"
#include <stdio.h>
#include <string.h>

#define MQ_135_RCC_ADC			RCC_APB2Periph_ADC2
#define MQ_135_RCC_GPIO			RCC_AHB1Periph_GPIOA
#define MQ_135_PIN					GPIO_Pin_2
#define MQ_135_ADC					ADC2
#define MQ_135_ADC_CHANNEL	ADC_Channel_2

void MQ_135_read (void);
void ADC2_Init (void);

#endif
