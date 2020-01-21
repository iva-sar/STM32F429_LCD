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
#include <lcdfunctions.h>

void MQ_2_read (void);
void ADC1_Init (void);
int MQ_2_flag (void);

#endif
