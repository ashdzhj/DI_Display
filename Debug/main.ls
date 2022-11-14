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
  82  0004 cd00d4        	call	L7_ADC_Config
  84                     ; 43   PWM_Config();
  86  0007 cd00f8        	call	L11_PWM_Config
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
 143  004b cd0319        	call	_TIM1_SetCompare2
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
 270                     ; 97 void GPIO_Config(void)
 270                     ; 98 {
 271                     	switch	.text
 272  0070               L5_GPIO_Config:
 276                     ; 101 	GPIO_Init( GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST);
 278  0070 4be0          	push	#224
 279  0072 4b20          	push	#32
 280  0074 ae500f        	ldw	x,#20495
 281  0077 cd0000        	call	_GPIO_Init
 283  007a 85            	popw	x
 284                     ; 104 	GPIO_Init( GPIOD, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
 286  007b 4be0          	push	#224
 287  007d 4b04          	push	#4
 288  007f ae500f        	ldw	x,#20495
 289  0082 cd0000        	call	_GPIO_Init
 291  0085 85            	popw	x
 292                     ; 107 	GPIO_Init( GPIOC, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);
 294  0086 4be0          	push	#224
 295  0088 4b10          	push	#16
 296  008a ae500a        	ldw	x,#20490
 297  008d cd0000        	call	_GPIO_Init
 299  0090 85            	popw	x
 300                     ; 110 	GPIO_Init( GPIOB, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
 302  0091 4be0          	push	#224
 303  0093 4b04          	push	#4
 304  0095 ae5005        	ldw	x,#20485
 305  0098 cd0000        	call	_GPIO_Init
 307  009b 85            	popw	x
 308                     ; 113 	GPIO_Init( GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
 310  009c 4be0          	push	#224
 311  009e 4b08          	push	#8
 312  00a0 ae500f        	ldw	x,#20495
 313  00a3 cd0000        	call	_GPIO_Init
 315  00a6 85            	popw	x
 316                     ; 116 	GPIO_Init( GPIOC, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
 318  00a7 4be0          	push	#224
 319  00a9 4b04          	push	#4
 320  00ab ae500a        	ldw	x,#20490
 321  00ae cd0000        	call	_GPIO_Init
 323  00b1 85            	popw	x
 324                     ; 119 	GPIO_Init( GPIOF, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);
 326  00b2 4be0          	push	#224
 327  00b4 4b10          	push	#16
 328  00b6 ae5019        	ldw	x,#20505
 329  00b9 cd0000        	call	_GPIO_Init
 331  00bc 85            	popw	x
 332                     ; 121   disableInterrupts();
 335  00bd 9b            sim
 337                     ; 123 	GPIO_Init( GPIOD, GPIO_PIN_6, GPIO_MODE_IN_PU_IT);
 340  00be 4b60          	push	#96
 341  00c0 4b40          	push	#64
 342  00c2 ae500f        	ldw	x,#20495
 343  00c5 cd0000        	call	_GPIO_Init
 345  00c8 85            	popw	x
 346                     ; 126   EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD, EXTI_SENSITIVITY_FALL_ONLY);
 348  00c9 ae0002        	ldw	x,#2
 349  00cc a603          	ld	a,#3
 350  00ce 95            	ld	xh,a
 351  00cf cd0000        	call	_EXTI_SetExtIntSensitivity
 353                     ; 127   enableInterrupts();
 356  00d2 9a            rim
 358                     ; 137 }
 362  00d3 81            	ret
 388                     ; 144 void ADC_Config(void)
 388                     ; 145 {
 389                     	switch	.text
 390  00d4               L7_ADC_Config:
 394                     ; 148   CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC,ENABLE);
 396  00d4 ae0001        	ldw	x,#1
 397  00d7 a613          	ld	a,#19
 398  00d9 95            	ld	xh,a
 399  00da cd0000        	call	_CLK_PeripheralClockConfig
 401                     ; 151   ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS,ADC1_CHANNEL_0,ADC1_PRESSEL_FCPU_D2,ADC1_EXTTRIG_TIM,DISABLE,ADC1_ALIGN_RIGHT,ADC1_SCHMITTTRIG_ALL,DISABLE);
 403  00dd 4b00          	push	#0
 404  00df 4bff          	push	#255
 405  00e1 4b08          	push	#8
 406  00e3 4b00          	push	#0
 407  00e5 4b00          	push	#0
 408  00e7 4b00          	push	#0
 409  00e9 5f            	clrw	x
 410  00ea a601          	ld	a,#1
 411  00ec 95            	ld	xh,a
 412  00ed cd0000        	call	_ADC1_Init
 414  00f0 5b06          	addw	sp,#6
 415                     ; 154   ADC1_Cmd(ENABLE);	
 417  00f2 a601          	ld	a,#1
 418  00f4 cd0000        	call	_ADC1_Cmd
 420                     ; 156 }
 423  00f7 81            	ret
 451                     ; 163 void PWM_Config(void)
 451                     ; 164 {
 452                     	switch	.text
 453  00f8               L11_PWM_Config:
 457                     ; 166   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1,ENABLE);
 459  00f8 ae0001        	ldw	x,#1
 460  00fb a607          	ld	a,#7
 461  00fd 95            	ld	xh,a
 462  00fe cd0000        	call	_CLK_PeripheralClockConfig
 464                     ; 169   TIM1_TimeBaseInit(7,TIM1_COUNTERMODE_UP,100,0);//10khz
 466  0101 4b00          	push	#0
 467  0103 ae0064        	ldw	x,#100
 468  0106 89            	pushw	x
 469  0107 4b00          	push	#0
 470  0109 ae0007        	ldw	x,#7
 471  010c ad25          	call	_TIM1_TimeBaseInit
 473  010e 5b04          	addw	sp,#4
 474                     ; 172   TIM1_OC2Init(TIM1_OCMODE_PWM2,TIM1_OUTPUTSTATE_ENABLE,TIM1_OUTPUTNSTATE_DISABLE,0,TIM1_OCPOLARITY_LOW,TIM1_OCPOLARITY_HIGH,TIM1_OCIDLESTATE_RESET,TIM1_OCNIDLESTATE_RESET);
 476  0110 4b00          	push	#0
 477  0112 4b00          	push	#0
 478  0114 4b00          	push	#0
 479  0116 4b22          	push	#34
 480  0118 5f            	clrw	x
 481  0119 89            	pushw	x
 482  011a 4b00          	push	#0
 483  011c ae0011        	ldw	x,#17
 484  011f a670          	ld	a,#112
 485  0121 95            	ld	xh,a
 486  0122 ad63          	call	_TIM1_OC2Init
 488  0124 5b07          	addw	sp,#7
 489                     ; 175   TIM1_Cmd(ENABLE);
 491  0126 a601          	ld	a,#1
 492  0128 cd02c3        	call	_TIM1_Cmd
 494                     ; 178   TIM1_CtrlPWMOutputs(ENABLE);
 496  012b a601          	ld	a,#1
 497  012d cd02ee        	call	_TIM1_CtrlPWMOutputs
 499                     ; 179 }
 502  0130 81            	ret
 537                     ; 190 void assert_failed(uint8_t* file, uint32_t line)
 537                     ; 191 {
 538                     	switch	.text
 539  0131               _assert_failed:
 543  0131               L741:
 544  0131 20fe          	jra	L741
 654                     ; 212 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 654                     ; 213                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 654                     ; 214                        uint16_t TIM1_Period,
 654                     ; 215                        uint8_t TIM1_RepetitionCounter)
 654                     ; 216 {
 655                     	switch	.text
 656  0133               _TIM1_TimeBaseInit:
 658  0133 89            	pushw	x
 659       00000000      OFST:	set	0
 662                     ; 219     assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 664  0134 0d05          	tnz	(OFST+5,sp)
 665  0136 2718          	jreq	L42
 666  0138 7b05          	ld	a,(OFST+5,sp)
 667  013a a110          	cp	a,#16
 668  013c 2712          	jreq	L42
 669  013e 7b05          	ld	a,(OFST+5,sp)
 670  0140 a120          	cp	a,#32
 671  0142 270c          	jreq	L42
 672  0144 7b05          	ld	a,(OFST+5,sp)
 673  0146 a140          	cp	a,#64
 674  0148 2706          	jreq	L42
 675  014a 7b05          	ld	a,(OFST+5,sp)
 676  014c a160          	cp	a,#96
 677  014e 2603          	jrne	L22
 678  0150               L42:
 679  0150 4f            	clr	a
 680  0151 200f          	jra	L62
 681  0153               L22:
 682  0153 ae00db        	ldw	x,#219
 683  0156 89            	pushw	x
 684  0157 ae0000        	ldw	x,#0
 685  015a 89            	pushw	x
 686  015b ae0000        	ldw	x,#L322
 687  015e add1          	call	_assert_failed
 689  0160 5b04          	addw	sp,#4
 690  0162               L62:
 691                     ; 222     TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 693  0162 7b06          	ld	a,(OFST+6,sp)
 694  0164 c75262        	ld	21090,a
 695                     ; 223     TIM1->ARRL = (uint8_t)(TIM1_Period);
 697  0167 7b07          	ld	a,(OFST+7,sp)
 698  0169 c75263        	ld	21091,a
 699                     ; 226     TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 701  016c 7b01          	ld	a,(OFST+1,sp)
 702  016e c75260        	ld	21088,a
 703                     ; 227     TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 705  0171 7b02          	ld	a,(OFST+2,sp)
 706  0173 c75261        	ld	21089,a
 707                     ; 230     TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 707                     ; 231                            | (uint8_t)(TIM1_CounterMode));
 709  0176 c65250        	ld	a,21072
 710  0179 a48f          	and	a,#143
 711  017b 1a05          	or	a,(OFST+5,sp)
 712  017d c75250        	ld	21072,a
 713                     ; 234     TIM1->RCR = TIM1_RepetitionCounter;
 715  0180 7b08          	ld	a,(OFST+8,sp)
 716  0182 c75264        	ld	21092,a
 717                     ; 236 }
 720  0185 85            	popw	x
 721  0186 81            	ret
