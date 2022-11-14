   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   4                     	switch	.ubsct
   5  0000               L71_test_ADC:
   6  0000 0000          	ds.b	2
   7  0002               L51_test_temp:
   8  0002 00            	ds.b	1
  66                     ; 29 void main(void)
  66                     ; 30 {
  68                     	switch	.text
  69  0000               _main:
  73                     ; 36   GPIO_Config();
  75  0000 ad71          	call	L5_GPIO_Config
  77                     ; 39   CLK_Config();
  79  0002 ad51          	call	L3_CLK_Config
  81                     ; 42   IWDG_Config();
  83  0004 cd0134        	call	L31_IWDG_Config
  85                     ; 45   ADC_Config();
  87  0007 cd00d7        	call	L7_ADC_Config
  89                     ; 48   PWM_Config();
  91  000a cd00fb        	call	L11_PWM_Config
  93  000d               L15:
  94                     ; 56 		GPIO_WriteHigh(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_5);
  96  000d 4b20          	push	#32
  97  000f ae500f        	ldw	x,#20495
  98  0012 cd0000        	call	_GPIO_WriteHigh
 100  0015 84            	pop	a
 101                     ; 58 		GPIO_WriteHigh(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_2);
 103  0016 4b04          	push	#4
 104  0018 ae500f        	ldw	x,#20495
 105  001b cd0000        	call	_GPIO_WriteHigh
 107  001e 84            	pop	a
 108                     ; 60 		GPIO_WriteHigh(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_4);
 110  001f 4b10          	push	#16
 111  0021 ae500a        	ldw	x,#20490
 112  0024 cd0000        	call	_GPIO_WriteHigh
 114  0027 84            	pop	a
 115                     ; 62 		GPIO_WriteHigh(GPIOB, (GPIO_Pin_TypeDef)GPIO_PIN_2);
 117  0028 4b04          	push	#4
 118  002a ae5005        	ldw	x,#20485
 119  002d cd0000        	call	_GPIO_WriteHigh
 121  0030 84            	pop	a
 122                     ; 64 		GPIO_WriteHigh(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_3);
 124  0031 4b08          	push	#8
 125  0033 ae500f        	ldw	x,#20495
 126  0036 cd0000        	call	_GPIO_WriteHigh
 128  0039 84            	pop	a
 129                     ; 66 		GPIO_WriteHigh(GPIOF, (GPIO_Pin_TypeDef)GPIO_PIN_4);
 131  003a 4b10          	push	#16
 132  003c ae5019        	ldw	x,#20505
 133  003f cd0000        	call	_GPIO_WriteHigh
 135  0042 84            	pop	a
 136                     ; 68     ADC1_StartConversion();
 138  0043 cd0000        	call	_ADC1_StartConversion
 140                     ; 69     test_ADC = ADC1_GetConversionValue();
 142  0046 cd0000        	call	_ADC1_GetConversionValue
 144  0049 bf00          	ldw	L71_test_ADC,x
 145                     ; 71     TIM1_SetCompare2(100);//80%
 147  004b ae0064        	ldw	x,#100
 148  004e cd0332        	call	_TIM1_SetCompare2
 150                     ; 73 		test_temp++;
 152  0051 3c02          	inc	L51_test_temp
 154  0053 20b8          	jra	L15
 212                     ; 82 void CLK_Config(void)
 212                     ; 83 {
 213                     	switch	.text
 214  0055               L3_CLK_Config:
 216  0055 88            	push	a
 217       00000001      OFST:	set	1
 220                     ; 85   ErrorStatus status = ERROR;
 222  0056 0f01          	clr	(OFST+0,sp)
 223                     ; 88   CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 225  0058 4f            	clr	a
 226  0059 cd0000        	call	_CLK_HSIPrescalerConfig
 228                     ; 91 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 230  005c a680          	ld	a,#128
 231  005e cd0000        	call	_CLK_SYSCLKConfig
 233                     ; 94 	status = CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE,
 233                     ; 95                                    DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
 235  0061 4b00          	push	#0
 236  0063 4b00          	push	#0
 237  0065 ae00b4        	ldw	x,#180
 238  0068 a601          	ld	a,#1
 239  006a 95            	ld	xh,a
 240  006b cd0000        	call	_CLK_ClockSwitchConfig
 242  006e 85            	popw	x
 243  006f 6b01          	ld	(OFST+0,sp),a
 244                     ; 98 }
 247  0071 84            	pop	a
 248  0072 81            	ret
 275                     ; 105 void GPIO_Config(void)
 275                     ; 106 {
 276                     	switch	.text
 277  0073               L5_GPIO_Config:
 281                     ; 109 	GPIO_Init( GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST);
 283  0073 4be0          	push	#224
 284  0075 4b20          	push	#32
 285  0077 ae500f        	ldw	x,#20495
 286  007a cd0000        	call	_GPIO_Init
 288  007d 85            	popw	x
 289                     ; 112 	GPIO_Init( GPIOD, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
 291  007e 4be0          	push	#224
 292  0080 4b04          	push	#4
 293  0082 ae500f        	ldw	x,#20495
 294  0085 cd0000        	call	_GPIO_Init
 296  0088 85            	popw	x
 297                     ; 115 	GPIO_Init( GPIOC, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);
 299  0089 4be0          	push	#224
 300  008b 4b10          	push	#16
 301  008d ae500a        	ldw	x,#20490
 302  0090 cd0000        	call	_GPIO_Init
 304  0093 85            	popw	x
 305                     ; 118 	GPIO_Init( GPIOB, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
 307  0094 4be0          	push	#224
 308  0096 4b04          	push	#4
 309  0098 ae5005        	ldw	x,#20485
 310  009b cd0000        	call	_GPIO_Init
 312  009e 85            	popw	x
 313                     ; 121 	GPIO_Init( GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
 315  009f 4be0          	push	#224
 316  00a1 4b08          	push	#8
 317  00a3 ae500f        	ldw	x,#20495
 318  00a6 cd0000        	call	_GPIO_Init
 320  00a9 85            	popw	x
 321                     ; 124 	GPIO_Init( GPIOC, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
 323  00aa 4be0          	push	#224
 324  00ac 4b04          	push	#4
 325  00ae ae500a        	ldw	x,#20490
 326  00b1 cd0000        	call	_GPIO_Init
 328  00b4 85            	popw	x
 329                     ; 127 	GPIO_Init( GPIOF, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);
 331  00b5 4be0          	push	#224
 332  00b7 4b10          	push	#16
 333  00b9 ae5019        	ldw	x,#20505
 334  00bc cd0000        	call	_GPIO_Init
 336  00bf 85            	popw	x
 337                     ; 131 	GPIO_Init( GPIOD, GPIO_PIN_6, GPIO_MODE_IN_PU_IT);
 339  00c0 4b60          	push	#96
 340  00c2 4b40          	push	#64
 341  00c4 ae500f        	ldw	x,#20495
 342  00c7 cd0000        	call	_GPIO_Init
 344  00ca 85            	popw	x
 345                     ; 133   disableInterrupts();
 348  00cb 9b            sim
 350                     ; 135   EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD, EXTI_SENSITIVITY_FALL_ONLY);
 353  00cc ae0002        	ldw	x,#2
 354  00cf a603          	ld	a,#3
 355  00d1 95            	ld	xh,a
 356  00d2 cd0000        	call	_EXTI_SetExtIntSensitivity
 358                     ; 136   enableInterrupts();
 361  00d5 9a            rim
 363                     ; 146 }
 367  00d6 81            	ret
 393                     ; 153 void ADC_Config(void)
 393                     ; 154 {
 394                     	switch	.text
 395  00d7               L7_ADC_Config:
 399                     ; 157   CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC,ENABLE);
 401  00d7 ae0001        	ldw	x,#1
 402  00da a613          	ld	a,#19
 403  00dc 95            	ld	xh,a
 404  00dd cd0000        	call	_CLK_PeripheralClockConfig
 406                     ; 160   ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS,ADC1_CHANNEL_0,ADC1_PRESSEL_FCPU_D2,ADC1_EXTTRIG_TIM,DISABLE,ADC1_ALIGN_RIGHT,ADC1_SCHMITTTRIG_ALL,DISABLE);
 408  00e0 4b00          	push	#0
 409  00e2 4bff          	push	#255
 410  00e4 4b08          	push	#8
 411  00e6 4b00          	push	#0
 412  00e8 4b00          	push	#0
 413  00ea 4b00          	push	#0
 414  00ec 5f            	clrw	x
 415  00ed a601          	ld	a,#1
 416  00ef 95            	ld	xh,a
 417  00f0 cd0000        	call	_ADC1_Init
 419  00f3 5b06          	addw	sp,#6
 420                     ; 163   ADC1_Cmd(ENABLE);	
 422  00f5 a601          	ld	a,#1
 423  00f7 cd0000        	call	_ADC1_Cmd
 425                     ; 165 }
 428  00fa 81            	ret
 456                     ; 172 void PWM_Config(void)
 456                     ; 173 {
 457                     	switch	.text
 458  00fb               L11_PWM_Config:
 462                     ; 176   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1,ENABLE);
 464  00fb ae0001        	ldw	x,#1
 465  00fe a607          	ld	a,#7
 466  0100 95            	ld	xh,a
 467  0101 cd0000        	call	_CLK_PeripheralClockConfig
 469                     ; 179   TIM1_TimeBaseInit(7,TIM1_COUNTERMODE_UP,100,0);//10khz
 471  0104 4b00          	push	#0
 472  0106 ae0064        	ldw	x,#100
 473  0109 89            	pushw	x
 474  010a 4b00          	push	#0
 475  010c ae0007        	ldw	x,#7
 476  010f ad3b          	call	_TIM1_TimeBaseInit
 478  0111 5b04          	addw	sp,#4
 479                     ; 182   TIM1_OC2Init(TIM1_OCMODE_PWM2,TIM1_OUTPUTSTATE_ENABLE,TIM1_OUTPUTNSTATE_DISABLE,0,TIM1_OCPOLARITY_LOW,TIM1_OCPOLARITY_HIGH,TIM1_OCIDLESTATE_RESET,TIM1_OCNIDLESTATE_RESET);
 481  0113 4b00          	push	#0
 482  0115 4b00          	push	#0
 483  0117 4b00          	push	#0
 484  0119 4b22          	push	#34
 485  011b 5f            	clrw	x
 486  011c 89            	pushw	x
 487  011d 4b00          	push	#0
 488  011f ae0011        	ldw	x,#17
 489  0122 a670          	ld	a,#112
 490  0124 95            	ld	xh,a
 491  0125 ad79          	call	_TIM1_OC2Init
 493  0127 5b07          	addw	sp,#7
 494                     ; 185   TIM1_Cmd(ENABLE);
 496  0129 a601          	ld	a,#1
 497  012b cd02dc        	call	_TIM1_Cmd
 499                     ; 188   TIM1_CtrlPWMOutputs(ENABLE);
 501  012e a601          	ld	a,#1
 502  0130 cd0307        	call	_TIM1_CtrlPWMOutputs
 504                     ; 190 }
 507  0133 81            	ret
 535                     ; 197 void IWDG_Config(void)
 535                     ; 198 {
 536                     	switch	.text
 537  0134               L31_IWDG_Config:
 541                     ; 203   IWDG_Enable(); 
 543  0134 cd0000        	call	_IWDG_Enable
 545                     ; 207   IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
 547  0137 a655          	ld	a,#85
 548  0139 cd0000        	call	_IWDG_WriteAccessCmd
 550                     ; 210   IWDG_SetPrescaler(IWDG_Prescaler_128);
 552  013c a605          	ld	a,#5
 553  013e cd0000        	call	_IWDG_SetPrescaler
 555                     ; 219   IWDG_SetReload((uint8_t)(0xFF));/*510ms*/
 557  0141 a6ff          	ld	a,#255
 558  0143 cd0000        	call	_IWDG_SetReload
 560                     ; 222   IWDG_ReloadCounter();
 562  0146 cd0000        	call	_IWDG_ReloadCounter
 564                     ; 224 }
 567  0149 81            	ret
 602                     ; 234 void assert_failed(uint8_t* file, uint32_t line)
 602                     ; 235 {
 603                     	switch	.text
 604  014a               _assert_failed:
 608  014a               L161:
 609  014a 20fe          	jra	L161
 719                     ; 256 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 719                     ; 257                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 719                     ; 258                        uint16_t TIM1_Period,
 719                     ; 259                        uint8_t TIM1_RepetitionCounter)
 719                     ; 260 {
 720                     	switch	.text
 721  014c               _TIM1_TimeBaseInit:
 723  014c 89            	pushw	x
 724       00000000      OFST:	set	0
 727                     ; 263     assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 729  014d 0d05          	tnz	(OFST+5,sp)
 730  014f 2718          	jreq	L62
 731  0151 7b05          	ld	a,(OFST+5,sp)
 732  0153 a110          	cp	a,#16
 733  0155 2712          	jreq	L62
 734  0157 7b05          	ld	a,(OFST+5,sp)
 735  0159 a120          	cp	a,#32
 736  015b 270c          	jreq	L62
 737  015d 7b05          	ld	a,(OFST+5,sp)
 738  015f a140          	cp	a,#64
 739  0161 2706          	jreq	L62
 740  0163 7b05          	ld	a,(OFST+5,sp)
 741  0165 a160          	cp	a,#96
 742  0167 2603          	jrne	L42
 743  0169               L62:
 744  0169 4f            	clr	a
 745  016a 200f          	jra	L03
 746  016c               L42:
 747  016c ae0107        	ldw	x,#263
 748  016f 89            	pushw	x
 749  0170 ae0000        	ldw	x,#0
 750  0173 89            	pushw	x
 751  0174 ae0000        	ldw	x,#L532
 752  0177 add1          	call	_assert_failed
 754  0179 5b04          	addw	sp,#4
 755  017b               L03:
 756                     ; 266     TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 758  017b 7b06          	ld	a,(OFST+6,sp)
 759  017d c75262        	ld	21090,a
 760                     ; 267     TIM1->ARRL = (uint8_t)(TIM1_Period);
 762  0180 7b07          	ld	a,(OFST+7,sp)
 763  0182 c75263        	ld	21091,a
 764                     ; 270     TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 766  0185 7b01          	ld	a,(OFST+1,sp)
 767  0187 c75260        	ld	21088,a
 768                     ; 271     TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 770  018a 7b02          	ld	a,(OFST+2,sp)
 771  018c c75261        	ld	21089,a
 772                     ; 274     TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 772                     ; 275                            | (uint8_t)(TIM1_CounterMode));
 774  018f c65250        	ld	a,21072
 775  0192 a48f          	and	a,#143
 776  0194 1a05          	or	a,(OFST+5,sp)
 777  0196 c75250        	ld	21072,a
 778                     ; 278     TIM1->RCR = TIM1_RepetitionCounter;
 780  0199 7b08          	ld	a,(OFST+8,sp)
 781  019b c75264        	ld	21092,a
 782                     ; 280 }
 785  019e 85            	popw	x
 786  019f 81            	ret
