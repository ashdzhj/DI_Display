   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  35                     ; 23 void main(void)
  35                     ; 24 {
  37                     	switch	.text
  38  0000               _main:
  42                     ; 27   GPIO_Config();
  44  0000 ad61          	call	L5_GPIO_Config
  46                     ; 30   CLK_Config();
  48  0002 ad41          	call	L3_CLK_Config
  50  0004               L52:
  51                     ; 35 		GPIO_WriteHigh(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_5);
  53  0004 4b20          	push	#32
  54  0006 ae500f        	ldw	x,#20495
  55  0009 cd0000        	call	_GPIO_WriteHigh
  57  000c 84            	pop	a
  58                     ; 37 		GPIO_WriteHigh(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_2);
  60  000d 4b04          	push	#4
  61  000f ae500f        	ldw	x,#20495
  62  0012 cd0000        	call	_GPIO_WriteHigh
  64  0015 84            	pop	a
  65                     ; 39 		GPIO_WriteHigh(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_4);
  67  0016 4b10          	push	#16
  68  0018 ae500a        	ldw	x,#20490
  69  001b cd0000        	call	_GPIO_WriteHigh
  71  001e 84            	pop	a
  72                     ; 41 		GPIO_WriteHigh(GPIOB, (GPIO_Pin_TypeDef)GPIO_PIN_2);
  74  001f 4b04          	push	#4
  75  0021 ae5005        	ldw	x,#20485
  76  0024 cd0000        	call	_GPIO_WriteHigh
  78  0027 84            	pop	a
  79                     ; 43 		GPIO_WriteHigh(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_3);
  81  0028 4b08          	push	#8
  82  002a ae500f        	ldw	x,#20495
  83  002d cd0000        	call	_GPIO_WriteHigh
  85  0030 84            	pop	a
  86                     ; 45 		GPIO_WriteHigh(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_2);
  88  0031 4b04          	push	#4
  89  0033 ae500a        	ldw	x,#20490
  90  0036 cd0000        	call	_GPIO_WriteHigh
  92  0039 84            	pop	a
  93                     ; 47 		GPIO_WriteHigh(GPIOF, (GPIO_Pin_TypeDef)GPIO_PIN_4);
  95  003a 4b10          	push	#16
  96  003c ae5019        	ldw	x,#20505
  97  003f cd0000        	call	_GPIO_WriteHigh
  99  0042 84            	pop	a
 101  0043 20bf          	jra	L52
 159                     ; 57 void CLK_Config(void)
 159                     ; 58 {
 160                     	switch	.text
 161  0045               L3_CLK_Config:
 163  0045 88            	push	a
 164       00000001      OFST:	set	1
 167                     ; 60   ErrorStatus status = ERROR;
 169  0046 0f01          	clr	(OFST+0,sp)
 170                     ; 63   CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 172  0048 4f            	clr	a
 173  0049 cd0000        	call	_CLK_HSIPrescalerConfig
 175                     ; 66 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 177  004c a680          	ld	a,#128
 178  004e cd0000        	call	_CLK_SYSCLKConfig
 180                     ; 69 	status = CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE,
 180                     ; 70                                    DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
 182  0051 4b00          	push	#0
 183  0053 4b00          	push	#0
 184  0055 ae00b4        	ldw	x,#180
 185  0058 a601          	ld	a,#1
 186  005a 95            	ld	xh,a
 187  005b cd0000        	call	_CLK_ClockSwitchConfig
 189  005e 85            	popw	x
 190  005f 6b01          	ld	(OFST+0,sp),a
 191                     ; 73 }
 194  0061 84            	pop	a
 195  0062 81            	ret
 219                     ; 80 void GPIO_Config(void)
 219                     ; 81 {
 220                     	switch	.text
 221  0063               L5_GPIO_Config:
 225                     ; 84 	GPIO_Init( GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST);
 227  0063 4be0          	push	#224
 228  0065 4b20          	push	#32
 229  0067 ae500f        	ldw	x,#20495
 230  006a cd0000        	call	_GPIO_Init
 232  006d 85            	popw	x
 233                     ; 87 	GPIO_Init( GPIOD, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
 235  006e 4be0          	push	#224
 236  0070 4b04          	push	#4
 237  0072 ae500f        	ldw	x,#20495
 238  0075 cd0000        	call	_GPIO_Init
 240  0078 85            	popw	x
 241                     ; 90 	GPIO_Init( GPIOC, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);
 243  0079 4be0          	push	#224
 244  007b 4b10          	push	#16
 245  007d ae500a        	ldw	x,#20490
 246  0080 cd0000        	call	_GPIO_Init
 248  0083 85            	popw	x
 249                     ; 93 	GPIO_Init( GPIOB, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
 251  0084 4be0          	push	#224
 252  0086 4b04          	push	#4
 253  0088 ae5005        	ldw	x,#20485
 254  008b cd0000        	call	_GPIO_Init
 256  008e 85            	popw	x
 257                     ; 96 	GPIO_Init( GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
 259  008f 4be0          	push	#224
 260  0091 4b08          	push	#8
 261  0093 ae500f        	ldw	x,#20495
 262  0096 cd0000        	call	_GPIO_Init
 264  0099 85            	popw	x
 265                     ; 99 	GPIO_Init( GPIOC, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
 267  009a 4be0          	push	#224
 268  009c 4b04          	push	#4
 269  009e ae500a        	ldw	x,#20490
 270  00a1 cd0000        	call	_GPIO_Init
 272  00a4 85            	popw	x
 273                     ; 102 	GPIO_Init( GPIOF, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);
 275  00a5 4be0          	push	#224
 276  00a7 4b10          	push	#16
 277  00a9 ae5019        	ldw	x,#20505
 278  00ac cd0000        	call	_GPIO_Init
 280  00af 85            	popw	x
 281                     ; 128 }
 284  00b0 81            	ret
 319                     ; 138 void assert_failed(uint8_t* file, uint32_t line)
 319                     ; 139 {
 320                     	switch	.text
 321  00b1               _assert_failed:
 325  00b1               L501:
 326  00b1 20fe          	jra	L501
 339                     	xdef	_main
 340                     	xdef	_assert_failed
 341                     	xref	_GPIO_WriteHigh
 342                     	xref	_GPIO_Init
 343                     	xref	_CLK_SYSCLKConfig
 344                     	xref	_CLK_HSIPrescalerConfig
 345                     	xref	_CLK_ClockSwitchConfig
 364                     	end
