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
#include <stdlib.h>
#include <math.h>
#include <lcdfunctions.h>

void MQ_135_read (void);
void ADC2_Init (void);
int MQ_135_flag (void);

#endif
