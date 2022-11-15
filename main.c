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
#include "stm8s_iwdg.h"
#include "stm8s_i2c.h"
#include "TCA6408A.h"


/* Private functions prototypes ----------------------------------------------*/
static void CLK_Config(void);
static void GPIO_Config(void);
static void ADC_Config(void);
static void PWM_Config(void);
static void IWDG_Config(void);

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

  /* IWDG configuration -----------------------------------------------------*/
  IWDG_Config();
  
	/* ADC configuration -----------------------------------------------------*/
  ADC_Config();

	/* PWM/TIM1 configuration -----------------------------------------------------*/
  PWM_Config();

  /*Enable I2C clock*/
  CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C,ENABLE);
  I2C_Init(100000,0x88,I2C_DUTYCYCLE_2,I2C_ACK_CURR,I2C_ADDMODE_7BIT,8);
  I2C_Cmd(ENABLE);

  TCA6408AInitDefault(&localReg);
  TCA6408AInitI2CReg(&localReg);

	while (1)
	{
    /* Refresh IWDG counter */
    IWDG_ReloadCounter();

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

    TIM1_SetCompare2(100);/* 100% */
		
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
	

	/*Init WAKE_UP_DET Pin as external interrupt*/
	GPIO_Init( GPIOD, GPIO_PIN_6, GPIO_MODE_IN_PU_IT);

  disableInterrupts();
  /* WAKE_UP_DET external interrupt sensitivity set to falling edge */
  EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD, EXTI_SENSITIVITY_FALL_ONLY);
  enableInterrupts();

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

/**
  * @brief  IWDG/Internal Watchdog configuration
  * @param  None
  * @retval None
  */
void IWDG_Config(void)
{

  /* --- IWDG Configuration --- */

  /* Enable IWDG (the LSI oscillator will be enabled by hardware) */
  IWDG_Enable(); 

  /* IWDG timeout equal to 250 ms (the timeout may varies due to LSI frequency dispersion) */
  /* Enable write access to IWDG_PR and IWDG_RLR registers */
  IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
  
  /* IWDG counter clock: LSI/128 */
  IWDG_SetPrescaler(IWDG_Prescaler_128);

  /* Set counter reload value to obtain 250ms IWDG Timeout.
  **     Counter Reload Value = 250ms/IWDG counter clock period
  **      = 250ms / (LSI/128)
  **      = 0.25s / (LsiFreq/128)
  **      = LsiFreq/(128 * 4)
  **      = LsiFreq/512
  **      */
  IWDG_SetReload((uint8_t)(0xFF));/*510ms*/
  
  /* Reload IWDG counter */
  IWDG_ReloadCounter();

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
/**
  * @brief  Initializes the I2C according to the specified parameters in standard
  *         or fast mode.
  * @param  OutputClockFrequencyHz : Specifies the output clock frequency in Hz.
  * @param  OwnAddress : Specifies the own address.
  * @param  I2C_DutyCycle : Specifies the duty cycle to apply in fast mode.
  *         This parameter can be any of the  @ref I2C_DutyCycle_TypeDef enumeration.
  * @note   This parameter don't have impact when the OutputClockFrequency lower
  *         than 100KHz.
  * @param  Ack : Specifies the acknowledge mode to apply.
  *         This parameter can be any of the  @ref I2C_Ack_TypeDef enumeration.
  * @param  AddMode : Specifies the acknowledge address to apply.
  *         This parameter can be any of the  @ref I2C_AddMode_TypeDef enumeration.
  * @param  InputClockFrequencyMHz : Specifies the input clock frequency in MHz.
  * @retval None
  */
void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
              I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
              I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
{
  uint16_t result = 0x0004;
  uint16_t tmpval = 0;
  uint8_t tmpccrh = 0;

  /* Check the parameters */
  assert_param(IS_I2C_ACK_OK(Ack));
  assert_param(IS_I2C_ADDMODE_OK(AddMode));
  assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
  assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
  assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
  assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));


  /*------------------------- I2C FREQ Configuration ------------------------*/
  /* Clear frequency bits */
  I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
  /* Write new value */
  I2C->FREQR |= InputClockFrequencyMHz;

  /*--------------------------- I2C CCR Configuration ------------------------*/
  /* Disable I2C to configure TRISER */
  I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);

  /* Clear CCRH & CCRL */
  I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
  I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);

  /* Detect Fast or Standard mode depending on the Output clock frequency selected */
  if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
  {
    /* Set F/S bit for fast mode */
    tmpccrh = I2C_CCRH_FS;

    if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
    {
      /* Fast mode speed calculate: Tlow/Thigh = 2 */
      result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
    }
    else /* I2C_DUTYCYCLE_16_9 */
    {
      /* Fast mode speed calculate: Tlow/Thigh = 16/9 */
      result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
      /* Set DUTY bit */
      tmpccrh |= I2C_CCRH_DUTY;
    }

    /* Verify and correct CCR value if below minimum value */
    if (result < (uint16_t)0x01)
    {
      /* Set the minimum allowed value */
      result = (uint16_t)0x0001;
    }

    /* Set Maximum Rise Time: 300ns max in Fast Mode
    = [300ns/(1/InputClockFrequencyMHz.10e6)]+1
    = [(InputClockFrequencyMHz * 3)/10]+1 */
    tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
    I2C->TRISER = (uint8_t)tmpval;

  }
  else /* STANDARD MODE */
  {

    /* Calculate standard mode speed */
    result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));

    /* Verify and correct CCR value if below minimum value */
    if (result < (uint16_t)0x0004)
    {
      /* Set the minimum allowed value */
      result = (uint16_t)0x0004;
    }

    /* Set Maximum Rise Time: 1000ns max in Standard Mode
    = [1000ns/(1/InputClockFrequencyMHz.10e6)]+1
    = InputClockFrequencyMHz+1 */
    I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);

  }

  /* Write CCR with new calculated value */
  I2C->CCRL = (uint8_t)result;
  I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);

  /* Enable I2C */
  I2C->CR1 |= I2C_CR1_PE;

  /* Configure I2C acknowledgement */
  I2C_AcknowledgeConfig(Ack);

  /*--------------------------- I2C OAR Configuration ------------------------*/
  I2C->OARL = (uint8_t)(OwnAddress);
  I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
                   (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
}

