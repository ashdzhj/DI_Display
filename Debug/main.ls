   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  35                     ; 23 void main(void)
  35                     ; 24 {
  37                     	switch	.text
  38  0000               _main:
  42                     ; 26   GPIO_Config();
  44  0000 ad24          	call	L5_GPIO_Config
  46                     ; 29   CLK_Config();
  48  0002 ad1d          	call	L3_CLK_Config
  50  0004               L52:
  51                     ; 33 		GPIO_WriteHigh(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_5);
  53  0004 4b20          	push	#32
  54  0006 ae500f        	ldw	x,#20495
  55  0009 cd0000        	call	_GPIO_WriteHigh
  57  000c 84            	pop	a
  58                     ; 34 		GPIO_WriteHigh(GPIOF, (GPIO_Pin_TypeDef)GPIO_PIN_4);
  60  000d 4b10          	push	#16
  61  000f ae5019        	ldw	x,#20505
  62  0012 cd0000        	call	_GPIO_WriteHigh
  64  0015 84            	pop	a
  65                     ; 35 		GPIO_WriteHigh(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_2);
  67  0016 4b04          	push	#4
  68  0018 ae500a        	ldw	x,#20490
  69  001b cd0000        	call	_GPIO_WriteHigh
  71  001e 84            	pop	a
  73  001f 20e3          	jra	L52
  97                     ; 44 void CLK_Config(void)
  97                     ; 45 {
  98                     	switch	.text
  99  0021               L3_CLK_Config:
 103                     ; 48   CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 105  0021 4f            	clr	a
 106  0022 cd0000        	call	_CLK_HSIPrescalerConfig
 108                     ; 50 }
 111  0025 81            	ret
 135                     ; 57 void GPIO_Config(void)
 135                     ; 58 {
 136                     	switch	.text
 137  0026               L5_GPIO_Config:
 141                     ; 65 	GPIO_Init( GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST);
 143  0026 4be0          	push	#224
 144  0028 4b20          	push	#32
 145  002a ae500f        	ldw	x,#20495
 146  002d cd0000        	call	_GPIO_Init
 148  0030 85            	popw	x
 149                     ; 67 	GPIO_Init( GPIOF, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);
 151  0031 4be0          	push	#224
 152  0033 4b10          	push	#16
 153  0035 ae5019        	ldw	x,#20505
 154  0038 cd0000        	call	_GPIO_Init
 156  003b 85            	popw	x
 157                     ; 69 	GPIO_Init( GPIOC, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
 159  003c 4be0          	push	#224
 160  003e 4b04          	push	#4
 161  0040 ae500a        	ldw	x,#20490
 162  0043 cd0000        	call	_GPIO_Init
 164  0046 85            	popw	x
 165                     ; 94 }
 168  0047 81            	ret
 203                     ; 104 void assert_failed(uint8_t* file, uint32_t line)
 203                     ; 105 {
 204                     	switch	.text
 205  0048               _assert_failed:
 209  0048               L76:
 210  0048 20fe          	jra	L76
 223                     	xdef	_main
 224                     	xdef	_assert_failed
 225                     	xref	_GPIO_WriteHigh
 226                     	xref	_GPIO_Init
 227                     	xref	_CLK_HSIPrescalerConfig
 246                     	end
