   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   4                     	switch	.ubsct
   5  0000               L71_test_ADC:
   6  0000 0000          	ds.b	2
   7  0002               L51_test_temp:
   8  0002 00            	ds.b	1
  73                     ; 31 void main(void)
  73                     ; 32 {
  75                     	switch	.text
  76  0000               _main:
  80                     ; 38   GPIO_Config();
  82  0000 cd00aa        	call	L5_GPIO_Config
  84                     ; 41   CLK_Config();
  86  0003 cd008c        	call	L3_CLK_Config
  88                     ; 44   IWDG_Config();
  90  0006 cd016b        	call	L31_IWDG_Config
  92                     ; 47   ADC_Config();
  94  0009 cd010e        	call	L7_ADC_Config
  96                     ; 50   PWM_Config();
  98  000c cd0132        	call	L11_PWM_Config
 100                     ; 53   CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C,ENABLE);
 102  000f ae0001        	ldw	x,#1
 103  0012 4f            	clr	a
 104  0013 95            	ld	xh,a
 105  0014 cd0000        	call	_CLK_PeripheralClockConfig
 107                     ; 54   I2C_Init(100000,0x88,I2C_DUTYCYCLE_2,I2C_ACK_CURR,I2C_ADDMODE_7BIT,8);
 109  0017 4b08          	push	#8
 110  0019 4b00          	push	#0
 111  001b 4b01          	push	#1
 112  001d 4b00          	push	#0
 113  001f ae0088        	ldw	x,#136
 114  0022 89            	pushw	x
 115  0023 ae86a0        	ldw	x,#34464
 116  0026 89            	pushw	x
 117  0027 ae0001        	ldw	x,#1
 118  002a 89            	pushw	x
 119  002b cd0372        	call	_I2C_Init
 121  002e 5b0a          	addw	sp,#10
 122                     ; 55   I2C_Cmd(ENABLE);
 124  0030 a601          	ld	a,#1
 125  0032 cd0574        	call	_I2C_Cmd
 127                     ; 57   TCA6408AInitDefault(&localReg);
 129  0035 ae0000        	ldw	x,#_localReg
 130  0038 cd0000        	call	_TCA6408AInitDefault
 132                     ; 58   TCA6408AInitI2CReg(&localReg);
 134  003b ae0000        	ldw	x,#_localReg
 135  003e cd0000        	call	_TCA6408AInitI2CReg
 137  0041               L15:
 138                     ; 63     IWDG_ReloadCounter();
 140  0041 cd0000        	call	_IWDG_ReloadCounter
 142                     ; 66 		GPIO_WriteHigh(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_5);
 144  0044 4b20          	push	#32
 145  0046 ae500f        	ldw	x,#20495
 146  0049 cd0000        	call	_GPIO_WriteHigh
 148  004c 84            	pop	a
 149                     ; 68 		GPIO_WriteHigh(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_2);
 151  004d 4b04          	push	#4
 152  004f ae500f        	ldw	x,#20495
 153  0052 cd0000        	call	_GPIO_WriteHigh
 155  0055 84            	pop	a
 156                     ; 70 		GPIO_WriteHigh(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_4);
 158  0056 4b10          	push	#16
 159  0058 ae500a        	ldw	x,#20490
 160  005b cd0000        	call	_GPIO_WriteHigh
 162  005e 84            	pop	a
 163                     ; 72 		GPIO_WriteHigh(GPIOB, (GPIO_Pin_TypeDef)GPIO_PIN_2);
 165  005f 4b04          	push	#4
 166  0061 ae5005        	ldw	x,#20485
 167  0064 cd0000        	call	_GPIO_WriteHigh
 169  0067 84            	pop	a
 170                     ; 74 		GPIO_WriteHigh(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_3);
 172  0068 4b08          	push	#8
 173  006a ae500f        	ldw	x,#20495
 174  006d cd0000        	call	_GPIO_WriteHigh
 176  0070 84            	pop	a
 177                     ; 76 		GPIO_WriteHigh(GPIOF, (GPIO_Pin_TypeDef)GPIO_PIN_4);
 179  0071 4b10          	push	#16
 180  0073 ae5019        	ldw	x,#20505
 181  0076 cd0000        	call	_GPIO_WriteHigh
 183  0079 84            	pop	a
 184                     ; 78     ADC1_StartConversion();
 186  007a cd0000        	call	_ADC1_StartConversion
 188                     ; 79     test_ADC = ADC1_GetConversionValue();
 190  007d cd0000        	call	_ADC1_GetConversionValue
 192  0080 bf00          	ldw	L71_test_ADC,x
 193                     ; 81     TIM1_SetCompare2(100);/* 100% */
 195  0082 ae0064        	ldw	x,#100
 196  0085 cd0369        	call	_TIM1_SetCompare2
 198                     ; 83 		test_temp++;
 200  0088 3c02          	inc	L51_test_temp
 202  008a 20b5          	jra	L15
 260                     ; 92 void CLK_Config(void)
 260                     ; 93 {
 261                     	switch	.text
 262  008c               L3_CLK_Config:
 264  008c 88            	push	a
 265       00000001      OFST:	set	1
 268                     ; 95   ErrorStatus status = ERROR;
 270  008d 0f01          	clr	(OFST+0,sp)
 271                     ; 98   CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 273  008f 4f            	clr	a
 274  0090 cd0000        	call	_CLK_HSIPrescalerConfig
 276                     ; 101 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 278  0093 a680          	ld	a,#128
 279  0095 cd0000        	call	_CLK_SYSCLKConfig
 281                     ; 104 	status = CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE,
 281                     ; 105                                    DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
 283  0098 4b00          	push	#0
 284  009a 4b00          	push	#0
 285  009c ae00b4        	ldw	x,#180
 286  009f a601          	ld	a,#1
 287  00a1 95            	ld	xh,a
 288  00a2 cd0000        	call	_CLK_ClockSwitchConfig
 290  00a5 85            	popw	x
 291  00a6 6b01          	ld	(OFST+0,sp),a
 292                     ; 108 }
 295  00a8 84            	pop	a
 296  00a9 81            	ret
 323                     ; 115 void GPIO_Config(void)
 323                     ; 116 {
 324                     	switch	.text
 325  00aa               L5_GPIO_Config:
 329                     ; 119 	GPIO_Init( GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST);
 331  00aa 4be0          	push	#224
 332  00ac 4b20          	push	#32
 333  00ae ae500f        	ldw	x,#20495
 334  00b1 cd0000        	call	_GPIO_Init
 336  00b4 85            	popw	x
 337                     ; 122 	GPIO_Init( GPIOD, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
 339  00b5 4be0          	push	#224
 340  00b7 4b04          	push	#4
 341  00b9 ae500f        	ldw	x,#20495
 342  00bc cd0000        	call	_GPIO_Init
 344  00bf 85            	popw	x
 345                     ; 125 	GPIO_Init( GPIOC, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);
 347  00c0 4be0          	push	#224
 348  00c2 4b10          	push	#16
 349  00c4 ae500a        	ldw	x,#20490
 350  00c7 cd0000        	call	_GPIO_Init
 352  00ca 85            	popw	x
 353                     ; 128 	GPIO_Init( GPIOB, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
 355  00cb 4be0          	push	#224
 356  00cd 4b04          	push	#4
 357  00cf ae5005        	ldw	x,#20485
 358  00d2 cd0000        	call	_GPIO_Init
 360  00d5 85            	popw	x
 361                     ; 131 	GPIO_Init( GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
 363  00d6 4be0          	push	#224
 364  00d8 4b08          	push	#8
 365  00da ae500f        	ldw	x,#20495
 366  00dd cd0000        	call	_GPIO_Init
 368  00e0 85            	popw	x
 369                     ; 134 	GPIO_Init( GPIOC, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
 371  00e1 4be0          	push	#224
 372  00e3 4b04          	push	#4
 373  00e5 ae500a        	ldw	x,#20490
 374  00e8 cd0000        	call	_GPIO_Init
 376  00eb 85            	popw	x
 377                     ; 137 	GPIO_Init( GPIOF, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);
 379  00ec 4be0          	push	#224
 380  00ee 4b10          	push	#16
 381  00f0 ae5019        	ldw	x,#20505
 382  00f3 cd0000        	call	_GPIO_Init
 384  00f6 85            	popw	x
 385                     ; 141 	GPIO_Init( GPIOD, GPIO_PIN_6, GPIO_MODE_IN_PU_IT);
 387  00f7 4b60          	push	#96
 388  00f9 4b40          	push	#64
 389  00fb ae500f        	ldw	x,#20495
 390  00fe cd0000        	call	_GPIO_Init
 392  0101 85            	popw	x
 393                     ; 143   disableInterrupts();
 396  0102 9b            sim
 398                     ; 145   EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD, EXTI_SENSITIVITY_FALL_ONLY);
 401  0103 ae0002        	ldw	x,#2
 402  0106 a603          	ld	a,#3
 403  0108 95            	ld	xh,a
 404  0109 cd0000        	call	_EXTI_SetExtIntSensitivity
 406                     ; 146   enableInterrupts();
 409  010c 9a            rim
 411                     ; 156 }
 415  010d 81            	ret
 441                     ; 163 void ADC_Config(void)
 441                     ; 164 {
 442                     	switch	.text
 443  010e               L7_ADC_Config:
 447                     ; 167   CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC,ENABLE);
 449  010e ae0001        	ldw	x,#1
 450  0111 a613          	ld	a,#19
 451  0113 95            	ld	xh,a
 452  0114 cd0000        	call	_CLK_PeripheralClockConfig
 454                     ; 170   ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS,ADC1_CHANNEL_0,ADC1_PRESSEL_FCPU_D2,ADC1_EXTTRIG_TIM,DISABLE,ADC1_ALIGN_RIGHT,ADC1_SCHMITTTRIG_ALL,DISABLE);
 456  0117 4b00          	push	#0
 457  0119 4bff          	push	#255
 458  011b 4b08          	push	#8
 459  011d 4b00          	push	#0
 460  011f 4b00          	push	#0
 461  0121 4b00          	push	#0
 462  0123 5f            	clrw	x
 463  0124 a601          	ld	a,#1
 464  0126 95            	ld	xh,a
 465  0127 cd0000        	call	_ADC1_Init
 467  012a 5b06          	addw	sp,#6
 468                     ; 173   ADC1_Cmd(ENABLE);	
 470  012c a601          	ld	a,#1
 471  012e cd0000        	call	_ADC1_Cmd
 473                     ; 175 }
 476  0131 81            	ret
 504                     ; 182 void PWM_Config(void)
 504                     ; 183 {
 505                     	switch	.text
 506  0132               L11_PWM_Config:
 510                     ; 186   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1,ENABLE);
 512  0132 ae0001        	ldw	x,#1
 513  0135 a607          	ld	a,#7
 514  0137 95            	ld	xh,a
 515  0138 cd0000        	call	_CLK_PeripheralClockConfig
 517                     ; 189   TIM1_TimeBaseInit(7,TIM1_COUNTERMODE_UP,100,0);//10khz
 519  013b 4b00          	push	#0
 520  013d ae0064        	ldw	x,#100
 521  0140 89            	pushw	x
 522  0141 4b00          	push	#0
 523  0143 ae0007        	ldw	x,#7
 524  0146 ad3b          	call	_TIM1_TimeBaseInit
 526  0148 5b04          	addw	sp,#4
 527                     ; 192   TIM1_OC2Init(TIM1_OCMODE_PWM2,TIM1_OUTPUTSTATE_ENABLE,TIM1_OUTPUTNSTATE_DISABLE,0,TIM1_OCPOLARITY_LOW,TIM1_OCPOLARITY_HIGH,TIM1_OCIDLESTATE_RESET,TIM1_OCNIDLESTATE_RESET);
 529  014a 4b00          	push	#0
 530  014c 4b00          	push	#0
 531  014e 4b00          	push	#0
 532  0150 4b22          	push	#34
 533  0152 5f            	clrw	x
 534  0153 89            	pushw	x
 535  0154 4b00          	push	#0
 536  0156 ae0011        	ldw	x,#17
 537  0159 a670          	ld	a,#112
 538  015b 95            	ld	xh,a
 539  015c ad79          	call	_TIM1_OC2Init
 541  015e 5b07          	addw	sp,#7
 542                     ; 195   TIM1_Cmd(ENABLE);
 544  0160 a601          	ld	a,#1
 545  0162 cd0313        	call	_TIM1_Cmd
 547                     ; 198   TIM1_CtrlPWMOutputs(ENABLE);
 549  0165 a601          	ld	a,#1
 550  0167 cd033e        	call	_TIM1_CtrlPWMOutputs
 552                     ; 200 }
 555  016a 81            	ret
 583                     ; 207 void IWDG_Config(void)
 583                     ; 208 {
 584                     	switch	.text
 585  016b               L31_IWDG_Config:
 589                     ; 213   IWDG_Enable(); 
 591  016b cd0000        	call	_IWDG_Enable
 593                     ; 217   IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
 595  016e a655          	ld	a,#85
 596  0170 cd0000        	call	_IWDG_WriteAccessCmd
 598                     ; 220   IWDG_SetPrescaler(IWDG_Prescaler_128);
 600  0173 a605          	ld	a,#5
 601  0175 cd0000        	call	_IWDG_SetPrescaler
 603                     ; 229   IWDG_SetReload((uint8_t)(0xFF));/*510ms*/
 605  0178 a6ff          	ld	a,#255
 606  017a cd0000        	call	_IWDG_SetReload
 608                     ; 232   IWDG_ReloadCounter();
 610  017d cd0000        	call	_IWDG_ReloadCounter
 612                     ; 234 }
 615  0180 81            	ret
 650                     ; 244 void assert_failed(uint8_t* file, uint32_t line)
 650                     ; 245 {
 651                     	switch	.text
 652  0181               _assert_failed:
 656  0181               L161:
 657  0181 20fe          	jra	L161
 767                     ; 265 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 767                     ; 266                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 767                     ; 267                        uint16_t TIM1_Period,
 767                     ; 268                        uint8_t TIM1_RepetitionCounter)
 767                     ; 269 {
 768                     	switch	.text
 769  0183               _TIM1_TimeBaseInit:
 771  0183 89            	pushw	x
 772       00000000      OFST:	set	0
 775                     ; 272     assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 777  0184 0d05          	tnz	(OFST+5,sp)
 778  0186 2718          	jreq	L62
 779  0188 7b05          	ld	a,(OFST+5,sp)
 780  018a a110          	cp	a,#16
 781  018c 2712          	jreq	L62
 782  018e 7b05          	ld	a,(OFST+5,sp)
 783  0190 a120          	cp	a,#32
 784  0192 270c          	jreq	L62
 785  0194 7b05          	ld	a,(OFST+5,sp)
 786  0196 a140          	cp	a,#64
 787  0198 2706          	jreq	L62
 788  019a 7b05          	ld	a,(OFST+5,sp)
 789  019c a160          	cp	a,#96
 790  019e 2603          	jrne	L42
 791  01a0               L62:
 792  01a0 4f            	clr	a
 793  01a1 200f          	jra	L03
 794  01a3               L42:
 795  01a3 ae0110        	ldw	x,#272
 796  01a6 89            	pushw	x
 797  01a7 ae0000        	ldw	x,#0
 798  01aa 89            	pushw	x
 799  01ab ae000c        	ldw	x,#L532
 800  01ae add1          	call	_assert_failed
 802  01b0 5b04          	addw	sp,#4
 803  01b2               L03:
 804                     ; 275     TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 806  01b2 7b06          	ld	a,(OFST+6,sp)
 807  01b4 c75262        	ld	21090,a
 808                     ; 276     TIM1->ARRL = (uint8_t)(TIM1_Period);
 810  01b7 7b07          	ld	a,(OFST+7,sp)
 811  01b9 c75263        	ld	21091,a
 812                     ; 279     TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 814  01bc 7b01          	ld	a,(OFST+1,sp)
 815  01be c75260        	ld	21088,a
 816                     ; 280     TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 818  01c1 7b02          	ld	a,(OFST+2,sp)
 819  01c3 c75261        	ld	21089,a
 820                     ; 283     TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 820                     ; 284                            | (uint8_t)(TIM1_CounterMode));
 822  01c6 c65250        	ld	a,21072
 823  01c9 a48f          	and	a,#143
 824  01cb 1a05          	or	a,(OFST+5,sp)
 825  01cd c75250        	ld	21072,a
 826                     ; 287     TIM1->RCR = TIM1_RepetitionCounter;
 828  01d0 7b08          	ld	a,(OFST+8,sp)
 829  01d2 c75264        	ld	21092,a
 830                     ; 289 }
 833  01d5 85            	popw	x
 834  01d6 81            	ret
