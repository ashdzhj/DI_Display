#include "TCA6408A.h"
#include "stm8s_i2c.h"

#define CLR_NACK NACK = 0


extern unsigned char NACK;

TCA6408ARegs localReg;

void I2C_Write_Byte(uint8_t Dev_Address, uint8_t Reg_Address, uint8_t data);

// ****************************************************************************
//! @fn          void TCA6408AInitDefault(TCA6408ARegs* Regs)
//! @brief
//!				 Initializes the confRegs structure which is
//!              a local mirror of the TPL7200 config registers
//!              additional TPL7200writeConfigRegisters(confRegs) function call
//! 			 is needed in order to get the TPL7200 registers updated
//!
//! ****************************************************************************
void TCA6408AInitDefault(TCA6408ARegs* Regs)
{
	Regs->Output.all = 0x80;
	Regs->PolarityInversion.all = 0x00;
	Regs->Config.all = 0x7F;
}


// ****************************************************************************
//! @fn          void TCA6408AInitI2CReg(TCA6408ARegs* Regs)
//! @brief
//! @return		 Returns I2C success or failure
//!
// ****************************************************************************
unsigned char TCA6408AInitI2CReg(TCA6408ARegs* Regs)
{
	unsigned char return_Value = 0;
	//CLR_NACK;
	I2C_Write_Byte(TCA6408A_ADDRESS, TCA6408A_CONFIG_REG, Regs->Config.all);
	I2C_Write_Byte(TCA6408A_ADDRESS, TCA6408A_OUTPUT_REG, Regs->Output.all);
	I2C_Write_Byte(TCA6408A_ADDRESS, TCA6408A_POLARITY_REG, Regs->PolarityInversion.all);
	// if(NACK)
	// {
	// 	NACK = 0;

	// 	return_Value = 1;
	// }
	return return_Value;
}

#if 0
// ****************************************************************************
//! @fn          void TCA6408AReadInputReg(TCA6408ARegs* Regs)
//! @brief		 Stores input register values to MSP430 Memory map
//! @return		 Returns I2C success or failure
//!
// ****************************************************************************
unsigned char TCA6408AReadInputReg(TCA6408ARegs* Regs)
{
	unsigned char return_Value = I2C_OPERATION_SUCCESSFUL;
	CLR_NACK;
	I2C_Read(1,TCA6408A_ADDRESS, TCA6408A_INPUT_REG, (unsigned char*)&Regs->Input);
	if(NACK)
	{
		NACK = 0;
		return_Value = I2C_OPERATION_FAIL;
	}
	return return_Value;
}


// ****************************************************************************
//! @fn          void TCA6408AWriteConfig(TCA6408ARegs* Regs)
//! @brief		 Writes config value from MSP430 memory map to TCA6408A
//! @return		 Returns I2C success or failure
//!
// ****************************************************************************
unsigned char TCA6408AWriteConfig(TCA6408ARegs * Regs)
{
	unsigned char return_Value = I2C_OPERATION_SUCCESSFUL;
	CLR_NACK;
	I2C_Write(1, TCA6408A_ADDRESS, TCA6408A_CONFIG_REG, (unsigned char*)&Regs->Config, 0);
	if(NACK)
	{
		NACK = 0;
		return_Value = I2C_OPERATION_FAIL;
	}
	return return_Value;
}
#endif
// ****************************************************************************
//! @fn          void TCA6408AWriteOutput(TCA6408ARegs* Regs)
//! @brief		 Writes output value from MSP430 memory map to TCA6408A
//! @return		 Returns I2C success or failure
//!
// ****************************************************************************
unsigned char TCA6408AWriteOutput(TCA6408ARegs * Regs)
{
	unsigned char return_Value = 0;
	// CLR_NACK;
	//I2C_Write(1, TCA6408A_ADDRESS, TCA6408A_OUTPUT_REG, (unsigned char*)&Regs->Output, 0);
	I2C_Write_Byte(TCA6408A_ADDRESS, TCA6408A_OUTPUT_REG, Regs->Output.all);
	// if(NACK)
	// {
	// 	NACK = 0;
	// 	return_Value = 1;
	// }
	return return_Value;
}

#if 0
// ****************************************************************************
//! @fn          void TCA6408AWritePolarity(TCA6408ARegs* Regs)
//! @brief		 Writes polarity inversion value from MSP430 memory map to TCA6408A
//! @return		 Returns I2C success or failure
//!
// ****************************************************************************
unsigned char TCA6408AWritePolarity(TCA6408ARegs * Regs)
{
	unsigned char return_Value = I2C_OPERATION_SUCCESSFUL;
	CLR_NACK;
	I2C_Write(1, TCA6408A_ADDRESS, TCA6408A_POLARITY_REG, (unsigned char*)&Regs->PolarityInversion, 0);
	if(NACK)
	{
		NACK = 0;
		return_Value = I2C_OPERATION_FAIL;
	}
	return return_Value;
}
#endif

void I2C_Write_Byte(uint8_t Dev_Address, uint8_t Reg_Address, uint8_t data)
{
	I2C_GenerateSTART(ENABLE);
	I2C_Send7bitAddress(Dev_Address,I2C_DIRECTION_TX);
	I2C_SendData(Reg_Address);
	I2C_SendData(data);
	I2C_GenerateSTOP(ENABLE);
}