1007                     ; 257 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1007                     ; 258                   TIM1_OutputState_TypeDef TIM1_OutputState,
1007                     ; 259                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1007                     ; 260                   uint16_t TIM1_Pulse,
1007                     ; 261                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1007                     ; 262                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1007                     ; 263                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1007                     ; 264                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1007                     ; 265 {
1008                     	switch	.text
1009  0187               _TIM1_OC2Init:
1011  0187 89            	pushw	x
1012  0188 5203          	subw	sp,#3
1013       00000003      OFST:	set	3
1016                     ; 267     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1018  018a 9e            	ld	a,xh
1019  018b 4d            	tnz	a
1020  018c 2719          	jreq	L43
1021  018e 9e            	ld	a,xh
1022  018f a110          	cp	a,#16
1023  0191 2714          	jreq	L43
1024  0193 9e            	ld	a,xh
1025  0194 a120          	cp	a,#32
1026  0196 270f          	jreq	L43
1027  0198 9e            	ld	a,xh
1028  0199 a130          	cp	a,#48
1029  019b 270a          	jreq	L43
1030  019d 9e            	ld	a,xh
1031  019e a160          	cp	a,#96
1032  01a0 2705          	jreq	L43
1033  01a2 9e            	ld	a,xh
1034  01a3 a170          	cp	a,#112
1035  01a5 2603          	jrne	L23
1036  01a7               L43:
1037  01a7 4f            	clr	a
1038  01a8 2010          	jra	L63
1039  01aa               L23:
1040  01aa ae010b        	ldw	x,#267
1041  01ad 89            	pushw	x
1042  01ae ae0000        	ldw	x,#0
1043  01b1 89            	pushw	x
1044  01b2 ae0000        	ldw	x,#L322
1045  01b5 cd0131        	call	_assert_failed
1047  01b8 5b04          	addw	sp,#4
1048  01ba               L63:
1049                     ; 268     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1051  01ba 0d05          	tnz	(OFST+2,sp)
1052  01bc 2706          	jreq	L24
1053  01be 7b05          	ld	a,(OFST+2,sp)
1054  01c0 a111          	cp	a,#17
1055  01c2 2603          	jrne	L04
1056  01c4               L24:
1057  01c4 4f            	clr	a
1058  01c5 2010          	jra	L44
1059  01c7               L04:
1060  01c7 ae010c        	ldw	x,#268
1061  01ca 89            	pushw	x
1062  01cb ae0000        	ldw	x,#0
1063  01ce 89            	pushw	x
1064  01cf ae0000        	ldw	x,#L322
1065  01d2 cd0131        	call	_assert_failed
1067  01d5 5b04          	addw	sp,#4
1068  01d7               L44:
1069                     ; 269     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
1071  01d7 0d08          	tnz	(OFST+5,sp)
1072  01d9 2706          	jreq	L05
1073  01db 7b08          	ld	a,(OFST+5,sp)
1074  01dd a144          	cp	a,#68
1075  01df 2603          	jrne	L64
1076  01e1               L05:
1077  01e1 4f            	clr	a
1078  01e2 2010          	jra	L25
1079  01e4               L64:
1080  01e4 ae010d        	ldw	x,#269
1081  01e7 89            	pushw	x
1082  01e8 ae0000        	ldw	x,#0
1083  01eb 89            	pushw	x
1084  01ec ae0000        	ldw	x,#L322
1085  01ef cd0131        	call	_assert_failed
1087  01f2 5b04          	addw	sp,#4
1088  01f4               L25:
1089                     ; 270     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1091  01f4 0d0b          	tnz	(OFST+8,sp)
1092  01f6 2706          	jreq	L65
1093  01f8 7b0b          	ld	a,(OFST+8,sp)
1094  01fa a122          	cp	a,#34
1095  01fc 2603          	jrne	L45
1096  01fe               L65:
1097  01fe 4f            	clr	a
1098  01ff 2010          	jra	L06
1099  0201               L45:
1100  0201 ae010e        	ldw	x,#270
1101  0204 89            	pushw	x
1102  0205 ae0000        	ldw	x,#0
1103  0208 89            	pushw	x
1104  0209 ae0000        	ldw	x,#L322
1105  020c cd0131        	call	_assert_failed
1107  020f 5b04          	addw	sp,#4
1108  0211               L06:
1109                     ; 271     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
1111  0211 0d0c          	tnz	(OFST+9,sp)
1112  0213 2706          	jreq	L46
1113  0215 7b0c          	ld	a,(OFST+9,sp)
1114  0217 a188          	cp	a,#136
1115  0219 2603          	jrne	L26
1116  021b               L46:
1117  021b 4f            	clr	a
1118  021c 2010          	jra	L66
1119  021e               L26:
1120  021e ae010f        	ldw	x,#271
1121  0221 89            	pushw	x
1122  0222 ae0000        	ldw	x,#0
1123  0225 89            	pushw	x
1124  0226 ae0000        	ldw	x,#L322
1125  0229 cd0131        	call	_assert_failed
1127  022c 5b04          	addw	sp,#4
1128  022e               L66:
1129                     ; 272     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1131  022e 7b0d          	ld	a,(OFST+10,sp)
1132  0230 a155          	cp	a,#85
1133  0232 2704          	jreq	L27
1134  0234 0d0d          	tnz	(OFST+10,sp)
1135  0236 2603          	jrne	L07
1136  0238               L27:
1137  0238 4f            	clr	a
1138  0239 2010          	jra	L47
1139  023b               L07:
1140  023b ae0110        	ldw	x,#272
1141  023e 89            	pushw	x
1142  023f ae0000        	ldw	x,#0
1143  0242 89            	pushw	x
1144  0243 ae0000        	ldw	x,#L322
1145  0246 cd0131        	call	_assert_failed
1147  0249 5b04          	addw	sp,#4
1148  024b               L47:
1149                     ; 273     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
1151  024b 7b0e          	ld	a,(OFST+11,sp)
1152  024d a12a          	cp	a,#42
1153  024f 2704          	jreq	L001
1154  0251 0d0e          	tnz	(OFST+11,sp)
1155  0253 2603          	jrne	L67
1156  0255               L001:
1157  0255 4f            	clr	a
1158  0256 2010          	jra	L201
1159  0258               L67:
1160  0258 ae0111        	ldw	x,#273
1161  025b 89            	pushw	x
1162  025c ae0000        	ldw	x,#0
1163  025f 89            	pushw	x
1164  0260 ae0000        	ldw	x,#L322
1165  0263 cd0131        	call	_assert_failed
1167  0266 5b04          	addw	sp,#4
1168  0268               L201:
1169                     ; 277     TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
1169                     ; 278                                 TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
1171  0268 c6525c        	ld	a,21084
1172  026b a40f          	and	a,#15
1173  026d c7525c        	ld	21084,a
1174                     ; 282     TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
1174                     ; 283                              (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
1174                     ; 284                              (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
1174                     ; 285                              (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
1176  0270 7b0c          	ld	a,(OFST+9,sp)
1177  0272 a480          	and	a,#128
1178  0274 6b03          	ld	(OFST+0,sp),a
1179  0276 7b0b          	ld	a,(OFST+8,sp)
1180  0278 a420          	and	a,#32
1181  027a 1a03          	or	a,(OFST+0,sp)
1182  027c 6b02          	ld	(OFST-1,sp),a
1183  027e 7b08          	ld	a,(OFST+5,sp)
1184  0280 a440          	and	a,#64
1185  0282 6b01          	ld	(OFST-2,sp),a
1186  0284 7b05          	ld	a,(OFST+2,sp)
1187  0286 a410          	and	a,#16
1188  0288 1a01          	or	a,(OFST-2,sp)
1189  028a 1a02          	or	a,(OFST-1,sp)
1190  028c ca525c        	or	a,21084
1191  028f c7525c        	ld	21084,a
1192                     ; 288     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1192                     ; 289                              (uint8_t)TIM1_OCMode);
1194  0292 c65259        	ld	a,21081
1195  0295 a48f          	and	a,#143
1196  0297 1a04          	or	a,(OFST+1,sp)
1197  0299 c75259        	ld	21081,a
1198                     ; 292     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
1200  029c c6526f        	ld	a,21103
1201  029f a4f3          	and	a,#243
1202  02a1 c7526f        	ld	21103,a
1203                     ; 294     TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
1203                     ; 295                             (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
1205  02a4 7b0e          	ld	a,(OFST+11,sp)
1206  02a6 a408          	and	a,#8
1207  02a8 6b03          	ld	(OFST+0,sp),a
1208  02aa 7b0d          	ld	a,(OFST+10,sp)
1209  02ac a404          	and	a,#4
1210  02ae 1a03          	or	a,(OFST+0,sp)
1211  02b0 ca526f        	or	a,21103
1212  02b3 c7526f        	ld	21103,a
1213                     ; 298     TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
1215  02b6 7b09          	ld	a,(OFST+6,sp)
1216  02b8 c75267        	ld	21095,a
1217                     ; 299     TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
1219  02bb 7b0a          	ld	a,(OFST+7,sp)
1220  02bd c75268        	ld	21096,a
1221                     ; 301 }
1224  02c0 5b05          	addw	sp,#5
1225  02c2 81            	ret
1281                     ; 309 void TIM1_Cmd(FunctionalState NewState)
1281                     ; 310 {
1282                     	switch	.text
1283  02c3               _TIM1_Cmd:
1285  02c3 88            	push	a
1286       00000000      OFST:	set	0
1289                     ; 312     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1291  02c4 4d            	tnz	a
1292  02c5 2704          	jreq	L011
1293  02c7 a101          	cp	a,#1
1294  02c9 2603          	jrne	L601
1295  02cb               L011:
1296  02cb 4f            	clr	a
1297  02cc 2010          	jra	L211
1298  02ce               L601:
1299  02ce ae0138        	ldw	x,#312
1300  02d1 89            	pushw	x
1301  02d2 ae0000        	ldw	x,#0
1302  02d5 89            	pushw	x
1303  02d6 ae0000        	ldw	x,#L322
1304  02d9 cd0131        	call	_assert_failed
1306  02dc 5b04          	addw	sp,#4
1307  02de               L211:
1308                     ; 315     if (NewState != DISABLE)
1310  02de 0d01          	tnz	(OFST+1,sp)
1311  02e0 2706          	jreq	L524
1312                     ; 317         TIM1->CR1 |= TIM1_CR1_CEN;
1314  02e2 72105250      	bset	21072,#0
1316  02e6 2004          	jra	L724
1317  02e8               L524:
1318                     ; 321         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
1320  02e8 72115250      	bres	21072,#0
1321  02ec               L724:
1322                     ; 323 }
1325  02ec 84            	pop	a
1326  02ed 81            	ret
1363                     ; 331 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
1363                     ; 332 {
1364                     	switch	.text
1365  02ee               _TIM1_CtrlPWMOutputs:
1367  02ee 88            	push	a
1368       00000000      OFST:	set	0
1371                     ; 334     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1373  02ef 4d            	tnz	a
1374  02f0 2704          	jreq	L021
1375  02f2 a101          	cp	a,#1
1376  02f4 2603          	jrne	L611
1377  02f6               L021:
1378  02f6 4f            	clr	a
1379  02f7 2010          	jra	L221
1380  02f9               L611:
1381  02f9 ae014e        	ldw	x,#334
1382  02fc 89            	pushw	x
1383  02fd ae0000        	ldw	x,#0
1384  0300 89            	pushw	x
1385  0301 ae0000        	ldw	x,#L322
1386  0304 cd0131        	call	_assert_failed
1388  0307 5b04          	addw	sp,#4
1389  0309               L221:
1390                     ; 338     if (NewState != DISABLE)
1392  0309 0d01          	tnz	(OFST+1,sp)
1393  030b 2706          	jreq	L744
1394                     ; 340         TIM1->BKR |= TIM1_BKR_MOE;
1396  030d 721e526d      	bset	21101,#7
1398  0311 2004          	jra	L154
1399  0313               L744:
1400                     ; 344         TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
1402  0313 721f526d      	bres	21101,#7
1403  0317               L154:
1404                     ; 346 }
1407  0317 84            	pop	a
1408  0318 81            	ret
1442                     ; 354 void TIM1_SetCompare2(uint16_t Compare2)
1442                     ; 355 {
1443                     	switch	.text
1444  0319               _TIM1_SetCompare2:
1448                     ; 357     TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
1450  0319 9e            	ld	a,xh
1451  031a c75267        	ld	21095,a
1452                     ; 358     TIM1->CCR2L = (uint8_t)(Compare2);
1454  031d 9f            	ld	a,xl
1455  031e c75268        	ld	21096,a
1456                     ; 360 }
1459  0321 81            	ret
1472                     	xdef	_main
1473                     	xdef	_TIM1_SetCompare2
1474                     	xdef	_TIM1_CtrlPWMOutputs
1475                     	xdef	_TIM1_Cmd
1476                     	xdef	_TIM1_OC2Init
1477                     	xdef	_TIM1_TimeBaseInit
1478                     	xdef	_assert_failed
1479                     	xref	_GPIO_WriteHigh
1480                     	xref	_GPIO_Init
1481                     	xref	_EXTI_SetExtIntSensitivity
1482                     	xref	_CLK_SYSCLKConfig
1483                     	xref	_CLK_HSIPrescalerConfig
1484                     	xref	_CLK_ClockSwitchConfig
1485                     	xref	_CLK_PeripheralClockConfig
1486                     	xref	_ADC1_GetConversionValue
1487                     	xref	_ADC1_StartConversion
1488                     	xref	_ADC1_Cmd
1489                     	xref	_ADC1_Init
1490                     .const:	section	.text
1491  0000               L322:
1492  0000 6d61696e2e63  	dc.b	"main.c",0
1512                     	end
