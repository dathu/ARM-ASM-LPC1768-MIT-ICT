;Example to demonstarte Branch and Link Instruction ==> 'BL' with condition
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
		MOV R3, #0X2 	; Moving Value 1
		MOV R6, #0X4 	; Moving Value 2
		MOV R5, #0X02 	;Moving count value
		
		CMP R2, #0X10   ; some operation 
		BL Next			; focus on link register now ir copies the instruction address of EQ i.e, 0x0000001B
		ADDEQ R2, R3, R6
		B Last
Next	AND R4, R5, R6
		;MOV PC, LR ; (throws warning)copies the content of LR to PC i.e, address of EQ instruction 0x0000001B
		BX LR ; copies the content of LR to PC i.e, address of EQ instruction 0x0000001B
	
Last	NOP
	END