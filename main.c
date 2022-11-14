/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "stm8s.h"
#include "stm8s_adc1.h"
#include "stm8s_tim1.h"
#include "stm8s_exti.h"


/* Private functions prototypes ----------------------------------------------*/
static void CLK_Config(void);
static void GPIO_Config(void);
static void ADC_Config(void);
static void PWM_Config(void);

/* Private functions ---------------------------------------------------------*/

/**
  * @brief  Main program.
  * @param  None
  * @retval None
  */
void main(void)
{
	static uint8_t test_temp;
	
  static uint16_t test_ADC;

	/* GPIO Configuration ------------------------------------------------------*/
  GPIO_Config();

  /* Clock configuration -----------------------------------------------------*/
  CLK_Config();

	/* ADC configuration -----------------------------------------------------*/
  ADC_Config();

	/* PWM/TIM1 configuration -----------------------------------------------------*/
  PWM_Config();

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
		/*LCD_BL_EN Pin set to 1*/
		GPIO_WriteHigh(GPIOF, (GPIO_Pin_TypeDef)GPIO_PIN_4);

    ADC1_StartConversion();
    test_ADC = ADC1_GetConversionValue();

    TIM1_SetCompare2(80);//80%
		
		test_temp++;
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
	
  //asm("sim");
	/*Init WAKE_UP_DET Pin as external interrupt*/
	GPIO_Init( GPIOD, GPIO_PIN_6, GPIO_MODE_IN_PU_IT);

  /* WAKE_UP_DET external interrupt sensitivity set to falling edge */
  EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD, EXTI_SENSITIVITY_RISE_ONLY);

  //asm("rim");
  /* Init SPI peripheral pins */
  //GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)(GPIO_PIN_5 | GPIO_PIN_6),
   //         GPIO_MODE_OUT_PP_LOW_FAST); /* MOSI + CLK */
  //GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_7,
    //        GPIO_MODE_IN_PU_NO_IT); /* MISO */
  //GPIO_Init(GPIOE, (GPIO_Pin_TypeDef)(GPIO_PIN_5),
   //         GPIO_MODE_OUT_PP_HIGH_FAST); /* CSN */
   
}

/**
  * @brief  ADC configuration
  * @param  None
  * @retval None
  */
void ADC_Config(void)
{

  /*Enable ADC clock*/
  CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC,ENABLE);

  /*Initializes the ADC1 peripheral according to the specified parameters*/
  ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS,ADC1_CHANNEL_0,ADC1_PRESSEL_FCPU_D2,ADC1_EXTTRIG_TIM,DISABLE,ADC1_ALIGN_RIGHT,ADC1_SCHMITTTRIG_ALL,DISABLE);
  
  /*Enable ADC1 peripheral*/
  ADC1_Cmd(ENABLE);	

}

/**
  * @brief  PWM configuration/TIM1
  * @param  None
  * @retval None
  */
void PWM_Config(void)
{
  /*Enable TIM1 clock*/
  CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1,ENABLE);

  /*Initializes the TIM1 Time Base Unit according to the specified parameters.*/
  TIM1_TimeBaseInit(7,TIM1_COUNTERMODE_UP,100,0);//10khz

  /*Initializes the TIM1 Channel2 according to the specified parameters.*/
  TIM1_OC2Init(TIM1_OCMODE_PWM2,TIM1_OUTPUTSTATE_ENABLE,TIM1_OUTPUTNSTATE_DISABLE,0,TIM1_OCPOLARITY_LOW,TIM1_OCPOLARITY_HIGH,TIM1_OCIDLESTATE_RESET,TIM1_OCNIDLESTATE_RESET);

  /*Enables the TIM1 peripheral.*/
  TIM1_Cmd(ENABLE);

  /*Enables the TIM1 peripheral Main Outputs.*/
  TIM1_CtrlPWMOutputs(ENABLE);
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



/*****************************************************************************************************************/
/**
  * @brief  Initializes the TIM1 Time Base Unit according to the specified parameters.
  * @param  TIM1_Prescaler specifies the Prescaler value.
  * @param  TIM1_CounterMode specifies the counter mode  from @ref TIM1_CounterMode_TypeDef .
  * @param  TIM1_Period specifies the Period value.
  * @param  TIM1_RepetitionCounter specifies the Repetition counter value
  * @retval None
  */
