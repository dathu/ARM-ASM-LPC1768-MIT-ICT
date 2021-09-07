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
     ; CONDITION FOR CARRY FLAG TO SET (Bigger - Smaller)
	;MOV R0, #0X1234
	;MOV R1, #0X1111
	
	; CONDITION FOR CARRY FLAG TO RESET (Smaller - Bigger)
	MOV R0, #0X1111
	MOV R1, #0X1234
	
	; 'S' WILL UPDATE THE CARRY FLAG
	
	; SUB R2, R0, R1 ; R2 = R0 -R1
	SUBS R2, R0, R1 ; R2 = R0 -R1 AND UDPATE 'C' FLAG IN xPSR
	;SBC R4, R0, R1  ; R4 = R0 -R1 - 1 + C
	;RSB R3, R0, R1   ; R3 = R1 - R0
	;RSC R5, R0, R1   ; R5 = R0 -R1 - 1 + C
	
	
	NOP
	END