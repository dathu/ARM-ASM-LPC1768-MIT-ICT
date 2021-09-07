; Addition Instructions

	AREA    RESET, DATA, READONLY
    EXPORT  __Vectors

__Vectors 
	DCD  0x100000FF     ; stack pointer value when stack is empty
    DCD  Reset_Handler  ; reset vector
  
    ALIGN

	AREA mycode, CODE, READONLY
	EXPORT Reset_Handler
	ENTRY
Reset_Handler

	LDR R0, =0XFFFFFFFF
	LDR R2, =0X00110011

	ADD R1, R0, R2
	ADD R3, R2, #36 ; (36)10 = (24)16
	
	;--------------------------------------
	
	LDR R4, =0XFFFFFFFF
	LDR R5, =0X00110011
	
	ADD R4, R5
	ADD R5, #36
	
	;--------------------------------------
	
	NOP
	END
	