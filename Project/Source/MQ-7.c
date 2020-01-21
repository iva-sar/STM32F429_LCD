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
	ADC_Init(ADC3, &adc_init);
	ADC_Cmd(ADC3, ENABLE);
	ADC_RegularChannelConfig(ADC3, ADC_Channel_3, 1, ADC_SampleTime_144Cycles);
}

void MQ_7_read (void) {
	uint16_t data, dec;
  float temp;
	int i,zastavica=0;
	char array[50] ={0};

	ADC_SoftwareStartConv(ADC3);
	data=ADC_GetConversionValue(ADC3);
	temp=((data/1024.0)*5);
	dec = (temp - (int)temp)*1000;

	if (temp > 0.44){
		zastavica=1;
		OpenWin();
	};
	if (zastavica==1 && temp<0.44){
		StartScreen();
		zastavica=0;
	};

	USART1_SendChar('7');
  sprintf((array), "%d.%d", (int)temp, dec);
	Write(array, 7);
	for(i=0; array[i] != '\0'; ++i){
			USART1_SendChar(array[i]);
		}
	USART1_SendChar(0x0A);
	USART1_SendChar(0x0D);
}

int MQ_7_flag (void){

	uint16_t data;
	float temp;
	//float border = 0.7;

	ADC_SoftwareStartConv(ADC1);
	data=ADC_GetConversionValue(ADC1);
	temp=((data/1024.0)*3);

	if (temp > 0.5){
		OpenWin();
		return 1;
		}
	else{
		return 0;
	}
}
