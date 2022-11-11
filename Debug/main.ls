   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   4                     	switch	.ubsct
   5  0000               L31_test_ADC:
   6  0000 0000          	ds.b	2
   7  0002               L11_test_temp:
   8  0002 00            	ds.b	1
  63                     ; 24 void main(void)
  63                     ; 25 {
  65                     	switch	.text
  66  0000               _main:
  70                     ; 31   GPIO_Config();
  72  0000 ad6e          	call	L5_GPIO_Config
  74                     ; 34   CLK_Config();
  76  0002 ad4e          	call	L3_CLK_Config
  78                     ; 37   ADC_Config();
  80  0004 cd00be        	call	L7_ADC_Config
  82  0007               L54:
  83                     ; 42 		GPIO_WriteHigh(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_5);
  85  0007 4b20          	push	#32
  86  0009 ae500f        	ldw	x,#20495
  87  000c cd0000        	call	_GPIO_WriteHigh
  89  000f 84            	pop	a
  90                     ; 44 		GPIO_WriteHigh(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_2);
  92  0010 4b04          	push	#4
  93  0012 ae500f        	ldw	x,#20495
  94  0015 cd0000        	call	_GPIO_WriteHigh
  96  0018 84            	pop	a
  97                     ; 46 		GPIO_WriteHigh(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_4);
  99  0019 4b10          	push	#16
 100  001b ae500a        	ldw	x,#20490
 101  001e cd0000        	call	_GPIO_WriteHigh
 103  0021 84            	pop	a
 104                     ; 48 		GPIO_WriteHigh(GPIOB, (GPIO_Pin_TypeDef)GPIO_PIN_2);
 106  0022 4b04          	push	#4
 107  0024 ae5005        	ldw	x,#20485
 108  0027 cd0000        	call	_GPIO_WriteHigh
 110  002a 84            	pop	a
 111                     ; 50 		GPIO_WriteHigh(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_3);
 113  002b 4b08          	push	#8
 114  002d ae500f        	ldw	x,#20495
 115  0030 cd0000        	call	_GPIO_WriteHigh
 117  0033 84            	pop	a
 118                     ; 52 		GPIO_WriteHigh(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_2);
 120  0034 4b04          	push	#4
 121  0036 ae500a        	ldw	x,#20490
 122  0039 cd0000        	call	_GPIO_WriteHigh
 124  003c 84            	pop	a
 125                     ; 54 		GPIO_WriteHigh(GPIOF, (GPIO_Pin_TypeDef)GPIO_PIN_4);
 127  003d 4b10          	push	#16
 128  003f ae5019        	ldw	x,#20505
 129  0042 cd0000        	call	_GPIO_WriteHigh
 131  0045 84            	pop	a
 132                     ; 56     ADC1_StartConversion();
 134  0046 cd0000        	call	_ADC1_StartConversion
 136                     ; 57     test_ADC = ADC1_GetConversionValue();
 138  0049 cd0000        	call	_ADC1_GetConversionValue
 140  004c bf00          	ldw	L31_test_ADC,x
 141                     ; 59 		test_temp++;
 143  004e 3c02          	inc	L11_test_temp
 145  0050 20b5          	jra	L54
 203                     ; 68 void CLK_Config(void)
 203                     ; 69 {
 204                     	switch	.text
 205  0052               L3_CLK_Config:
 207  0052 88            	push	a
 208       00000001      OFST:	set	1
 211                     ; 71   ErrorStatus status = ERROR;
 213  0053 0f01          	clr	(OFST+0,sp)
 214                     ; 74   CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 216  0055 4f            	clr	a
 217  0056 cd0000        	call	_CLK_HSIPrescalerConfig
 219                     ; 77 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 221  0059 a680          	ld	a,#128
 222  005b cd0000        	call	_CLK_SYSCLKConfig
 224                     ; 80 	status = CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE,
 224                     ; 81                                    DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
 226  005e 4b00          	push	#0
 227  0060 4b00          	push	#0
 228  0062 ae00b4        	ldw	x,#180
 229  0065 a601          	ld	a,#1
 230  0067 95            	ld	xh,a
 231  0068 cd0000        	call	_CLK_ClockSwitchConfig
 233  006b 85            	popw	x
 234  006c 6b01          	ld	(OFST+0,sp),a
 235                     ; 84 }
 238  006e 84            	pop	a
 239  006f 81            	ret
 263                     ; 91 void GPIO_Config(void)
 263                     ; 92 {
 264                     	switch	.text
 265  0070               L5_GPIO_Config:
 269                     ; 95 	GPIO_Init( GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST);
 271  0070 4be0          	push	#224
 272  0072 4b20          	push	#32
 273  0074 ae500f        	ldw	x,#20495
 274  0077 cd0000        	call	_GPIO_Init
 276  007a 85            	popw	x
 277                     ; 98 	GPIO_Init( GPIOD, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
 279  007b 4be0          	push	#224
 280  007d 4b04          	push	#4
 281  007f ae500f        	ldw	x,#20495
 282  0082 cd0000        	call	_GPIO_Init
 284  0085 85            	popw	x
 285                     ; 101 	GPIO_Init( GPIOC, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);
 287  0086 4be0          	push	#224
 288  0088 4b10          	push	#16
 289  008a ae500a        	ldw	x,#20490
 290  008d cd0000        	call	_GPIO_Init
 292  0090 85            	popw	x
 293                     ; 104 	GPIO_Init( GPIOB, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
 295  0091 4be0          	push	#224
 296  0093 4b04          	push	#4
 297  0095 ae5005        	ldw	x,#20485
 298  0098 cd0000        	call	_GPIO_Init
 300  009b 85            	popw	x
 301                     ; 107 	GPIO_Init( GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
 303  009c 4be0          	push	#224
 304  009e 4b08          	push	#8
 305  00a0 ae500f        	ldw	x,#20495
 306  00a3 cd0000        	call	_GPIO_Init
 308  00a6 85            	popw	x
 309                     ; 110 	GPIO_Init( GPIOC, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
 311  00a7 4be0          	push	#224
 312  00a9 4b04          	push	#4
 313  00ab ae500a        	ldw	x,#20490
 314  00ae cd0000        	call	_GPIO_Init
 316  00b1 85            	popw	x
 317                     ; 113 	GPIO_Init( GPIOF, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);
 319  00b2 4be0          	push	#224
 320  00b4 4b10          	push	#16
 321  00b6 ae5019        	ldw	x,#20505
 322  00b9 cd0000        	call	_GPIO_Init
 324  00bc 85            	popw	x
 325                     ; 139 }
 328  00bd 81            	ret
 353                     ; 146 void ADC_Config(void)
 353                     ; 147 {
 354                     	switch	.text
 355  00be               L7_ADC_Config:
 359                     ; 149   ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS,ADC1_CHANNEL_0,ADC1_PRESSEL_FCPU_D2,ADC1_EXTTRIG_TIM,DISABLE,ADC1_ALIGN_RIGHT,ADC1_SCHMITTTRIG_ALL,DISABLE);
 361  00be 4b00          	push	#0
 362  00c0 4bff          	push	#255
 363  00c2 4b08          	push	#8
 364  00c4 4b00          	push	#0
 365  00c6 4b00          	push	#0
 366  00c8 4b00          	push	#0
 367  00ca 5f            	clrw	x
 368  00cb a601          	ld	a,#1
 369  00cd 95            	ld	xh,a
 370  00ce cd0000        	call	_ADC1_Init
 372  00d1 5b06          	addw	sp,#6
 373                     ; 152   ADC1_Cmd(ENABLE);	
 375  00d3 a601          	ld	a,#1
 376  00d5 cd0000        	call	_ADC1_Cmd
 378                     ; 154 }
 381  00d8 81            	ret
 416                     ; 165 void assert_failed(uint8_t* file, uint32_t line)
 416                     ; 166 {
 417                     	switch	.text
 418  00d9               _assert_failed:
 422  00d9               L531:
 423  00d9 20fe          	jra	L531
 436                     	xdef	_main
 437                     	xdef	_assert_failed
 438                     	xref	_GPIO_WriteHigh
 439                     	xref	_GPIO_Init
 440                     	xref	_CLK_SYSCLKConfig
 441                     	xref	_CLK_HSIPrescalerConfig
 442                     	xref	_CLK_ClockSwitchConfig
 443                     	xref	_ADC1_GetConversionValue
 444                     	xref	_ADC1_StartConversion
 445                     	xref	_ADC1_Cmd
 446                     	xref	_ADC1_Init
 465                     	end
