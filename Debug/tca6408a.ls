   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
 278                     ; 22 void TCA6408AInitDefault(TCA6408ARegs* Regs)
 278                     ; 23 {
 280                     	switch	.text
 281  0000               _TCA6408AInitDefault:
 285                     ; 24 	Regs->Output.all = 0x80;
 287  0000 a680          	ld	a,#128
 288  0002 e701          	ld	(1,x),a
 289                     ; 25 	Regs->PolarityInversion.all = 0x00;
 291  0004 6f02          	clr	(2,x)
 292                     ; 26 	Regs->Config.all = 0x7F;
 294  0006 a67f          	ld	a,#127
 295  0008 e703          	ld	(3,x),a
 296                     ; 27 }
 299  000a 81            	ret
 346                     ; 36 unsigned char TCA6408AInitI2CReg(TCA6408ARegs* Regs)
 346                     ; 37 {
 347                     	switch	.text
 348  000b               _TCA6408AInitI2CReg:
 350  000b 89            	pushw	x
 351  000c 88            	push	a
 352       00000001      OFST:	set	1
 355                     ; 38 	unsigned char return_Value = 0;
 357  000d 0f01          	clr	(OFST+0,sp)
 358                     ; 40 	I2C_Write_Byte(TCA6408A_ADDRESS, TCA6408A_CONFIG_REG, Regs->Config.all);
 360  000f e603          	ld	a,(3,x)
 361  0011 88            	push	a
 362  0012 ae0003        	ldw	x,#3
 363  0015 a602          	ld	a,#2
 364  0017 95            	ld	xh,a
 365  0018 ad36          	call	_I2C_Write_Byte
 367  001a 84            	pop	a
 368                     ; 41 	I2C_Write_Byte(TCA6408A_ADDRESS, TCA6408A_OUTPUT_REG, Regs->Output.all);
 370  001b 1e02          	ldw	x,(OFST+1,sp)
 371  001d e601          	ld	a,(1,x)
 372  001f 88            	push	a
 373  0020 ae0001        	ldw	x,#1
 374  0023 a602          	ld	a,#2
 375  0025 95            	ld	xh,a
 376  0026 ad28          	call	_I2C_Write_Byte
 378  0028 84            	pop	a
 379                     ; 42 	I2C_Write_Byte(TCA6408A_ADDRESS, TCA6408A_POLARITY_REG, Regs->PolarityInversion.all);
 381  0029 1e02          	ldw	x,(OFST+1,sp)
 382  002b e602          	ld	a,(2,x)
 383  002d 88            	push	a
 384  002e ae0002        	ldw	x,#2
 385  0031 a602          	ld	a,#2
 386  0033 95            	ld	xh,a
 387  0034 ad1a          	call	_I2C_Write_Byte
 389  0036 84            	pop	a
 390                     ; 49 	return return_Value;
 392  0037 7b01          	ld	a,(OFST+0,sp)
 395  0039 5b03          	addw	sp,#3
 396  003b 81            	ret
 444                     ; 98 unsigned char TCA6408AWriteOutput(TCA6408ARegs * Regs)
 444                     ; 99 {
 445                     	switch	.text
 446  003c               _TCA6408AWriteOutput:
 448  003c 88            	push	a
 449       00000001      OFST:	set	1
 452                     ; 100 	unsigned char return_Value = 0;
 454  003d 0f01          	clr	(OFST+0,sp)
 455                     ; 103 	I2C_Write_Byte(TCA6408A_ADDRESS, TCA6408A_OUTPUT_REG, Regs->Output.all);
 457  003f e601          	ld	a,(1,x)
 458  0041 88            	push	a
 459  0042 ae0001        	ldw	x,#1
 460  0045 a602          	ld	a,#2
 461  0047 95            	ld	xh,a
 462  0048 ad06          	call	_I2C_Write_Byte
 464  004a 84            	pop	a
 465                     ; 109 	return return_Value;
 467  004b 7b01          	ld	a,(OFST+0,sp)
 470  004d 5b01          	addw	sp,#1
 471  004f 81            	ret
 527                     ; 133 void I2C_Write_Byte(uint8_t Dev_Address, uint8_t Reg_Address, uint8_t data)
 527                     ; 134 {
 528                     	switch	.text
 529  0050               _I2C_Write_Byte:
 531  0050 89            	pushw	x
 532       00000000      OFST:	set	0
 535                     ; 135 	I2C_GenerateSTART(ENABLE);
 537  0051 a601          	ld	a,#1
 538  0053 cd0000        	call	_I2C_GenerateSTART
 540                     ; 136 	I2C_Send7bitAddress(Dev_Address,I2C_DIRECTION_TX);
 542  0056 5f            	clrw	x
 543  0057 7b01          	ld	a,(OFST+1,sp)
 544  0059 95            	ld	xh,a
 545  005a cd0000        	call	_I2C_Send7bitAddress
 547                     ; 137 	I2C_SendData(Reg_Address);
 549  005d 7b02          	ld	a,(OFST+2,sp)
 550  005f cd0000        	call	_I2C_SendData
 552                     ; 138 	I2C_SendData(data);
 554  0062 7b05          	ld	a,(OFST+5,sp)
 555  0064 cd0000        	call	_I2C_SendData
 557                     ; 139 	I2C_GenerateSTOP(ENABLE);
 559  0067 a601          	ld	a,#1
 560  0069 cd0000        	call	_I2C_GenerateSTOP
 562                     ; 140 }
 565  006c 85            	popw	x
 566  006d 81            	ret
 591                     	xdef	_I2C_Write_Byte
 592                     	xref	_I2C_SendData
 593                     	xref	_I2C_Send7bitAddress
 594                     	xref	_I2C_GenerateSTOP
 595                     	xref	_I2C_GenerateSTART
 596                     	xdef	_TCA6408AInitI2CReg
 597                     	xdef	_TCA6408AInitDefault
 598                     	xdef	_TCA6408AWriteOutput
 599                     	switch	.ubsct
 600  0000               _localReg:
 601  0000 00000000      	ds.b	4
 602                     	xdef	_localReg
 622                     	end