/**
  * @brief  Enables or disables the I2C peripheral.
  * @param  NewState : Indicate the new I2C peripheral state.
  *         This parameter can be any of the @ref FunctionalState enumeration.
  * @retval None
  */
void I2C_Cmd(FunctionalState NewState)
{

  /* Check function parameters */
  assert_param(IS_FUNCTIONALSTATE_OK(NewState));

  if (NewState != DISABLE)
  {
    /* Enable I2C peripheral */
    I2C->CR1 |= I2C_CR1_PE;
  }
  else /* NewState == DISABLE */
  {
    /* Disable I2C peripheral */
    I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
  }
}


/**
  * @brief  Generates I2C communication START condition.
  * @note   CCR must be programmed, i.e. I2C_Init function must have been called
  *         with a valid I2C_ClockSpeed
  * @param  NewState : Enable or disable the start condition.
  *         This parameter can be any of the @ref FunctionalState enumeration.
  * @retval None
  */
void I2C_GenerateSTART(FunctionalState NewState)
{

  /* Check function parameters */
  assert_param(IS_FUNCTIONALSTATE_OK(NewState));

  if (NewState != DISABLE)
  {
    /* Generate a START condition */
    I2C->CR2 |= I2C_CR2_START;
  }
  else /* NewState == DISABLE */
  {
    /* Disable the START condition generation */
    I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
  }
}

/**
  * @brief  Generates I2C communication STOP condition.
  * @param   NewState : Enable or disable the stop condition.
  *          This parameter can be any of the @ref FunctionalState enumeration.
  * @retval None
  */
void I2C_GenerateSTOP(FunctionalState NewState)
{

  /* Check function parameters */
  assert_param(IS_FUNCTIONALSTATE_OK(NewState));

  if (NewState != DISABLE)
  {
    /* Generate a STOP condition */
    I2C->CR2 |= I2C_CR2_STOP;
  }
  else /* NewState == DISABLE */
  {
    /* Disable the STOP condition generation */
    I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
  }
}


/**
  * @brief  Enable or Disable the I2C acknowledge and position acknowledge feature.
  * @note   This function must be called before data reception start
  * @param  Ack : Specifies the acknowledge mode to apply.
  *         This parameter can be any of the  @ref I2C_Ack_TypeDef enumeration.
  * @retval None
  */
void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
{

  /* Check function parameters */
  assert_param(IS_I2C_ACK_OK(Ack));

  if (Ack == I2C_ACK_NONE)
  {
    /* Disable the acknowledgement */
    I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
  }
  else
  {
    /* Enable the acknowledgement */
    I2C->CR2 |= I2C_CR2_ACK;

    if (Ack == I2C_ACK_CURR)
    {
      /* Configure (N)ACK on current byte */
      I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
    }
    else
    {
      /* Configure (N)ACK on next byte */
      I2C->CR2 |= I2C_CR2_POS;
    }
  }
}


/**
  * @brief  Selects the specified I2C fast mode duty cycle.
  * @param  I2C_DutyCycle : Specifies the duty cycle to apply.
  *         This parameter can be any of the @ref I2C_DutyCycle_TypeDef enumeration.
  * @retval None
  */
void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
{

  /* Check function parameters */
  assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));

  if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
  {
    /* I2C fast mode Tlow/Thigh = 16/9 */
    I2C->CCRH |= I2C_CCRH_DUTY;
  }
  else /* I2C_DUTYCYCLE_2 */
  {
    /* I2C fast mode Tlow/Thigh = 2 */
    I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
  }
}

/**
  * @brief  Returns the most recent received data.
  * @param  None
  * @retval uint8_t : The value of the received byte data.
  */
uint8_t I2C_ReceiveData(void)
{
  /* Return the data present in the DR register */
  return ((uint8_t)I2C->DR);
}

/**
  * @brief  Transmits the 7-bit address (to select the) slave device.
  * @param   Address : Specifies the slave address which will be transmitted.
  * @param   Direction : Specifies whether the I2C device will be a Transmitter or a Receiver.
  * This parameter can be any of the @ref I2C_Direction_TypeDef enumeration.
  * @retval None
  */
void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
{
  /* Check function parameters */
  assert_param(IS_I2C_ADDRESS_OK(Address));
  assert_param(IS_I2C_DIRECTION_OK(Direction));

  /* Clear bit0 (direction) just in case */
  Address &= (uint8_t)0xFE;

  /* Send the Address + Direction */
  I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
}

/**
  * @brief  Send a byte by writing in the DR register.
  * @param   Data : Byte to be sent.
  * @retval None
  */
void I2C_SendData(uint8_t Data)
{
  /* Write in the DR register the data to be sent */
  I2C->DR = Data;
}
