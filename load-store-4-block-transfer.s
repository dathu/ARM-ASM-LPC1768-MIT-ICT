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
	LDR R0, =0X10001000 ; memort location in RAM pointed by R0 (immediate value)
	;LDM     R0, {R1, R2, R3, R4, R5, R6, R7, R8}
	LDM     R0, {R1-R8}
    ;LDM     R0, {R6, R1, R2, R4, R5, R3, R8, R7}  
	STM     R0, {R4-R12}
	NOP
	END