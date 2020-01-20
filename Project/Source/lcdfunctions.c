#include "lcdfunctions.h"
#include "main.h"

void StartScreen(void){
	LCD_Init();
	LCD_LayerInit();
	LTDC_Cmd(ENABLE);
  LCD_SetLayer(LCD_FOREGROUND_LAYER);
  LCD_Clear(LCD_COLOR_WHITE);
  LCD_SetFont(&Font16x24);
  LCD_SetTextColor(LCD_COLOR_BLACK);
  LCD_DisplayStringLine(LINE(3), (uint8_t*)"  Temperatura:");
	//LCD_DisplayStringLine(LINE(5), (uint8_t*)"     25   ");
}

void OpenWin(void){
	LCD_Init();
	LCD_LayerInit();
	LTDC_Cmd(ENABLE);
  LCD_SetLayer(LCD_FOREGROUND_LAYER);
  LCD_Clear(LCD_COLOR_WHITE);
  LCD_SetFont(&Font16x24);
  LCD_SetTextColor(LCD_COLOR_RED);
  LCD_DisplayStringLine(LINE(3), (uint8_t*)"   OTVORITE  ");
	LCD_DisplayStringLine(LINE(5), (uint8_t*)"    PROZOR!  ");
}

void ClearScreen (void) {
	LCD_Clear(LCD_COLOR_WHITE);
}

void Write(char *p, int n){
	LCD_SetFont(&Font16x24);
  LCD_SetTextColor(LCD_COLOR_BLACK);
	LCD_DisplayStringLine(LINE(n), (uint8_t*)p);
}
