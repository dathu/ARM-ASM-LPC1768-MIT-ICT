; Program to perform MULTIPLICATION

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
	
	; 32-bit MULTIPLICATION
	MOV R0, #0X08
	MOV R1, #0X02
	
	MUL R2, R0, R1

	NOP
	END