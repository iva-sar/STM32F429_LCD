#include "MQ-2.h"

void ADC1_Init (void){
	GPIO_InitTypeDef GPIO_InitStruct;
	ADC_InitTypeDef adc_init;

	RCC_APB2PeriphClockCmd(RCC_APB2Periph_ADC1, ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);

	GPIO_InitStruct.GPIO_Pin = GPIO_Pin_1;
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_AN;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStruct.GPIO_OType = GPIO_OType_OD;
	GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_Init(GPIOA, &GPIO_InitStruct);

	ADC_StructInit(&adc_init);
	adc_init.ADC_Resolution = ADC_Resolution_10b;
	ADC_Init(ADC1, &adc_init);
	ADC_Cmd(ADC1, ENABLE);
	ADC_RegularChannelConfig(ADC1, ADC_Channel_1, 1, ADC_SampleTime_144Cycles);
}

float MQ_2_read (void) {
	uint16_t data;
	float temp;
	// int i;
	// char array[10];

	ADC_SoftwareStartConv(ADC1);
	data=ADC_GetConversionValue(ADC1);
	temp=(data*5/1024);

	return temp;
	// sprintf((char *)(array), "%3.6f\n", temp);
	// USART1_SendChar('L');
	// for(i=0; i<sizeof(array)-3; ++i){
	// 		USART1_SendChar(array[i]);
	// 	}
	// USART1_SendChar(0x0A);
	// USART1_SendChar(0x0D);
}
