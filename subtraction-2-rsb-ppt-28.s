; Program to perform reverse subtraction

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
	MOV R0, #0X2
	MOV R1, #0X8
	RSB R2, R0, R1 ; R2 = 0X6
	RSB R3, R0, #0X8   ; R2 = 0X6
	
	MOV R0, #0X8
	MOV R1, #0X2
	RSB R4, R0, R1      ; R4 = 0XFFFFFFFA

	NOP
	END