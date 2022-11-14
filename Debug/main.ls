   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   4                     	switch	.ubsct
   5  0000               L51_test_ADC:
   6  0000 0000          	ds.b	2
   7  0002               L31_test_temp:
   8  0002 00            	ds.b	1
  65                     ; 27 void main(void)
  65                     ; 28 {
  67                     	switch	.text
  68  0000               _main:
  72                     ; 34   GPIO_Config();
  74  0000 ad6e          	call	L5_GPIO_Config
  76                     ; 37   CLK_Config();
  78  0002 ad4e          	call	L3_CLK_Config
  80                     ; 40   ADC_Config();
  82  0004 cd00d2        	call	L7_ADC_Config
  84                     ; 43   PWM_Config();
  86  0007 cd00f6        	call	L11_PWM_Config
  88  000a               L74:
  89                     ; 48 		GPIO_WriteHigh(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_5);
  91  000a 4b20          	push	#32
  92  000c ae500f        	ldw	x,#20495
  93  000f cd0000        	call	_GPIO_WriteHigh
  95  0012 84            	pop	a
  96                     ; 50 		GPIO_WriteHigh(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_2);
  98  0013 4b04          	push	#4
  99  0015 ae500f        	ldw	x,#20495
 100  0018 cd0000        	call	_GPIO_WriteHigh
 102  001b 84            	pop	a
 103                     ; 52 		GPIO_WriteHigh(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_4);
 105  001c 4b10          	push	#16
 106  001e ae500a        	ldw	x,#20490
 107  0021 cd0000        	call	_GPIO_WriteHigh
 109  0024 84            	pop	a
 110                     ; 54 		GPIO_WriteHigh(GPIOB, (GPIO_Pin_TypeDef)GPIO_PIN_2);
 112  0025 4b04          	push	#4
 113  0027 ae5005        	ldw	x,#20485
 114  002a cd0000        	call	_GPIO_WriteHigh
 116  002d 84            	pop	a
 117                     ; 56 		GPIO_WriteHigh(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_3);
 119  002e 4b08          	push	#8
 120  0030 ae500f        	ldw	x,#20495
 121  0033 cd0000        	call	_GPIO_WriteHigh
 123  0036 84            	pop	a
 124                     ; 58 		GPIO_WriteHigh(GPIOF, (GPIO_Pin_TypeDef)GPIO_PIN_4);
 126  0037 4b10          	push	#16
 127  0039 ae5019        	ldw	x,#20505
 128  003c cd0000        	call	_GPIO_WriteHigh
 130  003f 84            	pop	a
 131                     ; 60     ADC1_StartConversion();
 133  0040 cd0000        	call	_ADC1_StartConversion
 135                     ; 61     test_ADC = ADC1_GetConversionValue();
 137  0043 cd0000        	call	_ADC1_GetConversionValue
 139  0046 bf00          	ldw	L51_test_ADC,x
 140                     ; 63     TIM1_SetCompare2(80);//80%
 142  0048 ae0050        	ldw	x,#80
 143  004b cd0317        	call	_TIM1_SetCompare2
 145                     ; 65 		test_temp++;
 147  004e 3c02          	inc	L31_test_temp
 149  0050 20b8          	jra	L74
 207                     ; 74 void CLK_Config(void)
 207                     ; 75 {
 208                     	switch	.text
 209  0052               L3_CLK_Config:
 211  0052 88            	push	a
 212       00000001      OFST:	set	1
 215                     ; 77   ErrorStatus status = ERROR;
 217  0053 0f01          	clr	(OFST+0,sp)
 218                     ; 80   CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 220  0055 4f            	clr	a
 221  0056 cd0000        	call	_CLK_HSIPrescalerConfig
 223                     ; 83 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 225  0059 a680          	ld	a,#128
 226  005b cd0000        	call	_CLK_SYSCLKConfig
 228                     ; 86 	status = CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE,
 228                     ; 87                                    DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
 230  005e 4b00          	push	#0
 231  0060 4b00          	push	#0
 232  0062 ae00b4        	ldw	x,#180
 233  0065 a601          	ld	a,#1
 234  0067 95            	ld	xh,a
 235  0068 cd0000        	call	_CLK_ClockSwitchConfig
 237  006b 85            	popw	x
 238  006c 6b01          	ld	(OFST+0,sp),a
 239                     ; 90 }
 242  006e 84            	pop	a
 243  006f 81            	ret
 268                     ; 97 void GPIO_Config(void)
 268                     ; 98 {
 269                     	switch	.text
 270  0070               L5_GPIO_Config:
 274                     ; 101 	GPIO_Init( GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST);
 276  0070 4be0          	push	#224
 277  0072 4b20          	push	#32
 278  0074 ae500f        	ldw	x,#20495
 279  0077 cd0000        	call	_GPIO_Init
 281  007a 85            	popw	x
 282                     ; 104 	GPIO_Init( GPIOD, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
 284  007b 4be0          	push	#224
 285  007d 4b04          	push	#4
 286  007f ae500f        	ldw	x,#20495
 287  0082 cd0000        	call	_GPIO_Init
 289  0085 85            	popw	x
 290                     ; 107 	GPIO_Init( GPIOC, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);
 292  0086 4be0          	push	#224
 293  0088 4b10          	push	#16
 294  008a ae500a        	ldw	x,#20490
 295  008d cd0000        	call	_GPIO_Init
 297  0090 85            	popw	x
 298                     ; 110 	GPIO_Init( GPIOB, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
 300  0091 4be0          	push	#224
 301  0093 4b04          	push	#4
 302  0095 ae5005        	ldw	x,#20485
 303  0098 cd0000        	call	_GPIO_Init
 305  009b 85            	popw	x
 306                     ; 113 	GPIO_Init( GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
 308  009c 4be0          	push	#224
 309  009e 4b08          	push	#8
 310  00a0 ae500f        	ldw	x,#20495
 311  00a3 cd0000        	call	_GPIO_Init
 313  00a6 85            	popw	x
 314                     ; 116 	GPIO_Init( GPIOC, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
 316  00a7 4be0          	push	#224
 317  00a9 4b04          	push	#4
 318  00ab ae500a        	ldw	x,#20490
 319  00ae cd0000        	call	_GPIO_Init
 321  00b1 85            	popw	x
 322                     ; 119 	GPIO_Init( GPIOF, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);
 324  00b2 4be0          	push	#224
 325  00b4 4b10          	push	#16
 326  00b6 ae5019        	ldw	x,#20505
 327  00b9 cd0000        	call	_GPIO_Init
 329  00bc 85            	popw	x
 330                     ; 122 	GPIO_Init( GPIOD, GPIO_PIN_6, GPIO_MODE_IN_PU_IT);
 332  00bd 4b60          	push	#96
 333  00bf 4b40          	push	#64
 334  00c1 ae500f        	ldw	x,#20495
 335  00c4 cd0000        	call	_GPIO_Init
 337  00c7 85            	popw	x
 338                     ; 125   EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD, EXTI_SENSITIVITY_FALL_ONLY);
 340  00c8 ae0002        	ldw	x,#2
 341  00cb a603          	ld	a,#3
 342  00cd 95            	ld	xh,a
 343  00ce cd0000        	call	_EXTI_SetExtIntSensitivity
 345                     ; 135 }
 348  00d1 81            	ret
 374                     ; 142 void ADC_Config(void)
 374                     ; 143 {
 375                     	switch	.text
 376  00d2               L7_ADC_Config:
 380                     ; 146   CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC,ENABLE);
 382  00d2 ae0001        	ldw	x,#1
 383  00d5 a613          	ld	a,#19
 384  00d7 95            	ld	xh,a
 385  00d8 cd0000        	call	_CLK_PeripheralClockConfig
 387                     ; 149   ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS,ADC1_CHANNEL_0,ADC1_PRESSEL_FCPU_D2,ADC1_EXTTRIG_TIM,DISABLE,ADC1_ALIGN_RIGHT,ADC1_SCHMITTTRIG_ALL,DISABLE);
 389  00db 4b00          	push	#0
 390  00dd 4bff          	push	#255
 391  00df 4b08          	push	#8
 392  00e1 4b00          	push	#0
 393  00e3 4b00          	push	#0
 394  00e5 4b00          	push	#0
 395  00e7 5f            	clrw	x
 396  00e8 a601          	ld	a,#1
 397  00ea 95            	ld	xh,a
 398  00eb cd0000        	call	_ADC1_Init
 400  00ee 5b06          	addw	sp,#6
 401                     ; 152   ADC1_Cmd(ENABLE);	
 403  00f0 a601          	ld	a,#1
 404  00f2 cd0000        	call	_ADC1_Cmd
 406                     ; 154 }
 409  00f5 81            	ret
 437                     ; 161 void PWM_Config(void)
 437                     ; 162 {
 438                     	switch	.text
 439  00f6               L11_PWM_Config:
 443                     ; 164   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1,ENABLE);
 445  00f6 ae0001        	ldw	x,#1
 446  00f9 a607          	ld	a,#7
 447  00fb 95            	ld	xh,a
 448  00fc cd0000        	call	_CLK_PeripheralClockConfig
 450                     ; 167   TIM1_TimeBaseInit(7,TIM1_COUNTERMODE_UP,100,0);//10khz
 452  00ff 4b00          	push	#0
 453  0101 ae0064        	ldw	x,#100
 454  0104 89            	pushw	x
 455  0105 4b00          	push	#0
 456  0107 ae0007        	ldw	x,#7
 457  010a ad25          	call	_TIM1_TimeBaseInit
 459  010c 5b04          	addw	sp,#4
 460                     ; 170   TIM1_OC2Init(TIM1_OCMODE_PWM2,TIM1_OUTPUTSTATE_ENABLE,TIM1_OUTPUTNSTATE_DISABLE,0,TIM1_OCPOLARITY_LOW,TIM1_OCPOLARITY_HIGH,TIM1_OCIDLESTATE_RESET,TIM1_OCNIDLESTATE_RESET);
 462  010e 4b00          	push	#0
 463  0110 4b00          	push	#0
 464  0112 4b00          	push	#0
 465  0114 4b22          	push	#34
 466  0116 5f            	clrw	x
 467  0117 89            	pushw	x
 468  0118 4b00          	push	#0
 469  011a ae0011        	ldw	x,#17
 470  011d a670          	ld	a,#112
 471  011f 95            	ld	xh,a
 472  0120 ad63          	call	_TIM1_OC2Init
 474  0122 5b07          	addw	sp,#7
 475                     ; 173   TIM1_Cmd(ENABLE);
 477  0124 a601          	ld	a,#1
 478  0126 cd02c1        	call	_TIM1_Cmd
 480                     ; 176   TIM1_CtrlPWMOutputs(ENABLE);
 482  0129 a601          	ld	a,#1
 483  012b cd02ec        	call	_TIM1_CtrlPWMOutputs
 485                     ; 177 }
 488  012e 81            	ret
 523                     ; 188 void assert_failed(uint8_t* file, uint32_t line)
 523                     ; 189 {
 524                     	switch	.text
 525  012f               _assert_failed:
 529  012f               L741:
 530  012f 20fe          	jra	L741
 640                     ; 210 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 640                     ; 211                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 640                     ; 212                        uint16_t TIM1_Period,
 640                     ; 213                        uint8_t TIM1_RepetitionCounter)
 640                     ; 214 {
 641                     	switch	.text
 642  0131               _TIM1_TimeBaseInit:
 644  0131 89            	pushw	x
 645       00000000      OFST:	set	0
 648                     ; 217     assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 650  0132 0d05          	tnz	(OFST+5,sp)
 651  0134 2718          	jreq	L42
 652  0136 7b05          	ld	a,(OFST+5,sp)
 653  0138 a110          	cp	a,#16
 654  013a 2712          	jreq	L42
 655  013c 7b05          	ld	a,(OFST+5,sp)
 656  013e a120          	cp	a,#32
 657  0140 270c          	jreq	L42
 658  0142 7b05          	ld	a,(OFST+5,sp)
 659  0144 a140          	cp	a,#64
 660  0146 2706          	jreq	L42
 661  0148 7b05          	ld	a,(OFST+5,sp)
 662  014a a160          	cp	a,#96
 663  014c 2603          	jrne	L22
 664  014e               L42:
 665  014e 4f            	clr	a
 666  014f 200f          	jra	L62
 667  0151               L22:
 668  0151 ae00d9        	ldw	x,#217
 669  0154 89            	pushw	x
 670  0155 ae0000        	ldw	x,#0
 671  0158 89            	pushw	x
 672  0159 ae0000        	ldw	x,#L322
 673  015c add1          	call	_assert_failed
 675  015e 5b04          	addw	sp,#4
 676  0160               L62:
 677                     ; 220     TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 679  0160 7b06          	ld	a,(OFST+6,sp)
 680  0162 c75262        	ld	21090,a
 681                     ; 221     TIM1->ARRL = (uint8_t)(TIM1_Period);
 683  0165 7b07          	ld	a,(OFST+7,sp)
 684  0167 c75263        	ld	21091,a
 685                     ; 224     TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 687  016a 7b01          	ld	a,(OFST+1,sp)
 688  016c c75260        	ld	21088,a
 689                     ; 225     TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 691  016f 7b02          	ld	a,(OFST+2,sp)
 692  0171 c75261        	ld	21089,a
 693                     ; 228     TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 693                     ; 229                            | (uint8_t)(TIM1_CounterMode));
 695  0174 c65250        	ld	a,21072
 696  0177 a48f          	and	a,#143
 697  0179 1a05          	or	a,(OFST+5,sp)
 698  017b c75250        	ld	21072,a
 699                     ; 232     TIM1->RCR = TIM1_RepetitionCounter;
 701  017e 7b08          	ld	a,(OFST+8,sp)
 702  0180 c75264        	ld	21092,a
 703                     ; 234 }
 706  0183 85            	popw	x
 707  0184 81            	ret
 993                     ; 255 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 993                     ; 256                   TIM1_OutputState_TypeDef TIM1_OutputState,
 993                     ; 257                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 993                     ; 258                   uint16_t TIM1_Pulse,
 993                     ; 259                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 993                     ; 260                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 993                     ; 261                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 993                     ; 262                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 993                     ; 263 {
 994                     	switch	.text
 995  0185               _TIM1_OC2Init:
 997  0185 89            	pushw	x
 998  0186 5203          	subw	sp,#3
 999       00000003      OFST:	set	3
1002                     ; 265     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1004  0188 9e            	ld	a,xh
1005  0189 4d            	tnz	a
1006  018a 2719          	jreq	L43
1007  018c 9e            	ld	a,xh
1008  018d a110          	cp	a,#16
1009  018f 2714          	jreq	L43
1010  0191 9e            	ld	a,xh
1011  0192 a120          	cp	a,#32
1012  0194 270f          	jreq	L43
1013  0196 9e            	ld	a,xh
1014  0197 a130          	cp	a,#48
1015  0199 270a          	jreq	L43
1016  019b 9e            	ld	a,xh
1017  019c a160          	cp	a,#96
1018  019e 2705          	jreq	L43
1019  01a0 9e            	ld	a,xh
1020  01a1 a170          	cp	a,#112
1021  01a3 2603          	jrne	L23
1022  01a5               L43:
1023  01a5 4f            	clr	a
1024  01a6 2010          	jra	L63
1025  01a8               L23:
1026  01a8 ae0109        	ldw	x,#265
1027  01ab 89            	pushw	x
1028  01ac ae0000        	ldw	x,#0
1029  01af 89            	pushw	x
1030  01b0 ae0000        	ldw	x,#L322
1031  01b3 cd012f        	call	_assert_failed
1033  01b6 5b04          	addw	sp,#4
1034  01b8               L63:
1035                     ; 266     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1037  01b8 0d05          	tnz	(OFST+2,sp)
1038  01ba 2706          	jreq	L24
1039  01bc 7b05          	ld	a,(OFST+2,sp)
1040  01be a111          	cp	a,#17
1041  01c0 2603          	jrne	L04
1042  01c2               L24:
1043  01c2 4f            	clr	a
1044  01c3 2010          	jra	L44
1045  01c5               L04:
1046  01c5 ae010a        	ldw	x,#266
1047  01c8 89            	pushw	x
1048  01c9 ae0000        	ldw	x,#0
1049  01cc 89            	pushw	x
1050  01cd ae0000        	ldw	x,#L322
1051  01d0 cd012f        	call	_assert_failed
1053  01d3 5b04          	addw	sp,#4
1054  01d5               L44:
1055                     ; 267     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
1057  01d5 0d08          	tnz	(OFST+5,sp)
1058  01d7 2706          	jreq	L05
1059  01d9 7b08          	ld	a,(OFST+5,sp)
1060  01db a144          	cp	a,#68
1061  01dd 2603          	jrne	L64
1062  01df               L05:
1063  01df 4f            	clr	a
1064  01e0 2010          	jra	L25
1065  01e2               L64:
1066  01e2 ae010b        	ldw	x,#267
1067  01e5 89            	pushw	x
1068  01e6 ae0000        	ldw	x,#0
1069  01e9 89            	pushw	x
1070  01ea ae0000        	ldw	x,#L322
1071  01ed cd012f        	call	_assert_failed
1073  01f0 5b04          	addw	sp,#4
1074  01f2               L25:
1075                     ; 268     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1077  01f2 0d0b          	tnz	(OFST+8,sp)
1078  01f4 2706          	jreq	L65
1079  01f6 7b0b          	ld	a,(OFST+8,sp)
1080  01f8 a122          	cp	a,#34
1081  01fa 2603          	jrne	L45
1082  01fc               L65:
1083  01fc 4f            	clr	a
1084  01fd 2010          	jra	L06
1085  01ff               L45:
1086  01ff ae010c        	ldw	x,#268
1087  0202 89            	pushw	x
1088  0203 ae0000        	ldw	x,#0
1089  0206 89            	pushw	x
1090  0207 ae0000        	ldw	x,#L322
1091  020a cd012f        	call	_assert_failed
1093  020d 5b04          	addw	sp,#4
1094  020f               L06:
1095                     ; 269     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
1097  020f 0d0c          	tnz	(OFST+9,sp)
1098  0211 2706          	jreq	L46
1099  0213 7b0c          	ld	a,(OFST+9,sp)
1100  0215 a188          	cp	a,#136
1101  0217 2603          	jrne	L26
1102  0219               L46:
1103  0219 4f            	clr	a
1104  021a 2010          	jra	L66
1105  021c               L26:
1106  021c ae010d        	ldw	x,#269
1107  021f 89            	pushw	x
1108  0220 ae0000        	ldw	x,#0
1109  0223 89            	pushw	x
1110  0224 ae0000        	ldw	x,#L322
1111  0227 cd012f        	call	_assert_failed
1113  022a 5b04          	addw	sp,#4
1114  022c               L66:
1115                     ; 270     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1117  022c 7b0d          	ld	a,(OFST+10,sp)
1118  022e a155          	cp	a,#85
1119  0230 2704          	jreq	L27
1120  0232 0d0d          	tnz	(OFST+10,sp)
1121  0234 2603          	jrne	L07
1122  0236               L27:
1123  0236 4f            	clr	a
1124  0237 2010          	jra	L47
1125  0239               L07:
1126  0239 ae010e        	ldw	x,#270
1127  023c 89            	pushw	x
1128  023d ae0000        	ldw	x,#0
1129  0240 89            	pushw	x
1130  0241 ae0000        	ldw	x,#L322
1131  0244 cd012f        	call	_assert_failed
1133  0247 5b04          	addw	sp,#4
1134  0249               L47:
1135                     ; 271     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
1137  0249 7b0e          	ld	a,(OFST+11,sp)
1138  024b a12a          	cp	a,#42
1139  024d 2704          	jreq	L001
1140  024f 0d0e          	tnz	(OFST+11,sp)
1141  0251 2603          	jrne	L67
1142  0253               L001:
1143  0253 4f            	clr	a
1144  0254 2010          	jra	L201
1145  0256               L67:
1146  0256 ae010f        	ldw	x,#271
1147  0259 89            	pushw	x
1148  025a ae0000        	ldw	x,#0
1149  025d 89            	pushw	x
1150  025e ae0000        	ldw	x,#L322
1151  0261 cd012f        	call	_assert_failed
1153  0264 5b04          	addw	sp,#4
1154  0266               L201:
1155                     ; 275     TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
1155                     ; 276                                 TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
1157  0266 c6525c        	ld	a,21084
1158  0269 a40f          	and	a,#15
1159  026b c7525c        	ld	21084,a
1160                     ; 280     TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
1160                     ; 281                              (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
1160                     ; 282                              (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
1160                     ; 283                              (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
1162  026e 7b0c          	ld	a,(OFST+9,sp)
1163  0270 a480          	and	a,#128
1164  0272 6b03          	ld	(OFST+0,sp),a
1165  0274 7b0b          	ld	a,(OFST+8,sp)
1166  0276 a420          	and	a,#32
1167  0278 1a03          	or	a,(OFST+0,sp)
1168  027a 6b02          	ld	(OFST-1,sp),a
1169  027c 7b08          	ld	a,(OFST+5,sp)
1170  027e a440          	and	a,#64
1171  0280 6b01          	ld	(OFST-2,sp),a
1172  0282 7b05          	ld	a,(OFST+2,sp)
1173  0284 a410          	and	a,#16
1174  0286 1a01          	or	a,(OFST-2,sp)
1175  0288 1a02          	or	a,(OFST-1,sp)
1176  028a ca525c        	or	a,21084
1177  028d c7525c        	ld	21084,a
1178                     ; 286     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1178                     ; 287                              (uint8_t)TIM1_OCMode);
1180  0290 c65259        	ld	a,21081
1181  0293 a48f          	and	a,#143
1182  0295 1a04          	or	a,(OFST+1,sp)
1183  0297 c75259        	ld	21081,a
1184                     ; 290     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
1186  029a c6526f        	ld	a,21103
1187  029d a4f3          	and	a,#243
1188  029f c7526f        	ld	21103,a
1189                     ; 292     TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
1189                     ; 293                             (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
1191  02a2 7b0e          	ld	a,(OFST+11,sp)
1192  02a4 a408          	and	a,#8
1193  02a6 6b03          	ld	(OFST+0,sp),a
1194  02a8 7b0d          	ld	a,(OFST+10,sp)
1195  02aa a404          	and	a,#4
1196  02ac 1a03          	or	a,(OFST+0,sp)
1197  02ae ca526f        	or	a,21103
1198  02b1 c7526f        	ld	21103,a
1199                     ; 296     TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
1201  02b4 7b09          	ld	a,(OFST+6,sp)
1202  02b6 c75267        	ld	21095,a
1203                     ; 297     TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
1205  02b9 7b0a          	ld	a,(OFST+7,sp)
1206  02bb c75268        	ld	21096,a
1207                     ; 299 }
1210  02be 5b05          	addw	sp,#5
1211  02c0 81            	ret
1267                     ; 307 void TIM1_Cmd(FunctionalState NewState)
1267                     ; 308 {
1268                     	switch	.text
1269  02c1               _TIM1_Cmd:
1271  02c1 88            	push	a
1272       00000000      OFST:	set	0
1275                     ; 310     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1277  02c2 4d            	tnz	a
1278  02c3 2704          	jreq	L011
1279  02c5 a101          	cp	a,#1
1280  02c7 2603          	jrne	L601
1281  02c9               L011:
1282  02c9 4f            	clr	a
1283  02ca 2010          	jra	L211
1284  02cc               L601:
1285  02cc ae0136        	ldw	x,#310
1286  02cf 89            	pushw	x
1287  02d0 ae0000        	ldw	x,#0
1288  02d3 89            	pushw	x
1289  02d4 ae0000        	ldw	x,#L322
1290  02d7 cd012f        	call	_assert_failed
1292  02da 5b04          	addw	sp,#4
1293  02dc               L211:
1294                     ; 313     if (NewState != DISABLE)
1296  02dc 0d01          	tnz	(OFST+1,sp)
1297  02de 2706          	jreq	L524
1298                     ; 315         TIM1->CR1 |= TIM1_CR1_CEN;
1300  02e0 72105250      	bset	21072,#0
1302  02e4 2004          	jra	L724
1303  02e6               L524:
1304                     ; 319         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
1306  02e6 72115250      	bres	21072,#0
1307  02ea               L724:
1308                     ; 321 }
1311  02ea 84            	pop	a
1312  02eb 81            	ret
1349                     ; 329 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
1349                     ; 330 {
1350                     	switch	.text
1351  02ec               _TIM1_CtrlPWMOutputs:
1353  02ec 88            	push	a
1354       00000000      OFST:	set	0
1357                     ; 332     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1359  02ed 4d            	tnz	a
1360  02ee 2704          	jreq	L021
1361  02f0 a101          	cp	a,#1
1362  02f2 2603          	jrne	L611
1363  02f4               L021:
1364  02f4 4f            	clr	a
1365  02f5 2010          	jra	L221
1366  02f7               L611:
1367  02f7 ae014c        	ldw	x,#332
1368  02fa 89            	pushw	x
1369  02fb ae0000        	ldw	x,#0
1370  02fe 89            	pushw	x
1371  02ff ae0000        	ldw	x,#L322
1372  0302 cd012f        	call	_assert_failed
1374  0305 5b04          	addw	sp,#4
1375  0307               L221:
1376                     ; 336     if (NewState != DISABLE)
1378  0307 0d01          	tnz	(OFST+1,sp)
1379  0309 2706          	jreq	L744
1380                     ; 338         TIM1->BKR |= TIM1_BKR_MOE;
1382  030b 721e526d      	bset	21101,#7
1384  030f 2004          	jra	L154
1385  0311               L744:
1386                     ; 342         TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
1388  0311 721f526d      	bres	21101,#7
1389  0315               L154:
1390                     ; 344 }
1393  0315 84            	pop	a
1394  0316 81            	ret
1428                     ; 352 void TIM1_SetCompare2(uint16_t Compare2)
1428                     ; 353 {
1429                     	switch	.text
1430  0317               _TIM1_SetCompare2:
1434                     ; 355     TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
1436  0317 9e            	ld	a,xh
1437  0318 c75267        	ld	21095,a
1438                     ; 356     TIM1->CCR2L = (uint8_t)(Compare2);
1440  031b 9f            	ld	a,xl
1441  031c c75268        	ld	21096,a
1442                     ; 358 }
1445  031f 81            	ret
1458                     	xdef	_main
1459                     	xdef	_TIM1_SetCompare2
1460                     	xdef	_TIM1_CtrlPWMOutputs
1461                     	xdef	_TIM1_Cmd
1462                     	xdef	_TIM1_OC2Init
1463                     	xdef	_TIM1_TimeBaseInit
1464                     	xdef	_assert_failed
1465                     	xref	_GPIO_WriteHigh
1466                     	xref	_GPIO_Init
1467                     	xref	_EXTI_SetExtIntSensitivity
1468                     	xref	_CLK_SYSCLKConfig
1469                     	xref	_CLK_HSIPrescalerConfig
1470                     	xref	_CLK_ClockSwitchConfig
1471                     	xref	_CLK_PeripheralClockConfig
1472                     	xref	_ADC1_GetConversionValue
1473                     	xref	_ADC1_StartConversion
1474                     	xref	_ADC1_Cmd
1475                     	xref	_ADC1_Init
1476                     .const:	section	.text
1477  0000               L322:
1478  0000 6d61696e2e63  	dc.b	"main.c",0
1498                     	end
