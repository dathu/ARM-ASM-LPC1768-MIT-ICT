; Program to perform subtraction

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
	MOV R0, #0X9
	MOV R1, #0X2
	SUB R2, R0, R1 ; R2 = R0 -R1
	SUB R3, R0, #0X2 ; R3 = R0 - #0X2
	SBC R4, R0, R1 ;
	SBC R5, R0, #0X2 ; 
		
	NOP
	END