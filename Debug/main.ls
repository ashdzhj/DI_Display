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
  82  0004 cd00c9        	call	L7_ADC_Config
  84                     ; 43   PWM_Config();
  86  0007 cd00ed        	call	L11_PWM_Config
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
 124                     ; 60 		GPIO_WriteHigh(GPIOF, (GPIO_Pin_TypeDef)GPIO_PIN_4);
 126  0037 4b10          	push	#16
 127  0039 ae5019        	ldw	x,#20505
 128  003c cd0000        	call	_GPIO_WriteHigh
 130  003f 84            	pop	a
 131                     ; 62     ADC1_StartConversion();
 133  0040 cd0000        	call	_ADC1_StartConversion
 135                     ; 63     test_ADC = ADC1_GetConversionValue();
 137  0043 cd0000        	call	_ADC1_GetConversionValue
 139  0046 bf00          	ldw	L51_test_ADC,x
 140                     ; 65     TIM1_SetCompare2(80);//80%
 142  0048 ae0050        	ldw	x,#80
 143  004b cd030e        	call	_TIM1_SetCompare2
 145                     ; 67 		test_temp++;
 147  004e 3c02          	inc	L31_test_temp
 149  0050 20b8          	jra	L74
 207                     ; 76 void CLK_Config(void)
 207                     ; 77 {
 208                     	switch	.text
 209  0052               L3_CLK_Config:
 211  0052 88            	push	a
 212       00000001      OFST:	set	1
 215                     ; 79   ErrorStatus status = ERROR;
 217  0053 0f01          	clr	(OFST+0,sp)
 218                     ; 82   CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 220  0055 4f            	clr	a
 221  0056 cd0000        	call	_CLK_HSIPrescalerConfig
 223                     ; 85 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 225  0059 a680          	ld	a,#128
 226  005b cd0000        	call	_CLK_SYSCLKConfig
 228                     ; 88 	status = CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE,
 228                     ; 89                                    DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
 230  005e 4b00          	push	#0
 231  0060 4b00          	push	#0
 232  0062 ae00b4        	ldw	x,#180
 233  0065 a601          	ld	a,#1
 234  0067 95            	ld	xh,a
 235  0068 cd0000        	call	_CLK_ClockSwitchConfig
 237  006b 85            	popw	x
 238  006c 6b01          	ld	(OFST+0,sp),a
 239                     ; 92 }
 242  006e 84            	pop	a
 243  006f 81            	ret
 267                     ; 99 void GPIO_Config(void)
 267                     ; 100 {
 268                     	switch	.text
 269  0070               L5_GPIO_Config:
 273                     ; 103 	GPIO_Init( GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST);
 275  0070 4be0          	push	#224
 276  0072 4b20          	push	#32
 277  0074 ae500f        	ldw	x,#20495
 278  0077 cd0000        	call	_GPIO_Init
 280  007a 85            	popw	x
 281                     ; 106 	GPIO_Init( GPIOD, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
 283  007b 4be0          	push	#224
 284  007d 4b04          	push	#4
 285  007f ae500f        	ldw	x,#20495
 286  0082 cd0000        	call	_GPIO_Init
 288  0085 85            	popw	x
 289                     ; 109 	GPIO_Init( GPIOC, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);
 291  0086 4be0          	push	#224
 292  0088 4b10          	push	#16
 293  008a ae500a        	ldw	x,#20490
 294  008d cd0000        	call	_GPIO_Init
 296  0090 85            	popw	x
 297                     ; 112 	GPIO_Init( GPIOB, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
 299  0091 4be0          	push	#224
 300  0093 4b04          	push	#4
 301  0095 ae5005        	ldw	x,#20485
 302  0098 cd0000        	call	_GPIO_Init
 304  009b 85            	popw	x
 305                     ; 115 	GPIO_Init( GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
 307  009c 4be0          	push	#224
 308  009e 4b08          	push	#8
 309  00a0 ae500f        	ldw	x,#20495
 310  00a3 cd0000        	call	_GPIO_Init
 312  00a6 85            	popw	x
 313                     ; 118 	GPIO_Init( GPIOC, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
 315  00a7 4be0          	push	#224
 316  00a9 4b04          	push	#4
 317  00ab ae500a        	ldw	x,#20490
 318  00ae cd0000        	call	_GPIO_Init
 320  00b1 85            	popw	x
 321                     ; 121 	GPIO_Init( GPIOF, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);
 323  00b2 4be0          	push	#224
 324  00b4 4b10          	push	#16
 325  00b6 ae5019        	ldw	x,#20505
 326  00b9 cd0000        	call	_GPIO_Init
 328  00bc 85            	popw	x
 329                     ; 124 	GPIO_Init( GPIOD, GPIO_PIN_6, GPIO_MODE_IN_PU_IT);
 331  00bd 4b60          	push	#96
 332  00bf 4b40          	push	#64
 333  00c1 ae500f        	ldw	x,#20495
 334  00c4 cd0000        	call	_GPIO_Init
 336  00c7 85            	popw	x
 337                     ; 136 }
 340  00c8 81            	ret
 366                     ; 143 void ADC_Config(void)
 366                     ; 144 {
 367                     	switch	.text
 368  00c9               L7_ADC_Config:
 372                     ; 147   CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC,ENABLE);
 374  00c9 ae0001        	ldw	x,#1
 375  00cc a613          	ld	a,#19
 376  00ce 95            	ld	xh,a
 377  00cf cd0000        	call	_CLK_PeripheralClockConfig
 379                     ; 150   ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS,ADC1_CHANNEL_0,ADC1_PRESSEL_FCPU_D2,ADC1_EXTTRIG_TIM,DISABLE,ADC1_ALIGN_RIGHT,ADC1_SCHMITTTRIG_ALL,DISABLE);
 381  00d2 4b00          	push	#0
 382  00d4 4bff          	push	#255
 383  00d6 4b08          	push	#8
 384  00d8 4b00          	push	#0
 385  00da 4b00          	push	#0
 386  00dc 4b00          	push	#0
 387  00de 5f            	clrw	x
 388  00df a601          	ld	a,#1
 389  00e1 95            	ld	xh,a
 390  00e2 cd0000        	call	_ADC1_Init
 392  00e5 5b06          	addw	sp,#6
 393                     ; 153   ADC1_Cmd(ENABLE);	
 395  00e7 a601          	ld	a,#1
 396  00e9 cd0000        	call	_ADC1_Cmd
 398                     ; 155 }
 401  00ec 81            	ret
 429                     ; 162 void PWM_Config(void)
 429                     ; 163 {
 430                     	switch	.text
 431  00ed               L11_PWM_Config:
 435                     ; 165   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1,ENABLE);
 437  00ed ae0001        	ldw	x,#1
 438  00f0 a607          	ld	a,#7
 439  00f2 95            	ld	xh,a
 440  00f3 cd0000        	call	_CLK_PeripheralClockConfig
 442                     ; 168   TIM1_TimeBaseInit(7,TIM1_COUNTERMODE_UP,100,0);//10khz
 444  00f6 4b00          	push	#0
 445  00f8 ae0064        	ldw	x,#100
 446  00fb 89            	pushw	x
 447  00fc 4b00          	push	#0
 448  00fe ae0007        	ldw	x,#7
 449  0101 ad25          	call	_TIM1_TimeBaseInit
 451  0103 5b04          	addw	sp,#4
 452                     ; 171   TIM1_OC2Init(TIM1_OCMODE_PWM2,TIM1_OUTPUTSTATE_ENABLE,TIM1_OUTPUTNSTATE_DISABLE,0,TIM1_OCPOLARITY_LOW,TIM1_OCPOLARITY_HIGH,TIM1_OCIDLESTATE_RESET,TIM1_OCNIDLESTATE_RESET);
 454  0105 4b00          	push	#0
 455  0107 4b00          	push	#0
 456  0109 4b00          	push	#0
 457  010b 4b22          	push	#34
 458  010d 5f            	clrw	x
 459  010e 89            	pushw	x
 460  010f 4b00          	push	#0
 461  0111 ae0011        	ldw	x,#17
 462  0114 a670          	ld	a,#112
 463  0116 95            	ld	xh,a
 464  0117 ad63          	call	_TIM1_OC2Init
 466  0119 5b07          	addw	sp,#7
 467                     ; 174   TIM1_Cmd(ENABLE);
 469  011b a601          	ld	a,#1
 470  011d cd02b8        	call	_TIM1_Cmd
 472                     ; 177   TIM1_CtrlPWMOutputs(ENABLE);
 474  0120 a601          	ld	a,#1
 475  0122 cd02e3        	call	_TIM1_CtrlPWMOutputs
 477                     ; 178 }
 480  0125 81            	ret
 515                     ; 189 void assert_failed(uint8_t* file, uint32_t line)
 515                     ; 190 {
 516                     	switch	.text
 517  0126               _assert_failed:
 521  0126               L741:
 522  0126 20fe          	jra	L741
 632                     ; 211 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 632                     ; 212                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 632                     ; 213                        uint16_t TIM1_Period,
 632                     ; 214                        uint8_t TIM1_RepetitionCounter)
 632                     ; 215 {
 633                     	switch	.text
 634  0128               _TIM1_TimeBaseInit:
 636  0128 89            	pushw	x
 637       00000000      OFST:	set	0
 640                     ; 218     assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 642  0129 0d05          	tnz	(OFST+5,sp)
 643  012b 2718          	jreq	L42
 644  012d 7b05          	ld	a,(OFST+5,sp)
 645  012f a110          	cp	a,#16
 646  0131 2712          	jreq	L42
 647  0133 7b05          	ld	a,(OFST+5,sp)
 648  0135 a120          	cp	a,#32
 649  0137 270c          	jreq	L42
 650  0139 7b05          	ld	a,(OFST+5,sp)
 651  013b a140          	cp	a,#64
 652  013d 2706          	jreq	L42
 653  013f 7b05          	ld	a,(OFST+5,sp)
 654  0141 a160          	cp	a,#96
 655  0143 2603          	jrne	L22
 656  0145               L42:
 657  0145 4f            	clr	a
 658  0146 200f          	jra	L62
 659  0148               L22:
 660  0148 ae00da        	ldw	x,#218
 661  014b 89            	pushw	x
 662  014c ae0000        	ldw	x,#0
 663  014f 89            	pushw	x
 664  0150 ae0000        	ldw	x,#L322
 665  0153 add1          	call	_assert_failed
 667  0155 5b04          	addw	sp,#4
 668  0157               L62:
 669                     ; 221     TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 671  0157 7b06          	ld	a,(OFST+6,sp)
 672  0159 c75262        	ld	21090,a
 673                     ; 222     TIM1->ARRL = (uint8_t)(TIM1_Period);
 675  015c 7b07          	ld	a,(OFST+7,sp)
 676  015e c75263        	ld	21091,a
 677                     ; 225     TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 679  0161 7b01          	ld	a,(OFST+1,sp)
 680  0163 c75260        	ld	21088,a
 681                     ; 226     TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 683  0166 7b02          	ld	a,(OFST+2,sp)
 684  0168 c75261        	ld	21089,a
 685                     ; 229     TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 685                     ; 230                            | (uint8_t)(TIM1_CounterMode));
 687  016b c65250        	ld	a,21072
 688  016e a48f          	and	a,#143
 689  0170 1a05          	or	a,(OFST+5,sp)
 690  0172 c75250        	ld	21072,a
 691                     ; 233     TIM1->RCR = TIM1_RepetitionCounter;
 693  0175 7b08          	ld	a,(OFST+8,sp)
 694  0177 c75264        	ld	21092,a
 695                     ; 235 }
 698  017a 85            	popw	x
 699  017b 81            	ret
 985                     ; 256 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 985                     ; 257                   TIM1_OutputState_TypeDef TIM1_OutputState,
 985                     ; 258                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 985                     ; 259                   uint16_t TIM1_Pulse,
 985                     ; 260                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 985                     ; 261                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 985                     ; 262                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 985                     ; 263                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 985                     ; 264 {
 986                     	switch	.text
 987  017c               _TIM1_OC2Init:
 989  017c 89            	pushw	x
 990  017d 5203          	subw	sp,#3
 991       00000003      OFST:	set	3
 994                     ; 266     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 996  017f 9e            	ld	a,xh
 997  0180 4d            	tnz	a
 998  0181 2719          	jreq	L43
 999  0183 9e            	ld	a,xh
1000  0184 a110          	cp	a,#16
1001  0186 2714          	jreq	L43
1002  0188 9e            	ld	a,xh
1003  0189 a120          	cp	a,#32
1004  018b 270f          	jreq	L43
1005  018d 9e            	ld	a,xh
1006  018e a130          	cp	a,#48
1007  0190 270a          	jreq	L43
1008  0192 9e            	ld	a,xh
1009  0193 a160          	cp	a,#96
1010  0195 2705          	jreq	L43
1011  0197 9e            	ld	a,xh
1012  0198 a170          	cp	a,#112
1013  019a 2603          	jrne	L23
1014  019c               L43:
1015  019c 4f            	clr	a
1016  019d 2010          	jra	L63
1017  019f               L23:
1018  019f ae010a        	ldw	x,#266
1019  01a2 89            	pushw	x
1020  01a3 ae0000        	ldw	x,#0
1021  01a6 89            	pushw	x
1022  01a7 ae0000        	ldw	x,#L322
1023  01aa cd0126        	call	_assert_failed
1025  01ad 5b04          	addw	sp,#4
1026  01af               L63:
1027                     ; 267     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1029  01af 0d05          	tnz	(OFST+2,sp)
1030  01b1 2706          	jreq	L24
1031  01b3 7b05          	ld	a,(OFST+2,sp)
1032  01b5 a111          	cp	a,#17
1033  01b7 2603          	jrne	L04
1034  01b9               L24:
1035  01b9 4f            	clr	a
1036  01ba 2010          	jra	L44
1037  01bc               L04:
1038  01bc ae010b        	ldw	x,#267
1039  01bf 89            	pushw	x
1040  01c0 ae0000        	ldw	x,#0
1041  01c3 89            	pushw	x
1042  01c4 ae0000        	ldw	x,#L322
1043  01c7 cd0126        	call	_assert_failed
1045  01ca 5b04          	addw	sp,#4
1046  01cc               L44:
1047                     ; 268     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
1049  01cc 0d08          	tnz	(OFST+5,sp)
1050  01ce 2706          	jreq	L05
1051  01d0 7b08          	ld	a,(OFST+5,sp)
1052  01d2 a144          	cp	a,#68
1053  01d4 2603          	jrne	L64
1054  01d6               L05:
1055  01d6 4f            	clr	a
1056  01d7 2010          	jra	L25
1057  01d9               L64:
1058  01d9 ae010c        	ldw	x,#268
1059  01dc 89            	pushw	x
1060  01dd ae0000        	ldw	x,#0
1061  01e0 89            	pushw	x
1062  01e1 ae0000        	ldw	x,#L322
1063  01e4 cd0126        	call	_assert_failed
1065  01e7 5b04          	addw	sp,#4
1066  01e9               L25:
1067                     ; 269     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1069  01e9 0d0b          	tnz	(OFST+8,sp)
1070  01eb 2706          	jreq	L65
1071  01ed 7b0b          	ld	a,(OFST+8,sp)
1072  01ef a122          	cp	a,#34
1073  01f1 2603          	jrne	L45
1074  01f3               L65:
1075  01f3 4f            	clr	a
1076  01f4 2010          	jra	L06
1077  01f6               L45:
1078  01f6 ae010d        	ldw	x,#269
1079  01f9 89            	pushw	x
1080  01fa ae0000        	ldw	x,#0
1081  01fd 89            	pushw	x
1082  01fe ae0000        	ldw	x,#L322
1083  0201 cd0126        	call	_assert_failed
1085  0204 5b04          	addw	sp,#4
1086  0206               L06:
1087                     ; 270     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
1089  0206 0d0c          	tnz	(OFST+9,sp)
1090  0208 2706          	jreq	L46
1091  020a 7b0c          	ld	a,(OFST+9,sp)
1092  020c a188          	cp	a,#136
1093  020e 2603          	jrne	L26
1094  0210               L46:
1095  0210 4f            	clr	a
1096  0211 2010          	jra	L66
1097  0213               L26:
1098  0213 ae010e        	ldw	x,#270
1099  0216 89            	pushw	x
1100  0217 ae0000        	ldw	x,#0
1101  021a 89            	pushw	x
1102  021b ae0000        	ldw	x,#L322
1103  021e cd0126        	call	_assert_failed
1105  0221 5b04          	addw	sp,#4
1106  0223               L66:
1107                     ; 271     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1109  0223 7b0d          	ld	a,(OFST+10,sp)
1110  0225 a155          	cp	a,#85
1111  0227 2704          	jreq	L27
1112  0229 0d0d          	tnz	(OFST+10,sp)
1113  022b 2603          	jrne	L07
1114  022d               L27:
1115  022d 4f            	clr	a
1116  022e 2010          	jra	L47
1117  0230               L07:
1118  0230 ae010f        	ldw	x,#271
1119  0233 89            	pushw	x
1120  0234 ae0000        	ldw	x,#0
1121  0237 89            	pushw	x
1122  0238 ae0000        	ldw	x,#L322
1123  023b cd0126        	call	_assert_failed
1125  023e 5b04          	addw	sp,#4
1126  0240               L47:
1127                     ; 272     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
1129  0240 7b0e          	ld	a,(OFST+11,sp)
1130  0242 a12a          	cp	a,#42
1131  0244 2704          	jreq	L001
1132  0246 0d0e          	tnz	(OFST+11,sp)
1133  0248 2603          	jrne	L67
1134  024a               L001:
1135  024a 4f            	clr	a
1136  024b 2010          	jra	L201
1137  024d               L67:
1138  024d ae0110        	ldw	x,#272
1139  0250 89            	pushw	x
1140  0251 ae0000        	ldw	x,#0
1141  0254 89            	pushw	x
1142  0255 ae0000        	ldw	x,#L322
1143  0258 cd0126        	call	_assert_failed
1145  025b 5b04          	addw	sp,#4
1146  025d               L201:
1147                     ; 276     TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
1147                     ; 277                                 TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
1149  025d c6525c        	ld	a,21084
1150  0260 a40f          	and	a,#15
1151  0262 c7525c        	ld	21084,a
1152                     ; 281     TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
1152                     ; 282                              (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
1152                     ; 283                              (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
1152                     ; 284                              (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
1154  0265 7b0c          	ld	a,(OFST+9,sp)
1155  0267 a480          	and	a,#128
1156  0269 6b03          	ld	(OFST+0,sp),a
1157  026b 7b0b          	ld	a,(OFST+8,sp)
1158  026d a420          	and	a,#32
1159  026f 1a03          	or	a,(OFST+0,sp)
1160  0271 6b02          	ld	(OFST-1,sp),a
1161  0273 7b08          	ld	a,(OFST+5,sp)
1162  0275 a440          	and	a,#64
1163  0277 6b01          	ld	(OFST-2,sp),a
1164  0279 7b05          	ld	a,(OFST+2,sp)
1165  027b a410          	and	a,#16
1166  027d 1a01          	or	a,(OFST-2,sp)
1167  027f 1a02          	or	a,(OFST-1,sp)
1168  0281 ca525c        	or	a,21084
1169  0284 c7525c        	ld	21084,a
1170                     ; 287     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1170                     ; 288                              (uint8_t)TIM1_OCMode);
1172  0287 c65259        	ld	a,21081
1173  028a a48f          	and	a,#143
1174  028c 1a04          	or	a,(OFST+1,sp)
1175  028e c75259        	ld	21081,a
1176                     ; 291     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
1178  0291 c6526f        	ld	a,21103
1179  0294 a4f3          	and	a,#243
1180  0296 c7526f        	ld	21103,a
1181                     ; 293     TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
1181                     ; 294                             (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
1183  0299 7b0e          	ld	a,(OFST+11,sp)
1184  029b a408          	and	a,#8
1185  029d 6b03          	ld	(OFST+0,sp),a
1186  029f 7b0d          	ld	a,(OFST+10,sp)
1187  02a1 a404          	and	a,#4
1188  02a3 1a03          	or	a,(OFST+0,sp)
1189  02a5 ca526f        	or	a,21103
1190  02a8 c7526f        	ld	21103,a
1191                     ; 297     TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
1193  02ab 7b09          	ld	a,(OFST+6,sp)
1194  02ad c75267        	ld	21095,a
1195                     ; 298     TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
1197  02b0 7b0a          	ld	a,(OFST+7,sp)
1198  02b2 c75268        	ld	21096,a
1199                     ; 300 }
1202  02b5 5b05          	addw	sp,#5
1203  02b7 81            	ret
1259                     ; 308 void TIM1_Cmd(FunctionalState NewState)
1259                     ; 309 {
1260                     	switch	.text
1261  02b8               _TIM1_Cmd:
1263  02b8 88            	push	a
1264       00000000      OFST:	set	0
1267                     ; 311     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1269  02b9 4d            	tnz	a
1270  02ba 2704          	jreq	L011
1271  02bc a101          	cp	a,#1
1272  02be 2603          	jrne	L601
1273  02c0               L011:
1274  02c0 4f            	clr	a
1275  02c1 2010          	jra	L211
1276  02c3               L601:
1277  02c3 ae0137        	ldw	x,#311
1278  02c6 89            	pushw	x
1279  02c7 ae0000        	ldw	x,#0
1280  02ca 89            	pushw	x
1281  02cb ae0000        	ldw	x,#L322
1282  02ce cd0126        	call	_assert_failed
1284  02d1 5b04          	addw	sp,#4
1285  02d3               L211:
1286                     ; 314     if (NewState != DISABLE)
1288  02d3 0d01          	tnz	(OFST+1,sp)
1289  02d5 2706          	jreq	L524
1290                     ; 316         TIM1->CR1 |= TIM1_CR1_CEN;
1292  02d7 72105250      	bset	21072,#0
1294  02db 2004          	jra	L724
1295  02dd               L524:
1296                     ; 320         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
1298  02dd 72115250      	bres	21072,#0
1299  02e1               L724:
1300                     ; 322 }
1303  02e1 84            	pop	a
1304  02e2 81            	ret
1341                     ; 330 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
1341                     ; 331 {
1342                     	switch	.text
1343  02e3               _TIM1_CtrlPWMOutputs:
1345  02e3 88            	push	a
1346       00000000      OFST:	set	0
1349                     ; 333     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1351  02e4 4d            	tnz	a
1352  02e5 2704          	jreq	L021
1353  02e7 a101          	cp	a,#1
1354  02e9 2603          	jrne	L611
1355  02eb               L021:
1356  02eb 4f            	clr	a
1357  02ec 2010          	jra	L221
1358  02ee               L611:
1359  02ee ae014d        	ldw	x,#333
1360  02f1 89            	pushw	x
1361  02f2 ae0000        	ldw	x,#0
1362  02f5 89            	pushw	x
1363  02f6 ae0000        	ldw	x,#L322
1364  02f9 cd0126        	call	_assert_failed
1366  02fc 5b04          	addw	sp,#4
1367  02fe               L221:
1368                     ; 337     if (NewState != DISABLE)
1370  02fe 0d01          	tnz	(OFST+1,sp)
1371  0300 2706          	jreq	L744
1372                     ; 339         TIM1->BKR |= TIM1_BKR_MOE;
1374  0302 721e526d      	bset	21101,#7
1376  0306 2004          	jra	L154
1377  0308               L744:
1378                     ; 343         TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
1380  0308 721f526d      	bres	21101,#7
1381  030c               L154:
1382                     ; 345 }
1385  030c 84            	pop	a
1386  030d 81            	ret
1420                     ; 353 void TIM1_SetCompare2(uint16_t Compare2)
1420                     ; 354 {
1421                     	switch	.text
1422  030e               _TIM1_SetCompare2:
1426                     ; 356     TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
1428  030e 9e            	ld	a,xh
1429  030f c75267        	ld	21095,a
1430                     ; 357     TIM1->CCR2L = (uint8_t)(Compare2);
1432  0312 9f            	ld	a,xl
1433  0313 c75268        	ld	21096,a
1434                     ; 359 }
1437  0316 81            	ret
1450                     	xdef	_main
1451                     	xdef	_TIM1_SetCompare2
1452                     	xdef	_TIM1_CtrlPWMOutputs
1453                     	xdef	_TIM1_Cmd
1454                     	xdef	_TIM1_OC2Init
1455                     	xdef	_TIM1_TimeBaseInit
1456                     	xdef	_assert_failed
1457                     	xref	_GPIO_WriteHigh
1458                     	xref	_GPIO_Init
1459                     	xref	_CLK_SYSCLKConfig
1460                     	xref	_CLK_HSIPrescalerConfig
1461                     	xref	_CLK_ClockSwitchConfig
1462                     	xref	_CLK_PeripheralClockConfig
1463                     	xref	_ADC1_GetConversionValue
1464                     	xref	_ADC1_StartConversion
1465                     	xref	_ADC1_Cmd
1466                     	xref	_ADC1_Init
1467                     .const:	section	.text
1468  0000               L322:
1469  0000 6d61696e2e63  	dc.b	"main.c",0
1489                     	end
