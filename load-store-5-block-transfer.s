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
	LDR R0, =0X10000000 ; memort location in RAM pointed by R0 (immediate value)
	LDR R7, =0X1000000E ; memort location in RAM pointed by R7 (immediate value)
	
	
	; Base Register contents are updated following the transfer 
	
	;LDM     R0, {R1-R3}    ; R0 <- R0 after execution
    LDM     R0!, {R1-R3}    ; R0 <- R0 + 12 after execution
    STM     R7!, {R1-R3}    ; R7 <- R7 + 12

	
	NOP
	END