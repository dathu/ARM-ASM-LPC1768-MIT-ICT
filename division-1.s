; Program to perform DIVISION

	AREA RESET, DATA, READONLY
	EXPORT __Vectors
	
__Vectors
	DCD 0x10001000 ; stack pointer value when stack is empty
	DCD Reset_Handler ; reset vector
	
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
	
Reset_Handler
	
	
	MOV R0, #0XA
	MOV R1, #0X2
	
	UDIV R2, R0, R1
	SDIV R3, R0, R1

	NOP
	END