void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
                       TIM1_CounterMode_TypeDef TIM1_CounterMode,
                       uint16_t TIM1_Period,
                       uint8_t TIM1_RepetitionCounter)
{

    /* Check parameters */
    assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));

    /* Set the Autoreload value */
    TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
    TIM1->ARRL = (uint8_t)(TIM1_Period);

    /* Set the Prescaler value */
    TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
    TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);

    /* Select the Counter Mode */
    TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
                           | (uint8_t)(TIM1_CounterMode));

    /* Set the Repetition Counter value */
    TIM1->RCR = TIM1_RepetitionCounter;

}

/**
  * @brief  Initializes the TIM1 Channel2 according to the specified parameters.
  * @param  TIM1_OCMode specifies the Output Compare mode from
  *         @ref TIM1_OCMode_TypeDef.
  * @param  TIM1_OutputState specifies the Output State from 
  *         @ref TIM1_OutputState_TypeDef.
  * @param  TIM1_OutputNState specifies the Complementary Output State from 
  *         @ref TIM1_OutputNState_TypeDef.
  * @param  TIM1_Pulse specifies the Pulse width value.
  * @param  TIM1_OCPolarity specifies the Output Compare Polarity from 
  *         @ref TIM1_OCPolarity_TypeDef.
  * @param  TIM1_OCNPolarity specifies the Complementary Output Compare Polarity
  *         from @ref TIM1_OCNPolarity_TypeDef.
  * @param  TIM1_OCIdleState specifies the Output Compare Idle State from 
  *         @ref TIM1_OCIdleState_TypeDef.
  * @param  TIM1_OCNIdleState specifies the Complementary Output Compare Idle 
  *         State from @ref TIM1_OCIdleState_TypeDef.
  * @retval None
  */
void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
                  TIM1_OutputState_TypeDef TIM1_OutputState,
                  TIM1_OutputNState_TypeDef TIM1_OutputNState,
                  uint16_t TIM1_Pulse,
                  TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
                  TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
                  TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
                  TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
{
    /* Check the parameters */
    assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
    assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
    assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
    assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
    assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
    assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
    assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));

    /* Disable the Channel 1: Reset the CCE Bit, Set the Output State , 
       the Output N State, the Output Polarity & the Output N Polarity*/
    TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
                                TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));

    /* Set the Output State & Set the Output N State & Set the Output Polarity &
       Set the Output N Polarity */
    TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
                             (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
                             (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
                             (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));

    /* Reset the Output Compare Bits & Set the Output Compare Mode */
    TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
                             (uint8_t)TIM1_OCMode);

    /* Reset the Output Idle state & the Output N Idle state bits */
    TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
    /* Set the Output Idle state & the Output N Idle state configuration */
    TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
                            (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));

    /* Set the Pulse value */
    TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
    TIM1->CCR2L = (uint8_t)(TIM1_Pulse);

}

/**
  * @brief  Enables or disables the TIM1 peripheral.
  * @param  NewState new state of the TIM1 peripheral.
	*         This parameter can be ENABLE or DISABLE.
  * @retval None
  */
void TIM1_Cmd(FunctionalState NewState)
{
    /* Check the parameters */
    assert_param(IS_FUNCTIONALSTATE_OK(NewState));

    /* set or Reset the CEN Bit */
    if (NewState != DISABLE)
    {
        TIM1->CR1 |= TIM1_CR1_CEN;
    }
    else
    {
        TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
    }
}

/**
  * @brief  Enables or disables the TIM1 peripheral Main Outputs.
  * @param  NewState new state of the TIM1 peripheral.
	*         This parameter can be ENABLE or DISABLE.
  * @retval None
  */
void TIM1_CtrlPWMOutputs(FunctionalState NewState)
{
    /* Check the parameters */
    assert_param(IS_FUNCTIONALSTATE_OK(NewState));

    /* Set or Reset the MOE Bit */

    if (NewState != DISABLE)
    {
        TIM1->BKR |= TIM1_BKR_MOE;
    }
    else
    {
        TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
    }
}

/**
  * @brief  Sets the TIM1 Capture Compare2 Register value.
  * @param   Compare2 specifies the Capture Compare2 register new value.
  * This parameter is between 0x0000 and 0xFFFF.
  * @retval None
  */
void TIM1_SetCompare2(uint16_t Compare2)
{
    /* Set the Capture Compare2 Register value */
    TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
    TIM1->CCR2L = (uint8_t)(Compare2);

}

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/