1072                     ; 301 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1072                     ; 302                   TIM1_OutputState_TypeDef TIM1_OutputState,
1072                     ; 303                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1072                     ; 304                   uint16_t TIM1_Pulse,
1072                     ; 305                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1072                     ; 306                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1072                     ; 307                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1072                     ; 308                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1072                     ; 309 {
1073                     	switch	.text
1074  01a0               _TIM1_OC2Init:
1076  01a0 89            	pushw	x
1077  01a1 5203          	subw	sp,#3
1078       00000003      OFST:	set	3
1081                     ; 311     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1083  01a3 9e            	ld	a,xh
1084  01a4 4d            	tnz	a
1085  01a5 2719          	jreq	L63
1086  01a7 9e            	ld	a,xh
1087  01a8 a110          	cp	a,#16
1088  01aa 2714          	jreq	L63
1089  01ac 9e            	ld	a,xh
1090  01ad a120          	cp	a,#32
1091  01af 270f          	jreq	L63
1092  01b1 9e            	ld	a,xh
1093  01b2 a130          	cp	a,#48
1094  01b4 270a          	jreq	L63
1095  01b6 9e            	ld	a,xh
1096  01b7 a160          	cp	a,#96
1097  01b9 2705          	jreq	L63
1098  01bb 9e            	ld	a,xh
1099  01bc a170          	cp	a,#112
1100  01be 2603          	jrne	L43
1101  01c0               L63:
1102  01c0 4f            	clr	a
1103  01c1 2010          	jra	L04
1104  01c3               L43:
1105  01c3 ae0137        	ldw	x,#311
1106  01c6 89            	pushw	x
1107  01c7 ae0000        	ldw	x,#0
1108  01ca 89            	pushw	x
1109  01cb ae0000        	ldw	x,#L532
1110  01ce cd014a        	call	_assert_failed
1112  01d1 5b04          	addw	sp,#4
1113  01d3               L04:
1114                     ; 312     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1116  01d3 0d05          	tnz	(OFST+2,sp)
1117  01d5 2706          	jreq	L44
1118  01d7 7b05          	ld	a,(OFST+2,sp)
1119  01d9 a111          	cp	a,#17
1120  01db 2603          	jrne	L24
1121  01dd               L44:
1122  01dd 4f            	clr	a
1123  01de 2010          	jra	L64
1124  01e0               L24:
1125  01e0 ae0138        	ldw	x,#312
1126  01e3 89            	pushw	x
1127  01e4 ae0000        	ldw	x,#0
1128  01e7 89            	pushw	x
1129  01e8 ae0000        	ldw	x,#L532
1130  01eb cd014a        	call	_assert_failed
1132  01ee 5b04          	addw	sp,#4
1133  01f0               L64:
1134                     ; 313     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
1136  01f0 0d08          	tnz	(OFST+5,sp)
1137  01f2 2706          	jreq	L25
1138  01f4 7b08          	ld	a,(OFST+5,sp)
1139  01f6 a144          	cp	a,#68
1140  01f8 2603          	jrne	L05
1141  01fa               L25:
1142  01fa 4f            	clr	a
1143  01fb 2010          	jra	L45
1144  01fd               L05:
1145  01fd ae0139        	ldw	x,#313
1146  0200 89            	pushw	x
1147  0201 ae0000        	ldw	x,#0
1148  0204 89            	pushw	x
1149  0205 ae0000        	ldw	x,#L532
1150  0208 cd014a        	call	_assert_failed
1152  020b 5b04          	addw	sp,#4
1153  020d               L45:
1154                     ; 314     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1156  020d 0d0b          	tnz	(OFST+8,sp)
1157  020f 2706          	jreq	L06
1158  0211 7b0b          	ld	a,(OFST+8,sp)
1159  0213 a122          	cp	a,#34
1160  0215 2603          	jrne	L65
1161  0217               L06:
1162  0217 4f            	clr	a
1163  0218 2010          	jra	L26
1164  021a               L65:
1165  021a ae013a        	ldw	x,#314
1166  021d 89            	pushw	x
1167  021e ae0000        	ldw	x,#0
1168  0221 89            	pushw	x
1169  0222 ae0000        	ldw	x,#L532
1170  0225 cd014a        	call	_assert_failed
1172  0228 5b04          	addw	sp,#4
1173  022a               L26:
1174                     ; 315     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
1176  022a 0d0c          	tnz	(OFST+9,sp)
1177  022c 2706          	jreq	L66
1178  022e 7b0c          	ld	a,(OFST+9,sp)
1179  0230 a188          	cp	a,#136
1180  0232 2603          	jrne	L46
1181  0234               L66:
1182  0234 4f            	clr	a
1183  0235 2010          	jra	L07
1184  0237               L46:
1185  0237 ae013b        	ldw	x,#315
1186  023a 89            	pushw	x
1187  023b ae0000        	ldw	x,#0
1188  023e 89            	pushw	x
1189  023f ae0000        	ldw	x,#L532
1190  0242 cd014a        	call	_assert_failed
1192  0245 5b04          	addw	sp,#4
1193  0247               L07:
1194                     ; 316     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1196  0247 7b0d          	ld	a,(OFST+10,sp)
1197  0249 a155          	cp	a,#85
1198  024b 2704          	jreq	L47
1199  024d 0d0d          	tnz	(OFST+10,sp)
1200  024f 2603          	jrne	L27
1201  0251               L47:
1202  0251 4f            	clr	a
1203  0252 2010          	jra	L67
1204  0254               L27:
1205  0254 ae013c        	ldw	x,#316
1206  0257 89            	pushw	x
1207  0258 ae0000        	ldw	x,#0
1208  025b 89            	pushw	x
1209  025c ae0000        	ldw	x,#L532
1210  025f cd014a        	call	_assert_failed
1212  0262 5b04          	addw	sp,#4
1213  0264               L67:
1214                     ; 317     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
1216  0264 7b0e          	ld	a,(OFST+11,sp)
1217  0266 a12a          	cp	a,#42
1218  0268 2704          	jreq	L201
1219  026a 0d0e          	tnz	(OFST+11,sp)
1220  026c 2603          	jrne	L001
1221  026e               L201:
1222  026e 4f            	clr	a
1223  026f 2010          	jra	L401
1224  0271               L001:
1225  0271 ae013d        	ldw	x,#317
1226  0274 89            	pushw	x
1227  0275 ae0000        	ldw	x,#0
1228  0278 89            	pushw	x
1229  0279 ae0000        	ldw	x,#L532
1230  027c cd014a        	call	_assert_failed
1232  027f 5b04          	addw	sp,#4
1233  0281               L401:
1234                     ; 321     TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
1234                     ; 322                                 TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
1236  0281 c6525c        	ld	a,21084
1237  0284 a40f          	and	a,#15
1238  0286 c7525c        	ld	21084,a
1239                     ; 326     TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
1239                     ; 327                              (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
1239                     ; 328                              (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
1239                     ; 329                              (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
1241  0289 7b0c          	ld	a,(OFST+9,sp)
1242  028b a480          	and	a,#128
1243  028d 6b03          	ld	(OFST+0,sp),a
1244  028f 7b0b          	ld	a,(OFST+8,sp)
1245  0291 a420          	and	a,#32
1246  0293 1a03          	or	a,(OFST+0,sp)
1247  0295 6b02          	ld	(OFST-1,sp),a
1248  0297 7b08          	ld	a,(OFST+5,sp)
1249  0299 a440          	and	a,#64
1250  029b 6b01          	ld	(OFST-2,sp),a
1251  029d 7b05          	ld	a,(OFST+2,sp)
1252  029f a410          	and	a,#16
1253  02a1 1a01          	or	a,(OFST-2,sp)
1254  02a3 1a02          	or	a,(OFST-1,sp)
1255  02a5 ca525c        	or	a,21084
1256  02a8 c7525c        	ld	21084,a
1257                     ; 332     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1257                     ; 333                              (uint8_t)TIM1_OCMode);
1259  02ab c65259        	ld	a,21081
1260  02ae a48f          	and	a,#143
1261  02b0 1a04          	or	a,(OFST+1,sp)
1262  02b2 c75259        	ld	21081,a
1263                     ; 336     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
1265  02b5 c6526f        	ld	a,21103
1266  02b8 a4f3          	and	a,#243
1267  02ba c7526f        	ld	21103,a
1268                     ; 338     TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
1268                     ; 339                             (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
1270  02bd 7b0e          	ld	a,(OFST+11,sp)
1271  02bf a408          	and	a,#8
1272  02c1 6b03          	ld	(OFST+0,sp),a
1273  02c3 7b0d          	ld	a,(OFST+10,sp)
1274  02c5 a404          	and	a,#4
1275  02c7 1a03          	or	a,(OFST+0,sp)
1276  02c9 ca526f        	or	a,21103
1277  02cc c7526f        	ld	21103,a
1278                     ; 342     TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
1280  02cf 7b09          	ld	a,(OFST+6,sp)
1281  02d1 c75267        	ld	21095,a
1282                     ; 343     TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
1284  02d4 7b0a          	ld	a,(OFST+7,sp)
1285  02d6 c75268        	ld	21096,a
1286                     ; 345 }
1289  02d9 5b05          	addw	sp,#5
1290  02db 81            	ret
1346                     ; 353 void TIM1_Cmd(FunctionalState NewState)
1346                     ; 354 {
1347                     	switch	.text
1348  02dc               _TIM1_Cmd:
1350  02dc 88            	push	a
1351       00000000      OFST:	set	0
1354                     ; 356     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1356  02dd 4d            	tnz	a
1357  02de 2704          	jreq	L211
1358  02e0 a101          	cp	a,#1
1359  02e2 2603          	jrne	L011
1360  02e4               L211:
1361  02e4 4f            	clr	a
1362  02e5 2010          	jra	L411
1363  02e7               L011:
1364  02e7 ae0164        	ldw	x,#356
1365  02ea 89            	pushw	x
1366  02eb ae0000        	ldw	x,#0
1367  02ee 89            	pushw	x
1368  02ef ae0000        	ldw	x,#L532
1369  02f2 cd014a        	call	_assert_failed
1371  02f5 5b04          	addw	sp,#4
1372  02f7               L411:
1373                     ; 359     if (NewState != DISABLE)
1375  02f7 0d01          	tnz	(OFST+1,sp)
1376  02f9 2706          	jreq	L734
1377                     ; 361         TIM1->CR1 |= TIM1_CR1_CEN;
1379  02fb 72105250      	bset	21072,#0
1381  02ff 2004          	jra	L144
1382  0301               L734:
1383                     ; 365         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
1385  0301 72115250      	bres	21072,#0
1386  0305               L144:
1387                     ; 367 }
1390  0305 84            	pop	a
1391  0306 81            	ret
1428                     ; 375 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
1428                     ; 376 {
1429                     	switch	.text
1430  0307               _TIM1_CtrlPWMOutputs:
1432  0307 88            	push	a
1433       00000000      OFST:	set	0
1436                     ; 378     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1438  0308 4d            	tnz	a
1439  0309 2704          	jreq	L221
1440  030b a101          	cp	a,#1
1441  030d 2603          	jrne	L021
1442  030f               L221:
1443  030f 4f            	clr	a
1444  0310 2010          	jra	L421
1445  0312               L021:
1446  0312 ae017a        	ldw	x,#378
1447  0315 89            	pushw	x
1448  0316 ae0000        	ldw	x,#0
1449  0319 89            	pushw	x
1450  031a ae0000        	ldw	x,#L532
1451  031d cd014a        	call	_assert_failed
1453  0320 5b04          	addw	sp,#4
1454  0322               L421:
1455                     ; 382     if (NewState != DISABLE)
1457  0322 0d01          	tnz	(OFST+1,sp)
1458  0324 2706          	jreq	L164
1459                     ; 384         TIM1->BKR |= TIM1_BKR_MOE;
1461  0326 721e526d      	bset	21101,#7
1463  032a 2004          	jra	L364
1464  032c               L164:
1465                     ; 388         TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
1467  032c 721f526d      	bres	21101,#7
1468  0330               L364:
1469                     ; 390 }
1472  0330 84            	pop	a
1473  0331 81            	ret
1507                     ; 398 void TIM1_SetCompare2(uint16_t Compare2)
1507                     ; 399 {
1508                     	switch	.text
1509  0332               _TIM1_SetCompare2:
1513                     ; 401     TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
1515  0332 9e            	ld	a,xh
1516  0333 c75267        	ld	21095,a
1517                     ; 402     TIM1->CCR2L = (uint8_t)(Compare2);
1519  0336 9f            	ld	a,xl
1520  0337 c75268        	ld	21096,a
1521                     ; 404 }
1524  033a 81            	ret
1537                     	xdef	_main
1538                     	xref	_IWDG_Enable
1539                     	xref	_IWDG_ReloadCounter
1540                     	xref	_IWDG_SetReload
1541                     	xref	_IWDG_SetPrescaler
1542                     	xref	_IWDG_WriteAccessCmd
1543                     	xdef	_TIM1_SetCompare2
1544                     	xdef	_TIM1_CtrlPWMOutputs
1545                     	xdef	_TIM1_Cmd
1546                     	xdef	_TIM1_OC2Init
1547                     	xdef	_TIM1_TimeBaseInit
1548                     	xdef	_assert_failed
1549                     	xref	_GPIO_WriteHigh
1550                     	xref	_GPIO_Init
1551                     	xref	_EXTI_SetExtIntSensitivity
1552                     	xref	_CLK_SYSCLKConfig
1553                     	xref	_CLK_HSIPrescalerConfig
1554                     	xref	_CLK_ClockSwitchConfig
1555                     	xref	_CLK_PeripheralClockConfig
1556                     	xref	_ADC1_GetConversionValue
1557                     	xref	_ADC1_StartConversion
1558                     	xref	_ADC1_Cmd
1559                     	xref	_ADC1_Init
1560                     .const:	section	.text
1561  0000               L532:
1562  0000 6d61696e2e63  	dc.b	"main.c",0
1582                     	end
