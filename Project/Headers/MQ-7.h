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
#include <lcdfunctions.h>

void MQ_7_read (void);
void ADC3_Init (void);
int MQ_7_flag (void);

#endif
