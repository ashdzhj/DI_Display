/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "stm8s.h"

//#define STM8AF626x
//#define __CSMC__
/* Private functions prototypes ----------------------------------------------*/
static void CLK_Config(void);
static void GPIO_Config(void);

/* Private functions ---------------------------------------------------------*/

/**
  * @brief  Main program.
  * @param  None
  * @retval None
  */
void main(void)
{

	/* GPIO Configuration ------------------------------------------------------*/
  GPIO_Config();

  /* Clock configuration -----------------------------------------------------*/
  CLK_Config();
	
	while (1)
	{
		/*KEY5V_EN Pin set to 1*/
		GPIO_WriteHigh(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_5);
		/*LCD_POW Pin set to 1*/
		GPIO_WriteHigh(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_2);
		/*LCD_POW1 Pin set to 1*/
		GPIO_WriteHigh(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_4);
		/*LCD_POW1 Pin set to 1*/
		GPIO_WriteHigh(GPIOB, (GPIO_Pin_TypeDef)GPIO_PIN_2);
		/*PDB Pin set to 1*/
		GPIO_WriteHigh(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_3);
		/*LCD_PWM_CTRL Pin set to 1*/
		GPIO_WriteHigh(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_2);
		/*LCD_BL_EN Pin set to 1*/
		GPIO_WriteHigh(GPIOF, (GPIO_Pin_TypeDef)GPIO_PIN_4);
		
	};
}

/**
  * @brief  STM8AF clock controller configuration
  * @param  None
  * @retval None
  */
void CLK_Config(void)
{

  ErrorStatus status = ERROR;
	
  /* HSI Clock divider set to 1 */
  CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	
	/* CPU Clock divider set to 1*/
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
	
	/* Enable HSE to run on XTAL : required for LIN master */
	status = CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE,
                                   DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);


}

/**
  * @brief  GPIO configuration
  * @param  None
  * @retval None
  */
void GPIO_Config(void)
{
	
	/*Init KEY5V_EN Pin*/
	GPIO_Init( GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST);
	
	/*Init LCD_POW Pin*/
	GPIO_Init( GPIOD, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);

	/*Init LCD_POW1 Pin*/
	GPIO_Init( GPIOC, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);

	/*Init LCD_POW1 Pin*/
	GPIO_Init( GPIOB, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
	
	/*Init PDB Pin*/
	GPIO_Init( GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);

	/*Init LCD_PWM_CTRL Pin*/
	GPIO_Init( GPIOC, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
	
	/*Init LCD_BL_EN Pin*/
	GPIO_Init( GPIOF, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);
	

  /* Init SPI peripheral pins */
  //GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)(GPIO_PIN_5 | GPIO_PIN_6),
   //         GPIO_MODE_OUT_PP_LOW_FAST); /* MOSI + CLK */
  //GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_7,
    //        GPIO_MODE_IN_PU_NO_IT); /* MISO */
  //GPIO_Init(GPIOE, (GPIO_Pin_TypeDef)(GPIO_PIN_5),
   //         GPIO_MODE_OUT_PP_HIGH_FAST); /* CSN */

  /* Initialize LEDs I/Os in Output Mode */
  //GPIO_Init(GPIOA, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
  //GPIO_Init(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
  //GPIO_Init(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_FAST);
  //GPIO_Init(GPIOE, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
  //GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);

  /* USER1 button init: GPIO set in input interrupt active mode */
  //GPIO_Init( GPIOE, GPIO_PIN_2, GPIO_MODE_IN_FL_IT);

  /* USER2 button init: GPIO set in input interrupt active mode */
  //GPIO_Init( GPIOE, GPIO_PIN_1, GPIO_MODE_IN_FL_IT);

  /* User Button 1 & 2 external interrupt sensitivity set to falling edge */
  //EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOE, EXTI_SENSITIVITY_FALL_ONLY);
}

#ifdef USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {}
}
#endif


/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/