1120                     ; 310 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1120                     ; 311                   TIM1_OutputState_TypeDef TIM1_OutputState,
1120                     ; 312                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1120                     ; 313                   uint16_t TIM1_Pulse,
1120                     ; 314                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1120                     ; 315                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1120                     ; 316                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1120                     ; 317                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1120                     ; 318 {
1121                     	switch	.text
1122  01d7               _TIM1_OC2Init:
1124  01d7 89            	pushw	x
1125  01d8 5203          	subw	sp,#3
1126       00000003      OFST:	set	3
1129                     ; 320     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1131  01da 9e            	ld	a,xh
1132  01db 4d            	tnz	a
1133  01dc 2719          	jreq	L63
1134  01de 9e            	ld	a,xh
1135  01df a110          	cp	a,#16
1136  01e1 2714          	jreq	L63
1137  01e3 9e            	ld	a,xh
1138  01e4 a120          	cp	a,#32
1139  01e6 270f          	jreq	L63
1140  01e8 9e            	ld	a,xh
1141  01e9 a130          	cp	a,#48
1142  01eb 270a          	jreq	L63
1143  01ed 9e            	ld	a,xh
1144  01ee a160          	cp	a,#96
1145  01f0 2705          	jreq	L63
1146  01f2 9e            	ld	a,xh
1147  01f3 a170          	cp	a,#112
1148  01f5 2603          	jrne	L43
1149  01f7               L63:
1150  01f7 4f            	clr	a
1151  01f8 2010          	jra	L04
1152  01fa               L43:
1153  01fa ae0140        	ldw	x,#320
1154  01fd 89            	pushw	x
1155  01fe ae0000        	ldw	x,#0
1156  0201 89            	pushw	x
1157  0202 ae000c        	ldw	x,#L532
1158  0205 cd0181        	call	_assert_failed
1160  0208 5b04          	addw	sp,#4
1161  020a               L04:
1162                     ; 321     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1164  020a 0d05          	tnz	(OFST+2,sp)
1165  020c 2706          	jreq	L44
1166  020e 7b05          	ld	a,(OFST+2,sp)
1167  0210 a111          	cp	a,#17
1168  0212 2603          	jrne	L24
1169  0214               L44:
1170  0214 4f            	clr	a
1171  0215 2010          	jra	L64
1172  0217               L24:
1173  0217 ae0141        	ldw	x,#321
1174  021a 89            	pushw	x
1175  021b ae0000        	ldw	x,#0
1176  021e 89            	pushw	x
1177  021f ae000c        	ldw	x,#L532
1178  0222 cd0181        	call	_assert_failed
1180  0225 5b04          	addw	sp,#4
1181  0227               L64:
1182                     ; 322     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
1184  0227 0d08          	tnz	(OFST+5,sp)
1185  0229 2706          	jreq	L25
1186  022b 7b08          	ld	a,(OFST+5,sp)
1187  022d a144          	cp	a,#68
1188  022f 2603          	jrne	L05
1189  0231               L25:
1190  0231 4f            	clr	a
1191  0232 2010          	jra	L45
1192  0234               L05:
1193  0234 ae0142        	ldw	x,#322
1194  0237 89            	pushw	x
1195  0238 ae0000        	ldw	x,#0
1196  023b 89            	pushw	x
1197  023c ae000c        	ldw	x,#L532
1198  023f cd0181        	call	_assert_failed
1200  0242 5b04          	addw	sp,#4
1201  0244               L45:
1202                     ; 323     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1204  0244 0d0b          	tnz	(OFST+8,sp)
1205  0246 2706          	jreq	L06
1206  0248 7b0b          	ld	a,(OFST+8,sp)
1207  024a a122          	cp	a,#34
1208  024c 2603          	jrne	L65
1209  024e               L06:
1210  024e 4f            	clr	a
1211  024f 2010          	jra	L26
1212  0251               L65:
1213  0251 ae0143        	ldw	x,#323
1214  0254 89            	pushw	x
1215  0255 ae0000        	ldw	x,#0
1216  0258 89            	pushw	x
1217  0259 ae000c        	ldw	x,#L532
1218  025c cd0181        	call	_assert_failed
1220  025f 5b04          	addw	sp,#4
1221  0261               L26:
1222                     ; 324     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
1224  0261 0d0c          	tnz	(OFST+9,sp)
1225  0263 2706          	jreq	L66
1226  0265 7b0c          	ld	a,(OFST+9,sp)
1227  0267 a188          	cp	a,#136
1228  0269 2603          	jrne	L46
1229  026b               L66:
1230  026b 4f            	clr	a
1231  026c 2010          	jra	L07
1232  026e               L46:
1233  026e ae0144        	ldw	x,#324
1234  0271 89            	pushw	x
1235  0272 ae0000        	ldw	x,#0
1236  0275 89            	pushw	x
1237  0276 ae000c        	ldw	x,#L532
1238  0279 cd0181        	call	_assert_failed
1240  027c 5b04          	addw	sp,#4
1241  027e               L07:
1242                     ; 325     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1244  027e 7b0d          	ld	a,(OFST+10,sp)
1245  0280 a155          	cp	a,#85
1246  0282 2704          	jreq	L47
1247  0284 0d0d          	tnz	(OFST+10,sp)
1248  0286 2603          	jrne	L27
1249  0288               L47:
1250  0288 4f            	clr	a
1251  0289 2010          	jra	L67
1252  028b               L27:
1253  028b ae0145        	ldw	x,#325
1254  028e 89            	pushw	x
1255  028f ae0000        	ldw	x,#0
1256  0292 89            	pushw	x
1257  0293 ae000c        	ldw	x,#L532
1258  0296 cd0181        	call	_assert_failed
1260  0299 5b04          	addw	sp,#4
1261  029b               L67:
1262                     ; 326     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
1264  029b 7b0e          	ld	a,(OFST+11,sp)
1265  029d a12a          	cp	a,#42
1266  029f 2704          	jreq	L201
1267  02a1 0d0e          	tnz	(OFST+11,sp)
1268  02a3 2603          	jrne	L001
1269  02a5               L201:
1270  02a5 4f            	clr	a
1271  02a6 2010          	jra	L401
1272  02a8               L001:
1273  02a8 ae0146        	ldw	x,#326
1274  02ab 89            	pushw	x
1275  02ac ae0000        	ldw	x,#0
1276  02af 89            	pushw	x
1277  02b0 ae000c        	ldw	x,#L532
1278  02b3 cd0181        	call	_assert_failed
1280  02b6 5b04          	addw	sp,#4
1281  02b8               L401:
1282                     ; 330     TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
1282                     ; 331                                 TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
1284  02b8 c6525c        	ld	a,21084
1285  02bb a40f          	and	a,#15
1286  02bd c7525c        	ld	21084,a
1287                     ; 335     TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
1287                     ; 336                              (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
1287                     ; 337                              (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
1287                     ; 338                              (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
1289  02c0 7b0c          	ld	a,(OFST+9,sp)
1290  02c2 a480          	and	a,#128
1291  02c4 6b03          	ld	(OFST+0,sp),a
1292  02c6 7b0b          	ld	a,(OFST+8,sp)
1293  02c8 a420          	and	a,#32
1294  02ca 1a03          	or	a,(OFST+0,sp)
1295  02cc 6b02          	ld	(OFST-1,sp),a
1296  02ce 7b08          	ld	a,(OFST+5,sp)
1297  02d0 a440          	and	a,#64
1298  02d2 6b01          	ld	(OFST-2,sp),a
1299  02d4 7b05          	ld	a,(OFST+2,sp)
1300  02d6 a410          	and	a,#16
1301  02d8 1a01          	or	a,(OFST-2,sp)
1302  02da 1a02          	or	a,(OFST-1,sp)
1303  02dc ca525c        	or	a,21084
1304  02df c7525c        	ld	21084,a
1305                     ; 341     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1305                     ; 342                              (uint8_t)TIM1_OCMode);
1307  02e2 c65259        	ld	a,21081
1308  02e5 a48f          	and	a,#143
1309  02e7 1a04          	or	a,(OFST+1,sp)
1310  02e9 c75259        	ld	21081,a
1311                     ; 345     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
1313  02ec c6526f        	ld	a,21103
1314  02ef a4f3          	and	a,#243
1315  02f1 c7526f        	ld	21103,a
1316                     ; 347     TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
1316                     ; 348                             (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
1318  02f4 7b0e          	ld	a,(OFST+11,sp)
1319  02f6 a408          	and	a,#8
1320  02f8 6b03          	ld	(OFST+0,sp),a
1321  02fa 7b0d          	ld	a,(OFST+10,sp)
1322  02fc a404          	and	a,#4
1323  02fe 1a03          	or	a,(OFST+0,sp)
1324  0300 ca526f        	or	a,21103
1325  0303 c7526f        	ld	21103,a
1326                     ; 351     TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
1328  0306 7b09          	ld	a,(OFST+6,sp)
1329  0308 c75267        	ld	21095,a
1330                     ; 352     TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
1332  030b 7b0a          	ld	a,(OFST+7,sp)
1333  030d c75268        	ld	21096,a
1334                     ; 354 }
1337  0310 5b05          	addw	sp,#5
1338  0312 81            	ret
1394                     ; 362 void TIM1_Cmd(FunctionalState NewState)
1394                     ; 363 {
1395                     	switch	.text
1396  0313               _TIM1_Cmd:
1398  0313 88            	push	a
1399       00000000      OFST:	set	0
1402                     ; 365     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1404  0314 4d            	tnz	a
1405  0315 2704          	jreq	L211
1406  0317 a101          	cp	a,#1
1407  0319 2603          	jrne	L011
1408  031b               L211:
1409  031b 4f            	clr	a
1410  031c 2010          	jra	L411
1411  031e               L011:
1412  031e ae016d        	ldw	x,#365
1413  0321 89            	pushw	x
1414  0322 ae0000        	ldw	x,#0
1415  0325 89            	pushw	x
1416  0326 ae000c        	ldw	x,#L532
1417  0329 cd0181        	call	_assert_failed
1419  032c 5b04          	addw	sp,#4
1420  032e               L411:
1421                     ; 368     if (NewState != DISABLE)
1423  032e 0d01          	tnz	(OFST+1,sp)
1424  0330 2706          	jreq	L734
1425                     ; 370         TIM1->CR1 |= TIM1_CR1_CEN;
1427  0332 72105250      	bset	21072,#0
1429  0336 2004          	jra	L144
1430  0338               L734:
1431                     ; 374         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
1433  0338 72115250      	bres	21072,#0
1434  033c               L144:
1435                     ; 376 }
1438  033c 84            	pop	a
1439  033d 81            	ret
1476                     ; 384 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
1476                     ; 385 {
1477                     	switch	.text
1478  033e               _TIM1_CtrlPWMOutputs:
1480  033e 88            	push	a
1481       00000000      OFST:	set	0
1484                     ; 387     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1486  033f 4d            	tnz	a
1487  0340 2704          	jreq	L221
1488  0342 a101          	cp	a,#1
1489  0344 2603          	jrne	L021
1490  0346               L221:
1491  0346 4f            	clr	a
1492  0347 2010          	jra	L421
1493  0349               L021:
1494  0349 ae0183        	ldw	x,#387
1495  034c 89            	pushw	x
1496  034d ae0000        	ldw	x,#0
1497  0350 89            	pushw	x
1498  0351 ae000c        	ldw	x,#L532
1499  0354 cd0181        	call	_assert_failed
1501  0357 5b04          	addw	sp,#4
1502  0359               L421:
1503                     ; 391     if (NewState != DISABLE)
1505  0359 0d01          	tnz	(OFST+1,sp)
1506  035b 2706          	jreq	L164
1507                     ; 393         TIM1->BKR |= TIM1_BKR_MOE;
1509  035d 721e526d      	bset	21101,#7
1511  0361 2004          	jra	L364
1512  0363               L164:
1513                     ; 397         TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
1515  0363 721f526d      	bres	21101,#7
1516  0367               L364:
1517                     ; 399 }
1520  0367 84            	pop	a
1521  0368 81            	ret
1555                     ; 407 void TIM1_SetCompare2(uint16_t Compare2)
1555                     ; 408 {
1556                     	switch	.text
1557  0369               _TIM1_SetCompare2:
1561                     ; 410     TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
1563  0369 9e            	ld	a,xh
1564  036a c75267        	ld	21095,a
1565                     ; 411     TIM1->CCR2L = (uint8_t)(Compare2);
1567  036d 9f            	ld	a,xl
1568  036e c75268        	ld	21096,a
1569                     ; 413 }
1572  0371 81            	ret
1752                     .const:	section	.text
1753  0000               L661:
1754  0000 00061a81      	dc.l	400001
1755  0004               L271:
1756  0004 000186a1      	dc.l	100001
1757  0008               L471:
1758  0008 000f4240      	dc.l	1000000
1759                     ; 432 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
1759                     ; 433               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
1759                     ; 434               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
1759                     ; 435 {
1760                     	switch	.text
1761  0372               _I2C_Init:
1763  0372 5209          	subw	sp,#9
1764       00000009      OFST:	set	9
1767                     ; 436   uint16_t result = 0x0004;
1769  0374 1e08          	ldw	x,(OFST-1,sp)
1770                     ; 437   uint16_t tmpval = 0;
1772  0376 1e05          	ldw	x,(OFST-4,sp)
1773                     ; 438   uint8_t tmpccrh = 0;
1775  0378 0f07          	clr	(OFST-2,sp)
1776                     ; 441   assert_param(IS_I2C_ACK_OK(Ack));
1778  037a 0d13          	tnz	(OFST+10,sp)
1779  037c 270c          	jreq	L431
1780  037e 7b13          	ld	a,(OFST+10,sp)
1781  0380 a101          	cp	a,#1
1782  0382 2706          	jreq	L431
1783  0384 7b13          	ld	a,(OFST+10,sp)
1784  0386 a102          	cp	a,#2
1785  0388 2603          	jrne	L231
1786  038a               L431:
1787  038a 4f            	clr	a
1788  038b 2010          	jra	L631
1789  038d               L231:
1790  038d ae01b9        	ldw	x,#441
1791  0390 89            	pushw	x
1792  0391 ae0000        	ldw	x,#0
1793  0394 89            	pushw	x
1794  0395 ae000c        	ldw	x,#L532
1795  0398 cd0181        	call	_assert_failed
1797  039b 5b04          	addw	sp,#4
1798  039d               L631:
1799                     ; 442   assert_param(IS_I2C_ADDMODE_OK(AddMode));
1801  039d 0d14          	tnz	(OFST+11,sp)
1802  039f 2706          	jreq	L241
1803  03a1 7b14          	ld	a,(OFST+11,sp)
1804  03a3 a180          	cp	a,#128
1805  03a5 2603          	jrne	L041
1806  03a7               L241:
1807  03a7 4f            	clr	a
1808  03a8 2010          	jra	L441
1809  03aa               L041:
1810  03aa ae01ba        	ldw	x,#442
1811  03ad 89            	pushw	x
1812  03ae ae0000        	ldw	x,#0
1813  03b1 89            	pushw	x
1814  03b2 ae000c        	ldw	x,#L532
1815  03b5 cd0181        	call	_assert_failed
1817  03b8 5b04          	addw	sp,#4
1818  03ba               L441:
1819                     ; 443   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
1821  03ba 1e10          	ldw	x,(OFST+7,sp)
1822  03bc a30400        	cpw	x,#1024
1823  03bf 2403          	jruge	L641
1824  03c1 4f            	clr	a
1825  03c2 2010          	jra	L051
1826  03c4               L641:
1827  03c4 ae01bb        	ldw	x,#443
1828  03c7 89            	pushw	x
1829  03c8 ae0000        	ldw	x,#0
1830  03cb 89            	pushw	x
1831  03cc ae000c        	ldw	x,#L532
1832  03cf cd0181        	call	_assert_failed
1834  03d2 5b04          	addw	sp,#4
1835  03d4               L051:
1836                     ; 444   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
1838  03d4 0d12          	tnz	(OFST+9,sp)
1839  03d6 2706          	jreq	L451
1840  03d8 7b12          	ld	a,(OFST+9,sp)
1841  03da a140          	cp	a,#64
1842  03dc 2603          	jrne	L251
1843  03de               L451:
1844  03de 4f            	clr	a
1845  03df 2010          	jra	L651
1846  03e1               L251:
1847  03e1 ae01bc        	ldw	x,#444
1848  03e4 89            	pushw	x
1849  03e5 ae0000        	ldw	x,#0
1850  03e8 89            	pushw	x
1851  03e9 ae000c        	ldw	x,#L532
1852  03ec cd0181        	call	_assert_failed
1854  03ef 5b04          	addw	sp,#4
1855  03f1               L651:
1856                     ; 445   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
1858  03f1 0d15          	tnz	(OFST+12,sp)
1859  03f3 2709          	jreq	L061
1860  03f5 7b15          	ld	a,(OFST+12,sp)
1861  03f7 a111          	cp	a,#17
1862  03f9 2403          	jruge	L061
1863  03fb 4f            	clr	a
1864  03fc 2010          	jra	L261
1865  03fe               L061:
1866  03fe ae01bd        	ldw	x,#445
1867  0401 89            	pushw	x
1868  0402 ae0000        	ldw	x,#0
1869  0405 89            	pushw	x
1870  0406 ae000c        	ldw	x,#L532
1871  0409 cd0181        	call	_assert_failed
1873  040c 5b04          	addw	sp,#4
1874  040e               L261:
1875                     ; 446   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
1877  040e 96            	ldw	x,sp
1878  040f 1c000c        	addw	x,#OFST+3
1879  0412 cd0000        	call	c_lzmp
1881  0415 2712          	jreq	L461
1882  0417 96            	ldw	x,sp
1883  0418 1c000c        	addw	x,#OFST+3
1884  041b cd0000        	call	c_ltor
1886  041e ae0000        	ldw	x,#L661
1887  0421 cd0000        	call	c_lcmp
1889  0424 2403          	jruge	L461
1890  0426 4f            	clr	a
1891  0427 2010          	jra	L071
1892  0429               L461:
1893  0429 ae01be        	ldw	x,#446
1894  042c 89            	pushw	x
1895  042d ae0000        	ldw	x,#0
1896  0430 89            	pushw	x
1897  0431 ae000c        	ldw	x,#L532
1898  0434 cd0181        	call	_assert_failed
1900  0437 5b04          	addw	sp,#4
1901  0439               L071:
1902                     ; 451   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
1904  0439 c65212        	ld	a,21010
1905  043c a4c0          	and	a,#192
1906  043e c75212        	ld	21010,a
1907                     ; 453   I2C->FREQR |= InputClockFrequencyMHz;
1909  0441 c65212        	ld	a,21010
1910  0444 1a15          	or	a,(OFST+12,sp)
1911  0446 c75212        	ld	21010,a
1912                     ; 457   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
1914  0449 72115210      	bres	21008,#0
1915                     ; 460   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
1917  044d c6521c        	ld	a,21020
1918  0450 a430          	and	a,#48
1919  0452 c7521c        	ld	21020,a
1920                     ; 461   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
1922  0455 725f521b      	clr	21019
1923                     ; 464   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
1925  0459 96            	ldw	x,sp
1926  045a 1c000c        	addw	x,#OFST+3
1927  045d cd0000        	call	c_ltor
1929  0460 ae0004        	ldw	x,#L271
1930  0463 cd0000        	call	c_lcmp
1932  0466 2403          	jruge	L002
1933  0468 cc04f5        	jp	L316
1934  046b               L002:
1935                     ; 467     tmpccrh = I2C_CCRH_FS;
1937  046b a680          	ld	a,#128
1938  046d 6b07          	ld	(OFST-2,sp),a
1939                     ; 469     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
1941  046f 0d12          	tnz	(OFST+9,sp)
1942  0471 2630          	jrne	L516
1943                     ; 472       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
1945  0473 96            	ldw	x,sp
1946  0474 1c000c        	addw	x,#OFST+3
1947  0477 cd0000        	call	c_ltor
1949  047a a603          	ld	a,#3
1950  047c cd0000        	call	c_smul
1952  047f 96            	ldw	x,sp
1953  0480 1c0001        	addw	x,#OFST-8
1954  0483 cd0000        	call	c_rtol
1956  0486 7b15          	ld	a,(OFST+12,sp)
1957  0488 b703          	ld	c_lreg+3,a
1958  048a 3f02          	clr	c_lreg+2
1959  048c 3f01          	clr	c_lreg+1
1960  048e 3f00          	clr	c_lreg
1961  0490 ae0008        	ldw	x,#L471
1962  0493 cd0000        	call	c_lmul
1964  0496 96            	ldw	x,sp
1965  0497 1c0001        	addw	x,#OFST-8
1966  049a cd0000        	call	c_ludv
1968  049d be02          	ldw	x,c_lreg+2
1969  049f 1f08          	ldw	(OFST-1,sp),x
1971  04a1 2034          	jra	L716
1972  04a3               L516:
1973                     ; 477       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
1975  04a3 96            	ldw	x,sp
1976  04a4 1c000c        	addw	x,#OFST+3
1977  04a7 cd0000        	call	c_ltor
1979  04aa a619          	ld	a,#25
1980  04ac cd0000        	call	c_smul
1982  04af 96            	ldw	x,sp
1983  04b0 1c0001        	addw	x,#OFST-8
1984  04b3 cd0000        	call	c_rtol
1986  04b6 7b15          	ld	a,(OFST+12,sp)
1987  04b8 b703          	ld	c_lreg+3,a
1988  04ba 3f02          	clr	c_lreg+2
1989  04bc 3f01          	clr	c_lreg+1
1990  04be 3f00          	clr	c_lreg
1991  04c0 ae0008        	ldw	x,#L471
1992  04c3 cd0000        	call	c_lmul
1994  04c6 96            	ldw	x,sp
1995  04c7 1c0001        	addw	x,#OFST-8
1996  04ca cd0000        	call	c_ludv
1998  04cd be02          	ldw	x,c_lreg+2
1999  04cf 1f08          	ldw	(OFST-1,sp),x
2000                     ; 479       tmpccrh |= I2C_CCRH_DUTY;
2002  04d1 7b07          	ld	a,(OFST-2,sp)
2003  04d3 aa40          	or	a,#64
2004  04d5 6b07          	ld	(OFST-2,sp),a
2005  04d7               L716:
2006                     ; 483     if (result < (uint16_t)0x01)
2008  04d7 1e08          	ldw	x,(OFST-1,sp)
2009  04d9 2605          	jrne	L126
2010                     ; 486       result = (uint16_t)0x0001;
2012  04db ae0001        	ldw	x,#1
2013  04de 1f08          	ldw	(OFST-1,sp),x
2014  04e0               L126:
2015                     ; 492     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
2017  04e0 7b15          	ld	a,(OFST+12,sp)
2018  04e2 97            	ld	xl,a
2019  04e3 a603          	ld	a,#3
2020  04e5 42            	mul	x,a
2021  04e6 a60a          	ld	a,#10
2022  04e8 cd0000        	call	c_sdivx
2024  04eb 5c            	incw	x
2025  04ec 1f05          	ldw	(OFST-4,sp),x
2026                     ; 493     I2C->TRISER = (uint8_t)tmpval;
2028  04ee 7b06          	ld	a,(OFST-3,sp)
2029  04f0 c7521d        	ld	21021,a
2031  04f3 2043          	jra	L326
2032  04f5               L316:
2033                     ; 500     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
2035  04f5 96            	ldw	x,sp
2036  04f6 1c000c        	addw	x,#OFST+3
2037  04f9 cd0000        	call	c_ltor
2039  04fc 3803          	sll	c_lreg+3
2040  04fe 3902          	rlc	c_lreg+2
2041  0500 3901          	rlc	c_lreg+1
2042  0502 3900          	rlc	c_lreg
2043  0504 96            	ldw	x,sp
2044  0505 1c0001        	addw	x,#OFST-8
2045  0508 cd0000        	call	c_rtol
2047  050b 7b15          	ld	a,(OFST+12,sp)
2048  050d b703          	ld	c_lreg+3,a
2049  050f 3f02          	clr	c_lreg+2
2050  0511 3f01          	clr	c_lreg+1
2051  0513 3f00          	clr	c_lreg
2052  0515 ae0008        	ldw	x,#L471
2053  0518 cd0000        	call	c_lmul
2055  051b 96            	ldw	x,sp
2056  051c 1c0001        	addw	x,#OFST-8
2057  051f cd0000        	call	c_ludv
2059  0522 be02          	ldw	x,c_lreg+2
2060  0524 1f08          	ldw	(OFST-1,sp),x
2061                     ; 503     if (result < (uint16_t)0x0004)
2063  0526 1e08          	ldw	x,(OFST-1,sp)
2064  0528 a30004        	cpw	x,#4
2065  052b 2405          	jruge	L526
2066                     ; 506       result = (uint16_t)0x0004;
2068  052d ae0004        	ldw	x,#4
2069  0530 1f08          	ldw	(OFST-1,sp),x
2070  0532               L526:
2071                     ; 512     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
2073  0532 7b15          	ld	a,(OFST+12,sp)
2074  0534 4c            	inc	a
2075  0535 c7521d        	ld	21021,a
2076  0538               L326:
2077                     ; 517   I2C->CCRL = (uint8_t)result;
2079  0538 7b09          	ld	a,(OFST+0,sp)
2080  053a c7521b        	ld	21019,a
2081                     ; 518   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
2083  053d 7b08          	ld	a,(OFST-1,sp)
2084  053f a40f          	and	a,#15
2085  0541 1a07          	or	a,(OFST-2,sp)
2086  0543 c7521c        	ld	21020,a
2087                     ; 521   I2C->CR1 |= I2C_CR1_PE;
2089  0546 72105210      	bset	21008,#0
2090                     ; 524   I2C_AcknowledgeConfig(Ack);
2092  054a 7b13          	ld	a,(OFST+10,sp)
2093  054c cd05f5        	call	_I2C_AcknowledgeConfig
2095                     ; 527   I2C->OARL = (uint8_t)(OwnAddress);
2097  054f 7b11          	ld	a,(OFST+8,sp)
2098  0551 c75213        	ld	21011,a
2099                     ; 528   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
2099                     ; 529                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
2101  0554 7b10          	ld	a,(OFST+7,sp)
2102  0556 97            	ld	xl,a
2103  0557 7b11          	ld	a,(OFST+8,sp)
2104  0559 9f            	ld	a,xl
2105  055a a403          	and	a,#3
2106  055c 97            	ld	xl,a
2107  055d 4f            	clr	a
2108  055e 02            	rlwa	x,a
2109  055f a607          	ld	a,#7
2110  0561               L671:
2111  0561 54            	srlw	x
2112  0562 4a            	dec	a
2113  0563 26fc          	jrne	L671
2114  0565 9f            	ld	a,xl
2115  0566 6b04          	ld	(OFST-5,sp),a
2116  0568 7b14          	ld	a,(OFST+11,sp)
2117  056a aa40          	or	a,#64
2118  056c 1a04          	or	a,(OFST-5,sp)
2119  056e c75214        	ld	21012,a
2120                     ; 530 }
2123  0571 5b09          	addw	sp,#9
2124  0573 81            	ret
2160                     ; 538 void I2C_Cmd(FunctionalState NewState)
2160                     ; 539 {
2161                     	switch	.text
2162  0574               _I2C_Cmd:
2164  0574 88            	push	a
2165       00000000      OFST:	set	0
2168                     ; 542   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2170  0575 4d            	tnz	a
2171  0576 2704          	jreq	L602
2172  0578 a101          	cp	a,#1
2173  057a 2603          	jrne	L402
2174  057c               L602:
2175  057c 4f            	clr	a
2176  057d 2010          	jra	L012
2177  057f               L402:
2178  057f ae021e        	ldw	x,#542
2179  0582 89            	pushw	x
2180  0583 ae0000        	ldw	x,#0
2181  0586 89            	pushw	x
2182  0587 ae000c        	ldw	x,#L532
2183  058a cd0181        	call	_assert_failed
2185  058d 5b04          	addw	sp,#4
2186  058f               L012:
2187                     ; 544   if (NewState != DISABLE)
2189  058f 0d01          	tnz	(OFST+1,sp)
2190  0591 2706          	jreq	L546
2191                     ; 547     I2C->CR1 |= I2C_CR1_PE;
2193  0593 72105210      	bset	21008,#0
2195  0597 2004          	jra	L746
2196  0599               L546:
2197                     ; 552     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
2199  0599 72115210      	bres	21008,#0
2200  059d               L746:
2201                     ; 554 }
2204  059d 84            	pop	a
2205  059e 81            	ret
2241                     ; 565 void I2C_GenerateSTART(FunctionalState NewState)
2241                     ; 566 {
2242                     	switch	.text
2243  059f               _I2C_GenerateSTART:
2245  059f 88            	push	a
2246       00000000      OFST:	set	0
2249                     ; 569   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2251  05a0 4d            	tnz	a
2252  05a1 2704          	jreq	L612
2253  05a3 a101          	cp	a,#1
2254  05a5 2603          	jrne	L412
2255  05a7               L612:
2256  05a7 4f            	clr	a
2257  05a8 2010          	jra	L022
2258  05aa               L412:
2259  05aa ae0239        	ldw	x,#569
2260  05ad 89            	pushw	x
2261  05ae ae0000        	ldw	x,#0
2262  05b1 89            	pushw	x
2263  05b2 ae000c        	ldw	x,#L532
2264  05b5 cd0181        	call	_assert_failed
2266  05b8 5b04          	addw	sp,#4
2267  05ba               L022:
2268                     ; 571   if (NewState != DISABLE)
2270  05ba 0d01          	tnz	(OFST+1,sp)
2271  05bc 2706          	jreq	L766
2272                     ; 574     I2C->CR2 |= I2C_CR2_START;
2274  05be 72105211      	bset	21009,#0
2276  05c2 2004          	jra	L176
2277  05c4               L766:
2278                     ; 579     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
2280  05c4 72115211      	bres	21009,#0
2281  05c8               L176:
2282                     ; 581 }
2285  05c8 84            	pop	a
2286  05c9 81            	ret
2322                     ; 589 void I2C_GenerateSTOP(FunctionalState NewState)
2322                     ; 590 {
2323                     	switch	.text
2324  05ca               _I2C_GenerateSTOP:
2326  05ca 88            	push	a
2327       00000000      OFST:	set	0
2330                     ; 593   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2332  05cb 4d            	tnz	a
2333  05cc 2704          	jreq	L622
2334  05ce a101          	cp	a,#1
2335  05d0 2603          	jrne	L422
2336  05d2               L622:
2337  05d2 4f            	clr	a
2338  05d3 2010          	jra	L032
2339  05d5               L422:
2340  05d5 ae0251        	ldw	x,#593
2341  05d8 89            	pushw	x
2342  05d9 ae0000        	ldw	x,#0
2343  05dc 89            	pushw	x
2344  05dd ae000c        	ldw	x,#L532
2345  05e0 cd0181        	call	_assert_failed
2347  05e3 5b04          	addw	sp,#4
2348  05e5               L032:
2349                     ; 595   if (NewState != DISABLE)
2351  05e5 0d01          	tnz	(OFST+1,sp)
2352  05e7 2706          	jreq	L117
2353                     ; 598     I2C->CR2 |= I2C_CR2_STOP;
2355  05e9 72125211      	bset	21009,#1
2357  05ed 2004          	jra	L317
2358  05ef               L117:
2359                     ; 603     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
2361  05ef 72135211      	bres	21009,#1
2362  05f3               L317:
2363                     ; 605 }
2366  05f3 84            	pop	a
2367  05f4 81            	ret
2404                     ; 615 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
2404                     ; 616 {
2405                     	switch	.text
2406  05f5               _I2C_AcknowledgeConfig:
2408  05f5 88            	push	a
2409       00000000      OFST:	set	0
2412                     ; 619   assert_param(IS_I2C_ACK_OK(Ack));
2414  05f6 4d            	tnz	a
2415  05f7 2708          	jreq	L632
2416  05f9 a101          	cp	a,#1
2417  05fb 2704          	jreq	L632
2418  05fd a102          	cp	a,#2
2419  05ff 2603          	jrne	L432
2420  0601               L632:
2421  0601 4f            	clr	a
2422  0602 2010          	jra	L042
2423  0604               L432:
2424  0604 ae026b        	ldw	x,#619
2425  0607 89            	pushw	x
2426  0608 ae0000        	ldw	x,#0
2427  060b 89            	pushw	x
2428  060c ae000c        	ldw	x,#L532
2429  060f cd0181        	call	_assert_failed
2431  0612 5b04          	addw	sp,#4
2432  0614               L042:
2433                     ; 621   if (Ack == I2C_ACK_NONE)
2435  0614 0d01          	tnz	(OFST+1,sp)
2436  0616 2606          	jrne	L337
2437                     ; 624     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
2439  0618 72155211      	bres	21009,#2
2441  061c 2014          	jra	L537
2442  061e               L337:
2443                     ; 629     I2C->CR2 |= I2C_CR2_ACK;
2445  061e 72145211      	bset	21009,#2
2446                     ; 631     if (Ack == I2C_ACK_CURR)
2448  0622 7b01          	ld	a,(OFST+1,sp)
2449  0624 a101          	cp	a,#1
2450  0626 2606          	jrne	L737
2451                     ; 634       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
2453  0628 72175211      	bres	21009,#3
2455  062c 2004          	jra	L537
2456  062e               L737:
2457                     ; 639       I2C->CR2 |= I2C_CR2_POS;
2459  062e 72165211      	bset	21009,#3
2460  0632               L537:
2461                     ; 642 }
2464  0632 84            	pop	a
2465  0633 81            	ret
2502                     ; 651 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
2502                     ; 652 {
2503                     	switch	.text
2504  0634               _I2C_FastModeDutyCycleConfig:
2506  0634 88            	push	a
2507       00000000      OFST:	set	0
2510                     ; 655   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
2512  0635 4d            	tnz	a
2513  0636 2704          	jreq	L642
2514  0638 a140          	cp	a,#64
2515  063a 2603          	jrne	L442
2516  063c               L642:
2517  063c 4f            	clr	a
2518  063d 2010          	jra	L052
2519  063f               L442:
2520  063f ae028f        	ldw	x,#655
2521  0642 89            	pushw	x
2522  0643 ae0000        	ldw	x,#0
2523  0646 89            	pushw	x
2524  0647 ae000c        	ldw	x,#L532
2525  064a cd0181        	call	_assert_failed
2527  064d 5b04          	addw	sp,#4
2528  064f               L052:
2529                     ; 657   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
2531  064f 7b01          	ld	a,(OFST+1,sp)
2532  0651 a140          	cp	a,#64
2533  0653 2606          	jrne	L167
2534                     ; 660     I2C->CCRH |= I2C_CCRH_DUTY;
2536  0655 721c521c      	bset	21020,#6
2538  0659 2004          	jra	L367
2539  065b               L167:
2540                     ; 665     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
2542  065b 721d521c      	bres	21020,#6
2543  065f               L367:
2544                     ; 667 }
2547  065f 84            	pop	a
2548  0660 81            	ret
2571                     ; 674 uint8_t I2C_ReceiveData(void)
2571                     ; 675 {
2572                     	switch	.text
2573  0661               _I2C_ReceiveData:
2577                     ; 677   return ((uint8_t)I2C->DR);
2579  0661 c65216        	ld	a,21014
2582  0664 81            	ret
2648                     ; 687 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
2648                     ; 688 {
2649                     	switch	.text
2650  0665               _I2C_Send7bitAddress:
2652  0665 89            	pushw	x
2653       00000000      OFST:	set	0
2656                     ; 690   assert_param(IS_I2C_ADDRESS_OK(Address));
2658  0666 9e            	ld	a,xh
2659  0667 a501          	bcp	a,#1
2660  0669 2603          	jrne	L652
2661  066b 4f            	clr	a
2662  066c 2010          	jra	L062
2663  066e               L652:
2664  066e ae02b2        	ldw	x,#690
2665  0671 89            	pushw	x
2666  0672 ae0000        	ldw	x,#0
2667  0675 89            	pushw	x
2668  0676 ae000c        	ldw	x,#L532
2669  0679 cd0181        	call	_assert_failed
2671  067c 5b04          	addw	sp,#4
2672  067e               L062:
2673                     ; 691   assert_param(IS_I2C_DIRECTION_OK(Direction));
2675  067e 0d02          	tnz	(OFST+2,sp)
2676  0680 2706          	jreq	L462
2677  0682 7b02          	ld	a,(OFST+2,sp)
2678  0684 a101          	cp	a,#1
2679  0686 2603          	jrne	L262
2680  0688               L462:
2681  0688 4f            	clr	a
2682  0689 2010          	jra	L662
2683  068b               L262:
2684  068b ae02b3        	ldw	x,#691
2685  068e 89            	pushw	x
2686  068f ae0000        	ldw	x,#0
2687  0692 89            	pushw	x
2688  0693 ae000c        	ldw	x,#L532
2689  0696 cd0181        	call	_assert_failed
2691  0699 5b04          	addw	sp,#4
2692  069b               L662:
2693                     ; 694   Address &= (uint8_t)0xFE;
2695  069b 7b01          	ld	a,(OFST+1,sp)
2696  069d a4fe          	and	a,#254
2697  069f 6b01          	ld	(OFST+1,sp),a
2698                     ; 697   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
2700  06a1 7b01          	ld	a,(OFST+1,sp)
2701  06a3 1a02          	or	a,(OFST+2,sp)
2702  06a5 c75216        	ld	21014,a
2703                     ; 698 }
2706  06a8 85            	popw	x
2707  06a9 81            	ret
2741                     ; 705 void I2C_SendData(uint8_t Data)
2741                     ; 706 {
2742                     	switch	.text
2743  06aa               _I2C_SendData:
2747                     ; 708   I2C->DR = Data;
2749  06aa c75216        	ld	21014,a
2750                     ; 709 }
2753  06ad 81            	ret
2766                     	xdef	_main
2767                     	xref	_TCA6408AInitI2CReg
2768                     	xref	_TCA6408AInitDefault
2769                     	xref.b	_localReg
2770                     	xdef	_I2C_SendData
2771                     	xdef	_I2C_Send7bitAddress
2772                     	xdef	_I2C_ReceiveData
2773                     	xdef	_I2C_FastModeDutyCycleConfig
2774                     	xdef	_I2C_AcknowledgeConfig
2775                     	xdef	_I2C_GenerateSTOP
2776                     	xdef	_I2C_GenerateSTART
2777                     	xdef	_I2C_Cmd
2778                     	xdef	_I2C_Init
2779                     	xref	_IWDG_Enable
2780                     	xref	_IWDG_ReloadCounter
2781                     	xref	_IWDG_SetReload
2782                     	xref	_IWDG_SetPrescaler
2783                     	xref	_IWDG_WriteAccessCmd
2784                     	xdef	_TIM1_SetCompare2
2785                     	xdef	_TIM1_CtrlPWMOutputs
2786                     	xdef	_TIM1_Cmd
2787                     	xdef	_TIM1_OC2Init
2788                     	xdef	_TIM1_TimeBaseInit
2789                     	xdef	_assert_failed
2790                     	xref	_GPIO_WriteHigh
2791                     	xref	_GPIO_Init
2792                     	xref	_EXTI_SetExtIntSensitivity
2793                     	xref	_CLK_SYSCLKConfig
2794                     	xref	_CLK_HSIPrescalerConfig
2795                     	xref	_CLK_ClockSwitchConfig
2796                     	xref	_CLK_PeripheralClockConfig
2797                     	xref	_ADC1_GetConversionValue
2798                     	xref	_ADC1_StartConversion
2799                     	xref	_ADC1_Cmd
2800                     	xref	_ADC1_Init
2801                     	switch	.const
2802  000c               L532:
2803  000c 6d61696e2e63  	dc.b	"main.c",0
2804                     	xref.b	c_lreg
2805                     	xref.b	c_x
2825                     	xref	c_sdivx
2826                     	xref	c_ludv
2827                     	xref	c_rtol
2828                     	xref	c_smul
2829                     	xref	c_lmul
2830                     	xref	c_lcmp
2831                     	xref	c_ltor
2832                     	xref	c_lzmp
2833                     	end
