   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  33                     ; 54 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  33                     ; 55 {
  34                     	switch	.text
  35  0000               f_NonHandledInterrupt:
  39                     ; 59 }
  42  0000 80            	iret
  64                     ; 67 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  64                     ; 68 {
  65                     	switch	.text
  66  0001               f_TRAP_IRQHandler:
  70                     ; 72 }
  73  0001 80            	iret
  95                     ; 78 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
  95                     ; 79 {
  96                     	switch	.text
  97  0002               f_TLI_IRQHandler:
 101                     ; 83 }
 104  0002 80            	iret
 126                     ; 90 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 126                     ; 91 {
 127                     	switch	.text
 128  0003               f_AWU_IRQHandler:
 132                     ; 95 }
 135  0003 80            	iret
 157                     ; 102 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 157                     ; 103 {
 158                     	switch	.text
 159  0004               f_CLK_IRQHandler:
 163                     ; 107 }
 166  0004 80            	iret
 189                     ; 114 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 189                     ; 115 {
 190                     	switch	.text
 191  0005               f_EXTI_PORTA_IRQHandler:
 195                     ; 119 }
 198  0005 80            	iret
 221                     ; 126 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 221                     ; 127 {
 222                     	switch	.text
 223  0006               f_EXTI_PORTB_IRQHandler:
 227                     ; 131 }
 230  0006 80            	iret
 253                     ; 138 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 253                     ; 139 {
 254                     	switch	.text
 255  0007               f_EXTI_PORTC_IRQHandler:
 259                     ; 143 }
 262  0007 80            	iret
 286                     ; 150 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 286                     ; 151 {
 287                     	switch	.text
 288  0008               f_EXTI_PORTD_IRQHandler:
 290  0008 3b0002        	push	c_x+2
 291  000b be00          	ldw	x,c_x
 292  000d 89            	pushw	x
 293  000e 3b0002        	push	c_y+2
 294  0011 be00          	ldw	x,c_y
 295  0013 89            	pushw	x
 298                     ; 152   if (GPIO_ReadInputPin(GPIOD, GPIO_PIN_6) == 0)
 300  0014 4b40          	push	#64
 301  0016 ae500f        	ldw	x,#20495
 302  0019 cd0000        	call	_GPIO_ReadInputPin
 304  001c 5b01          	addw	sp,#1
 305  001e 4d            	tnz	a
 306                     ; 154 }
 309  001f 85            	popw	x
 310  0020 bf00          	ldw	c_y,x
 311  0022 320002        	pop	c_y+2
 312  0025 85            	popw	x
 313  0026 bf00          	ldw	c_x,x
 314  0028 320002        	pop	c_x+2
 315  002b 80            	iret
 338                     ; 161 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 338                     ; 162 {
 339                     	switch	.text
 340  002c               f_EXTI_PORTE_IRQHandler:
 344                     ; 166 }
 347  002c 80            	iret
 369                     ; 212 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 369                     ; 213 {
 370                     	switch	.text
 371  002d               f_SPI_IRQHandler:
 375                     ; 217 }
 378  002d 80            	iret
 401                     ; 224 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 401                     ; 225 {
 402                     	switch	.text
 403  002e               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 407                     ; 229 }
 410  002e 80            	iret
 433                     ; 236 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 433                     ; 237 {
 434                     	switch	.text
 435  002f               f_TIM1_CAP_COM_IRQHandler:
 439                     ; 241 }
 442  002f 80            	iret
 465                     ; 273 INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 465                     ; 274 {
 466                     	switch	.text
 467  0030               f_TIM2_UPD_OVF_BRK_IRQHandler:
 471                     ; 278 }
 474  0030 80            	iret
 497                     ; 285 INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 497                     ; 286 {
 498                     	switch	.text
 499  0031               f_TIM2_CAP_COM_IRQHandler:
 503                     ; 290 }
 506  0031 80            	iret
 529                     ; 300 INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 529                     ; 301 {
 530                     	switch	.text
 531  0032               f_TIM3_UPD_OVF_BRK_IRQHandler:
 535                     ; 305 }
 538  0032 80            	iret
 561                     ; 312 INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 561                     ; 313 {
 562                     	switch	.text
 563  0033               f_TIM3_CAP_COM_IRQHandler:
 567                     ; 317 }
 570  0033 80            	iret
 592                     ; 352 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 592                     ; 353 {
 593                     	switch	.text
 594  0034               f_I2C_IRQHandler:
 598                     ; 357 }
 601  0034 80            	iret
 624                     ; 365 INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
 624                     ; 366 {
 625                     	switch	.text
 626  0035               f_UART2_TX_IRQHandler:
 630                     ; 370 }
 633  0035 80            	iret
 656                     ; 377 INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
 656                     ; 378 {
 657                     	switch	.text
 658  0036               f_UART2_RX_IRQHandler:
 662                     ; 382 }
 665  0036 80            	iret
 687                     ; 429 INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 687                     ; 430 {
 688                     	switch	.text
 689  0037               f_ADC1_IRQHandler:
 693                     ; 435 }
 696  0037 80            	iret
 719                     ; 456 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 719                     ; 457 {
 720                     	switch	.text
 721  0038               f_TIM4_UPD_OVF_IRQHandler:
 725                     ; 461 }
 728  0038 80            	iret
 751                     ; 469 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 751                     ; 470 {
 752                     	switch	.text
 753  0039               f_EEPROM_EEC_IRQHandler:
 757                     ; 474 }
 760  0039 80            	iret
 772                     	xdef	f_EEPROM_EEC_IRQHandler
 773                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 774                     	xdef	f_ADC1_IRQHandler
 775                     	xdef	f_UART2_TX_IRQHandler
 776                     	xdef	f_UART2_RX_IRQHandler
 777                     	xdef	f_I2C_IRQHandler
 778                     	xdef	f_TIM3_CAP_COM_IRQHandler
 779                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
 780                     	xdef	f_TIM2_CAP_COM_IRQHandler
 781                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 782                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 783                     	xdef	f_TIM1_CAP_COM_IRQHandler
 784                     	xdef	f_SPI_IRQHandler
 785                     	xdef	f_EXTI_PORTE_IRQHandler
 786                     	xdef	f_EXTI_PORTD_IRQHandler
 787                     	xdef	f_EXTI_PORTC_IRQHandler
 788                     	xdef	f_EXTI_PORTB_IRQHandler
 789                     	xdef	f_EXTI_PORTA_IRQHandler
 790                     	xdef	f_CLK_IRQHandler
 791                     	xdef	f_AWU_IRQHandler
 792                     	xdef	f_TLI_IRQHandler
 793                     	xdef	f_TRAP_IRQHandler
 794                     	xdef	f_NonHandledInterrupt
 795                     	xref	_GPIO_ReadInputPin
 796                     	xref.b	c_x
 797                     	xref.b	c_y
 816                     	end
