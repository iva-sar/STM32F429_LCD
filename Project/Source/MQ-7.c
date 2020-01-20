#include "MQ-7.h"

void ADC3_Init (void){
	GPIO_InitTypeDef GPIO_InitStruct;
	ADC_InitTypeDef adc_init;

	RCC_APB2PeriphClockCmd(RCC_APB2Periph_ADC3, ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);

	GPIO_InitStruct.GPIO_Pin = GPIO_Pin_3;
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_AN;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStruct.GPIO_OType = GPIO_OType_OD;
	GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_Init(GPIOA, &GPIO_InitStruct);

	ADC_StructInit(&adc_init);
	adc_init.ADC_Resolution = ADC_Resolution_10b;
	ADC_Init(ADC2, &adc_init);
	ADC_Cmd(ADC2, ENABLE);
	ADC_RegularChannelConfig(ADC3, ADC_Channel_3, 1, ADC_SampleTime_144Cycles);
}

float MQ_7_read (void) {
	uint16_t data;
	float temp;
	// int i;
	// char array[10];

	ADC_SoftwareStartConv(ADC3);
	data=ADC_GetConversionValue(ADC3);
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
