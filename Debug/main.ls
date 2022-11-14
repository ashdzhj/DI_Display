   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   4                     	switch	.ubsct
   5  0000               L71_test_ADC:
   6  0000 0000          	ds.b	2
   7  0002               L51_test_temp:
   8  0002 00            	ds.b	1
  67                     ; 29 void main(void)
  67                     ; 30 {
  69                     	switch	.text
  70  0000               _main:
  74                     ; 36   GPIO_Config();
  76  0000 ad74          	call	L5_GPIO_Config
  78                     ; 39   CLK_Config();
  80  0002 ad54          	call	L3_CLK_Config
  82                     ; 42   IWDG_Config();
  84  0004 cd0137        	call	L31_IWDG_Config
  86                     ; 45   ADC_Config();
  88  0007 cd00da        	call	L7_ADC_Config
  90                     ; 48   PWM_Config();
  92  000a cd00fe        	call	L11_PWM_Config
  94  000d               L15:
  95                     ; 53     IWDG_ReloadCounter();
  97  000d cd0000        	call	_IWDG_ReloadCounter
  99                     ; 56 		GPIO_WriteHigh(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_5);
 101  0010 4b20          	push	#32
 102  0012 ae500f        	ldw	x,#20495
 103  0015 cd0000        	call	_GPIO_WriteHigh
 105  0018 84            	pop	a
 106                     ; 58 		GPIO_WriteHigh(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_2);
 108  0019 4b04          	push	#4
 109  001b ae500f        	ldw	x,#20495
 110  001e cd0000        	call	_GPIO_WriteHigh
 112  0021 84            	pop	a
 113                     ; 60 		GPIO_WriteHigh(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_4);
 115  0022 4b10          	push	#16
 116  0024 ae500a        	ldw	x,#20490
 117  0027 cd0000        	call	_GPIO_WriteHigh
 119  002a 84            	pop	a
 120                     ; 62 		GPIO_WriteHigh(GPIOB, (GPIO_Pin_TypeDef)GPIO_PIN_2);
 122  002b 4b04          	push	#4
 123  002d ae5005        	ldw	x,#20485
 124  0030 cd0000        	call	_GPIO_WriteHigh
 126  0033 84            	pop	a
 127                     ; 64 		GPIO_WriteHigh(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_3);
 129  0034 4b08          	push	#8
 130  0036 ae500f        	ldw	x,#20495
 131  0039 cd0000        	call	_GPIO_WriteHigh
 133  003c 84            	pop	a
 134                     ; 66 		GPIO_WriteHigh(GPIOF, (GPIO_Pin_TypeDef)GPIO_PIN_4);
 136  003d 4b10          	push	#16
 137  003f ae5019        	ldw	x,#20505
 138  0042 cd0000        	call	_GPIO_WriteHigh
 140  0045 84            	pop	a
 141                     ; 68     ADC1_StartConversion();
 143  0046 cd0000        	call	_ADC1_StartConversion
 145                     ; 69     test_ADC = ADC1_GetConversionValue();
 147  0049 cd0000        	call	_ADC1_GetConversionValue
 149  004c bf00          	ldw	L71_test_ADC,x
 150                     ; 71     TIM1_SetCompare2(100);/* 100% */
 152  004e ae0064        	ldw	x,#100
 153  0051 cd0335        	call	_TIM1_SetCompare2
 155                     ; 73 		test_temp++;
 157  0054 3c02          	inc	L51_test_temp
 159  0056 20b5          	jra	L15
 217                     ; 82 void CLK_Config(void)
 217                     ; 83 {
 218                     	switch	.text
 219  0058               L3_CLK_Config:
 221  0058 88            	push	a
 222       00000001      OFST:	set	1
 225                     ; 85   ErrorStatus status = ERROR;
 227  0059 0f01          	clr	(OFST+0,sp)
 228                     ; 88   CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 230  005b 4f            	clr	a
 231  005c cd0000        	call	_CLK_HSIPrescalerConfig
 233                     ; 91 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 235  005f a680          	ld	a,#128
 236  0061 cd0000        	call	_CLK_SYSCLKConfig
 238                     ; 94 	status = CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE,
 238                     ; 95                                    DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
 240  0064 4b00          	push	#0
 241  0066 4b00          	push	#0
 242  0068 ae00b4        	ldw	x,#180
 243  006b a601          	ld	a,#1
 244  006d 95            	ld	xh,a
 245  006e cd0000        	call	_CLK_ClockSwitchConfig
 247  0071 85            	popw	x
 248  0072 6b01          	ld	(OFST+0,sp),a
 249                     ; 98 }
 252  0074 84            	pop	a
 253  0075 81            	ret
 280                     ; 105 void GPIO_Config(void)
 280                     ; 106 {
 281                     	switch	.text
 282  0076               L5_GPIO_Config:
 286                     ; 109 	GPIO_Init( GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST);
 288  0076 4be0          	push	#224
 289  0078 4b20          	push	#32
 290  007a ae500f        	ldw	x,#20495
 291  007d cd0000        	call	_GPIO_Init
 293  0080 85            	popw	x
 294                     ; 112 	GPIO_Init( GPIOD, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
 296  0081 4be0          	push	#224
 297  0083 4b04          	push	#4
 298  0085 ae500f        	ldw	x,#20495
 299  0088 cd0000        	call	_GPIO_Init
 301  008b 85            	popw	x
 302                     ; 115 	GPIO_Init( GPIOC, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);
 304  008c 4be0          	push	#224
 305  008e 4b10          	push	#16
 306  0090 ae500a        	ldw	x,#20490
 307  0093 cd0000        	call	_GPIO_Init
 309  0096 85            	popw	x
 310                     ; 118 	GPIO_Init( GPIOB, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
 312  0097 4be0          	push	#224
 313  0099 4b04          	push	#4
 314  009b ae5005        	ldw	x,#20485
 315  009e cd0000        	call	_GPIO_Init
 317  00a1 85            	popw	x
 318                     ; 121 	GPIO_Init( GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
 320  00a2 4be0          	push	#224
 321  00a4 4b08          	push	#8
 322  00a6 ae500f        	ldw	x,#20495
 323  00a9 cd0000        	call	_GPIO_Init
 325  00ac 85            	popw	x
 326                     ; 124 	GPIO_Init( GPIOC, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
 328  00ad 4be0          	push	#224
 329  00af 4b04          	push	#4
 330  00b1 ae500a        	ldw	x,#20490
 331  00b4 cd0000        	call	_GPIO_Init
 333  00b7 85            	popw	x
 334                     ; 127 	GPIO_Init( GPIOF, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);
 336  00b8 4be0          	push	#224
 337  00ba 4b10          	push	#16
 338  00bc ae5019        	ldw	x,#20505
 339  00bf cd0000        	call	_GPIO_Init
 341  00c2 85            	popw	x
 342                     ; 131 	GPIO_Init( GPIOD, GPIO_PIN_6, GPIO_MODE_IN_PU_IT);
 344  00c3 4b60          	push	#96
 345  00c5 4b40          	push	#64
 346  00c7 ae500f        	ldw	x,#20495
 347  00ca cd0000        	call	_GPIO_Init
 349  00cd 85            	popw	x
 350                     ; 133   disableInterrupts();
 353  00ce 9b            sim
 355                     ; 135   EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD, EXTI_SENSITIVITY_FALL_ONLY);
 358  00cf ae0002        	ldw	x,#2
 359  00d2 a603          	ld	a,#3
 360  00d4 95            	ld	xh,a
 361  00d5 cd0000        	call	_EXTI_SetExtIntSensitivity
 363                     ; 136   enableInterrupts();
 366  00d8 9a            rim
 368                     ; 146 }
 372  00d9 81            	ret
 398                     ; 153 void ADC_Config(void)
 398                     ; 154 {
 399                     	switch	.text
 400  00da               L7_ADC_Config:
 404                     ; 157   CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC,ENABLE);
 406  00da ae0001        	ldw	x,#1
 407  00dd a613          	ld	a,#19
 408  00df 95            	ld	xh,a
 409  00e0 cd0000        	call	_CLK_PeripheralClockConfig
 411                     ; 160   ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS,ADC1_CHANNEL_0,ADC1_PRESSEL_FCPU_D2,ADC1_EXTTRIG_TIM,DISABLE,ADC1_ALIGN_RIGHT,ADC1_SCHMITTTRIG_ALL,DISABLE);
 413  00e3 4b00          	push	#0
 414  00e5 4bff          	push	#255
 415  00e7 4b08          	push	#8
 416  00e9 4b00          	push	#0
 417  00eb 4b00          	push	#0
 418  00ed 4b00          	push	#0
 419  00ef 5f            	clrw	x
 420  00f0 a601          	ld	a,#1
 421  00f2 95            	ld	xh,a
 422  00f3 cd0000        	call	_ADC1_Init
 424  00f6 5b06          	addw	sp,#6
 425                     ; 163   ADC1_Cmd(ENABLE);	
 427  00f8 a601          	ld	a,#1
 428  00fa cd0000        	call	_ADC1_Cmd
 430                     ; 165 }
 433  00fd 81            	ret
 461                     ; 172 void PWM_Config(void)
 461                     ; 173 {
 462                     	switch	.text
 463  00fe               L11_PWM_Config:
 467                     ; 176   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1,ENABLE);
 469  00fe ae0001        	ldw	x,#1
 470  0101 a607          	ld	a,#7
 471  0103 95            	ld	xh,a
 472  0104 cd0000        	call	_CLK_PeripheralClockConfig
 474                     ; 179   TIM1_TimeBaseInit(7,TIM1_COUNTERMODE_UP,100,0);//10khz
 476  0107 4b00          	push	#0
 477  0109 ae0064        	ldw	x,#100
 478  010c 89            	pushw	x
 479  010d 4b00          	push	#0
 480  010f ae0007        	ldw	x,#7
 481  0112 ad3b          	call	_TIM1_TimeBaseInit
 483  0114 5b04          	addw	sp,#4
 484                     ; 182   TIM1_OC2Init(TIM1_OCMODE_PWM2,TIM1_OUTPUTSTATE_ENABLE,TIM1_OUTPUTNSTATE_DISABLE,0,TIM1_OCPOLARITY_LOW,TIM1_OCPOLARITY_HIGH,TIM1_OCIDLESTATE_RESET,TIM1_OCNIDLESTATE_RESET);
 486  0116 4b00          	push	#0
 487  0118 4b00          	push	#0
 488  011a 4b00          	push	#0
 489  011c 4b22          	push	#34
 490  011e 5f            	clrw	x
 491  011f 89            	pushw	x
 492  0120 4b00          	push	#0
 493  0122 ae0011        	ldw	x,#17
 494  0125 a670          	ld	a,#112
 495  0127 95            	ld	xh,a
 496  0128 ad79          	call	_TIM1_OC2Init
 498  012a 5b07          	addw	sp,#7
 499                     ; 185   TIM1_Cmd(ENABLE);
 501  012c a601          	ld	a,#1
 502  012e cd02df        	call	_TIM1_Cmd
 504                     ; 188   TIM1_CtrlPWMOutputs(ENABLE);
 506  0131 a601          	ld	a,#1
 507  0133 cd030a        	call	_TIM1_CtrlPWMOutputs
 509                     ; 190 }
 512  0136 81            	ret
 540                     ; 197 void IWDG_Config(void)
 540                     ; 198 {
 541                     	switch	.text
 542  0137               L31_IWDG_Config:
 546                     ; 203   IWDG_Enable(); 
 548  0137 cd0000        	call	_IWDG_Enable
 550                     ; 207   IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
 552  013a a655          	ld	a,#85
 553  013c cd0000        	call	_IWDG_WriteAccessCmd
 555                     ; 210   IWDG_SetPrescaler(IWDG_Prescaler_128);
 557  013f a605          	ld	a,#5
 558  0141 cd0000        	call	_IWDG_SetPrescaler
 560                     ; 219   IWDG_SetReload((uint8_t)(0xFF));/*510ms*/
 562  0144 a6ff          	ld	a,#255
 563  0146 cd0000        	call	_IWDG_SetReload
 565                     ; 222   IWDG_ReloadCounter();
 567  0149 cd0000        	call	_IWDG_ReloadCounter
 569                     ; 224 }
 572  014c 81            	ret
 607                     ; 234 void assert_failed(uint8_t* file, uint32_t line)
 607                     ; 235 {
 608                     	switch	.text
 609  014d               _assert_failed:
 613  014d               L161:
 614  014d 20fe          	jra	L161
 724                     ; 255 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 724                     ; 256                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 724                     ; 257                        uint16_t TIM1_Period,
 724                     ; 258                        uint8_t TIM1_RepetitionCounter)
 724                     ; 259 {
 725                     	switch	.text
 726  014f               _TIM1_TimeBaseInit:
 728  014f 89            	pushw	x
 729       00000000      OFST:	set	0
 732                     ; 262     assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 734  0150 0d05          	tnz	(OFST+5,sp)
 735  0152 2718          	jreq	L62
 736  0154 7b05          	ld	a,(OFST+5,sp)
 737  0156 a110          	cp	a,#16
 738  0158 2712          	jreq	L62
 739  015a 7b05          	ld	a,(OFST+5,sp)
 740  015c a120          	cp	a,#32
 741  015e 270c          	jreq	L62
 742  0160 7b05          	ld	a,(OFST+5,sp)
 743  0162 a140          	cp	a,#64
 744  0164 2706          	jreq	L62
 745  0166 7b05          	ld	a,(OFST+5,sp)
 746  0168 a160          	cp	a,#96
 747  016a 2603          	jrne	L42
 748  016c               L62:
 749  016c 4f            	clr	a
 750  016d 200f          	jra	L03
 751  016f               L42:
 752  016f ae0106        	ldw	x,#262
 753  0172 89            	pushw	x
 754  0173 ae0000        	ldw	x,#0
 755  0176 89            	pushw	x
 756  0177 ae0000        	ldw	x,#L532
 757  017a add1          	call	_assert_failed
 759  017c 5b04          	addw	sp,#4
 760  017e               L03:
 761                     ; 265     TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 763  017e 7b06          	ld	a,(OFST+6,sp)
 764  0180 c75262        	ld	21090,a
 765                     ; 266     TIM1->ARRL = (uint8_t)(TIM1_Period);
 767  0183 7b07          	ld	a,(OFST+7,sp)
 768  0185 c75263        	ld	21091,a
 769                     ; 269     TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 771  0188 7b01          	ld	a,(OFST+1,sp)
 772  018a c75260        	ld	21088,a
 773                     ; 270     TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 775  018d 7b02          	ld	a,(OFST+2,sp)
 776  018f c75261        	ld	21089,a
 777                     ; 273     TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 777                     ; 274                            | (uint8_t)(TIM1_CounterMode));
 779  0192 c65250        	ld	a,21072
 780  0195 a48f          	and	a,#143
 781  0197 1a05          	or	a,(OFST+5,sp)
 782  0199 c75250        	ld	21072,a
 783                     ; 277     TIM1->RCR = TIM1_RepetitionCounter;
 785  019c 7b08          	ld	a,(OFST+8,sp)
 786  019e c75264        	ld	21092,a
 787                     ; 279 }
 790  01a1 85            	popw	x
 791  01a2 81            	ret
