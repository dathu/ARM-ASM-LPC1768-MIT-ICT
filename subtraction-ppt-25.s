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
	MOV R0, #0X1234
	MOV R1, #0X1111
	SUB R2, R0, R1 ; R2 = R0 -R1
	SUB R3, R0, #0X111 ; R3 = R0 - #0X111
	CMP R1, R0 ; R1 < R0 => CY = 0
	SBC R4, R0, R1 ;
	SBC R5, R0, #0X11 ; 
		
	NOP
	END