1077                     ; 300 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1077                     ; 301                   TIM1_OutputState_TypeDef TIM1_OutputState,
1077                     ; 302                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1077                     ; 303                   uint16_t TIM1_Pulse,
1077                     ; 304                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1077                     ; 305                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1077                     ; 306                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1077                     ; 307                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1077                     ; 308 {
1078                     	switch	.text
1079  01a3               _TIM1_OC2Init:
1081  01a3 89            	pushw	x
1082  01a4 5203          	subw	sp,#3
1083       00000003      OFST:	set	3
1086                     ; 310     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1088  01a6 9e            	ld	a,xh
1089  01a7 4d            	tnz	a
1090  01a8 2719          	jreq	L63
1091  01aa 9e            	ld	a,xh
1092  01ab a110          	cp	a,#16
1093  01ad 2714          	jreq	L63
1094  01af 9e            	ld	a,xh
1095  01b0 a120          	cp	a,#32
1096  01b2 270f          	jreq	L63
1097  01b4 9e            	ld	a,xh
1098  01b5 a130          	cp	a,#48
1099  01b7 270a          	jreq	L63
1100  01b9 9e            	ld	a,xh
1101  01ba a160          	cp	a,#96
1102  01bc 2705          	jreq	L63
1103  01be 9e            	ld	a,xh
1104  01bf a170          	cp	a,#112
1105  01c1 2603          	jrne	L43
1106  01c3               L63:
1107  01c3 4f            	clr	a
1108  01c4 2010          	jra	L04
1109  01c6               L43:
1110  01c6 ae0136        	ldw	x,#310
1111  01c9 89            	pushw	x
1112  01ca ae0000        	ldw	x,#0
1113  01cd 89            	pushw	x
1114  01ce ae0000        	ldw	x,#L532
1115  01d1 cd014d        	call	_assert_failed
1117  01d4 5b04          	addw	sp,#4
1118  01d6               L04:
1119                     ; 311     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1121  01d6 0d05          	tnz	(OFST+2,sp)
1122  01d8 2706          	jreq	L44
1123  01da 7b05          	ld	a,(OFST+2,sp)
1124  01dc a111          	cp	a,#17
1125  01de 2603          	jrne	L24
1126  01e0               L44:
1127  01e0 4f            	clr	a
1128  01e1 2010          	jra	L64
1129  01e3               L24:
1130  01e3 ae0137        	ldw	x,#311
1131  01e6 89            	pushw	x
1132  01e7 ae0000        	ldw	x,#0
1133  01ea 89            	pushw	x
1134  01eb ae0000        	ldw	x,#L532
1135  01ee cd014d        	call	_assert_failed
1137  01f1 5b04          	addw	sp,#4
1138  01f3               L64:
1139                     ; 312     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
1141  01f3 0d08          	tnz	(OFST+5,sp)
1142  01f5 2706          	jreq	L25
1143  01f7 7b08          	ld	a,(OFST+5,sp)
1144  01f9 a144          	cp	a,#68
1145  01fb 2603          	jrne	L05
1146  01fd               L25:
1147  01fd 4f            	clr	a
1148  01fe 2010          	jra	L45
1149  0200               L05:
1150  0200 ae0138        	ldw	x,#312
1151  0203 89            	pushw	x
1152  0204 ae0000        	ldw	x,#0
1153  0207 89            	pushw	x
1154  0208 ae0000        	ldw	x,#L532
1155  020b cd014d        	call	_assert_failed
1157  020e 5b04          	addw	sp,#4
1158  0210               L45:
1159                     ; 313     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1161  0210 0d0b          	tnz	(OFST+8,sp)
1162  0212 2706          	jreq	L06
1163  0214 7b0b          	ld	a,(OFST+8,sp)
1164  0216 a122          	cp	a,#34
1165  0218 2603          	jrne	L65
1166  021a               L06:
1167  021a 4f            	clr	a
1168  021b 2010          	jra	L26
1169  021d               L65:
1170  021d ae0139        	ldw	x,#313
1171  0220 89            	pushw	x
1172  0221 ae0000        	ldw	x,#0
1173  0224 89            	pushw	x
1174  0225 ae0000        	ldw	x,#L532
1175  0228 cd014d        	call	_assert_failed
1177  022b 5b04          	addw	sp,#4
1178  022d               L26:
1179                     ; 314     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
1181  022d 0d0c          	tnz	(OFST+9,sp)
1182  022f 2706          	jreq	L66
1183  0231 7b0c          	ld	a,(OFST+9,sp)
1184  0233 a188          	cp	a,#136
1185  0235 2603          	jrne	L46
1186  0237               L66:
1187  0237 4f            	clr	a
1188  0238 2010          	jra	L07
1189  023a               L46:
1190  023a ae013a        	ldw	x,#314
1191  023d 89            	pushw	x
1192  023e ae0000        	ldw	x,#0
1193  0241 89            	pushw	x
1194  0242 ae0000        	ldw	x,#L532
1195  0245 cd014d        	call	_assert_failed
1197  0248 5b04          	addw	sp,#4
1198  024a               L07:
1199                     ; 315     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1201  024a 7b0d          	ld	a,(OFST+10,sp)
1202  024c a155          	cp	a,#85
1203  024e 2704          	jreq	L47
1204  0250 0d0d          	tnz	(OFST+10,sp)
1205  0252 2603          	jrne	L27
1206  0254               L47:
1207  0254 4f            	clr	a
1208  0255 2010          	jra	L67
1209  0257               L27:
1210  0257 ae013b        	ldw	x,#315
1211  025a 89            	pushw	x
1212  025b ae0000        	ldw	x,#0
1213  025e 89            	pushw	x
1214  025f ae0000        	ldw	x,#L532
1215  0262 cd014d        	call	_assert_failed
1217  0265 5b04          	addw	sp,#4
1218  0267               L67:
1219                     ; 316     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
1221  0267 7b0e          	ld	a,(OFST+11,sp)
1222  0269 a12a          	cp	a,#42
1223  026b 2704          	jreq	L201
1224  026d 0d0e          	tnz	(OFST+11,sp)
1225  026f 2603          	jrne	L001
1226  0271               L201:
1227  0271 4f            	clr	a
1228  0272 2010          	jra	L401
1229  0274               L001:
1230  0274 ae013c        	ldw	x,#316
1231  0277 89            	pushw	x
1232  0278 ae0000        	ldw	x,#0
1233  027b 89            	pushw	x
1234  027c ae0000        	ldw	x,#L532
1235  027f cd014d        	call	_assert_failed
1237  0282 5b04          	addw	sp,#4
1238  0284               L401:
1239                     ; 320     TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
1239                     ; 321                                 TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
1241  0284 c6525c        	ld	a,21084
1242  0287 a40f          	and	a,#15
1243  0289 c7525c        	ld	21084,a
1244                     ; 325     TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
1244                     ; 326                              (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
1244                     ; 327                              (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
1244                     ; 328                              (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
1246  028c 7b0c          	ld	a,(OFST+9,sp)
1247  028e a480          	and	a,#128
1248  0290 6b03          	ld	(OFST+0,sp),a
1249  0292 7b0b          	ld	a,(OFST+8,sp)
1250  0294 a420          	and	a,#32
1251  0296 1a03          	or	a,(OFST+0,sp)
1252  0298 6b02          	ld	(OFST-1,sp),a
1253  029a 7b08          	ld	a,(OFST+5,sp)
1254  029c a440          	and	a,#64
1255  029e 6b01          	ld	(OFST-2,sp),a
1256  02a0 7b05          	ld	a,(OFST+2,sp)
1257  02a2 a410          	and	a,#16
1258  02a4 1a01          	or	a,(OFST-2,sp)
1259  02a6 1a02          	or	a,(OFST-1,sp)
1260  02a8 ca525c        	or	a,21084
1261  02ab c7525c        	ld	21084,a
1262                     ; 331     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1262                     ; 332                              (uint8_t)TIM1_OCMode);
1264  02ae c65259        	ld	a,21081
1265  02b1 a48f          	and	a,#143
1266  02b3 1a04          	or	a,(OFST+1,sp)
1267  02b5 c75259        	ld	21081,a
1268                     ; 335     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
1270  02b8 c6526f        	ld	a,21103
1271  02bb a4f3          	and	a,#243
1272  02bd c7526f        	ld	21103,a
1273                     ; 337     TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
1273                     ; 338                             (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
1275  02c0 7b0e          	ld	a,(OFST+11,sp)
1276  02c2 a408          	and	a,#8
1277  02c4 6b03          	ld	(OFST+0,sp),a
1278  02c6 7b0d          	ld	a,(OFST+10,sp)
1279  02c8 a404          	and	a,#4
1280  02ca 1a03          	or	a,(OFST+0,sp)
1281  02cc ca526f        	or	a,21103
1282  02cf c7526f        	ld	21103,a
1283                     ; 341     TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
1285  02d2 7b09          	ld	a,(OFST+6,sp)
1286  02d4 c75267        	ld	21095,a
1287                     ; 342     TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
1289  02d7 7b0a          	ld	a,(OFST+7,sp)
1290  02d9 c75268        	ld	21096,a
1291                     ; 344 }
1294  02dc 5b05          	addw	sp,#5
1295  02de 81            	ret
1351                     ; 352 void TIM1_Cmd(FunctionalState NewState)
1351                     ; 353 {
1352                     	switch	.text
1353  02df               _TIM1_Cmd:
1355  02df 88            	push	a
1356       00000000      OFST:	set	0
1359                     ; 355     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1361  02e0 4d            	tnz	a
1362  02e1 2704          	jreq	L211
1363  02e3 a101          	cp	a,#1
1364  02e5 2603          	jrne	L011
1365  02e7               L211:
1366  02e7 4f            	clr	a
1367  02e8 2010          	jra	L411
1368  02ea               L011:
1369  02ea ae0163        	ldw	x,#355
1370  02ed 89            	pushw	x
1371  02ee ae0000        	ldw	x,#0
1372  02f1 89            	pushw	x
1373  02f2 ae0000        	ldw	x,#L532
1374  02f5 cd014d        	call	_assert_failed
1376  02f8 5b04          	addw	sp,#4
1377  02fa               L411:
1378                     ; 358     if (NewState != DISABLE)
1380  02fa 0d01          	tnz	(OFST+1,sp)
1381  02fc 2706          	jreq	L734
1382                     ; 360         TIM1->CR1 |= TIM1_CR1_CEN;
1384  02fe 72105250      	bset	21072,#0
1386  0302 2004          	jra	L144
1387  0304               L734:
1388                     ; 364         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
1390  0304 72115250      	bres	21072,#0
1391  0308               L144:
1392                     ; 366 }
1395  0308 84            	pop	a
1396  0309 81            	ret
1433                     ; 374 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
1433                     ; 375 {
1434                     	switch	.text
1435  030a               _TIM1_CtrlPWMOutputs:
1437  030a 88            	push	a
1438       00000000      OFST:	set	0
1441                     ; 377     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1443  030b 4d            	tnz	a
1444  030c 2704          	jreq	L221
1445  030e a101          	cp	a,#1
1446  0310 2603          	jrne	L021
1447  0312               L221:
1448  0312 4f            	clr	a
1449  0313 2010          	jra	L421
1450  0315               L021:
1451  0315 ae0179        	ldw	x,#377
1452  0318 89            	pushw	x
1453  0319 ae0000        	ldw	x,#0
1454  031c 89            	pushw	x
1455  031d ae0000        	ldw	x,#L532
1456  0320 cd014d        	call	_assert_failed
1458  0323 5b04          	addw	sp,#4
1459  0325               L421:
1460                     ; 381     if (NewState != DISABLE)
1462  0325 0d01          	tnz	(OFST+1,sp)
1463  0327 2706          	jreq	L164
1464                     ; 383         TIM1->BKR |= TIM1_BKR_MOE;
1466  0329 721e526d      	bset	21101,#7
1468  032d 2004          	jra	L364
1469  032f               L164:
1470                     ; 387         TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
1472  032f 721f526d      	bres	21101,#7
1473  0333               L364:
1474                     ; 389 }
1477  0333 84            	pop	a
1478  0334 81            	ret
1512                     ; 397 void TIM1_SetCompare2(uint16_t Compare2)
1512                     ; 398 {
1513                     	switch	.text
1514  0335               _TIM1_SetCompare2:
1518                     ; 400     TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
1520  0335 9e            	ld	a,xh
1521  0336 c75267        	ld	21095,a
1522                     ; 401     TIM1->CCR2L = (uint8_t)(Compare2);
1524  0339 9f            	ld	a,xl
1525  033a c75268        	ld	21096,a
1526                     ; 403 }
1529  033d 81            	ret
1542                     	xdef	_main
1543                     	xref	_IWDG_Enable
1544                     	xref	_IWDG_ReloadCounter
1545                     	xref	_IWDG_SetReload
1546                     	xref	_IWDG_SetPrescaler
1547                     	xref	_IWDG_WriteAccessCmd
1548                     	xdef	_TIM1_SetCompare2
1549                     	xdef	_TIM1_CtrlPWMOutputs
1550                     	xdef	_TIM1_Cmd
1551                     	xdef	_TIM1_OC2Init
1552                     	xdef	_TIM1_TimeBaseInit
1553                     	xdef	_assert_failed
1554                     	xref	_GPIO_WriteHigh
1555                     	xref	_GPIO_Init
1556                     	xref	_EXTI_SetExtIntSensitivity
1557                     	xref	_CLK_SYSCLKConfig
1558                     	xref	_CLK_HSIPrescalerConfig
1559                     	xref	_CLK_ClockSwitchConfig
1560                     	xref	_CLK_PeripheralClockConfig
1561                     	xref	_ADC1_GetConversionValue
1562                     	xref	_ADC1_StartConversion
1563                     	xref	_ADC1_Cmd
1564                     	xref	_ADC1_Init
1565                     .const:	section	.text
1566  0000               L532:
1567  0000 6d61696e2e63  	dc.b	"main.c",0
1587                     	end
