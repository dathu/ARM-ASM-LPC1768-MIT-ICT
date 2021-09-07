; Shift Instructions: RRX
; Flags are not affected 
; Use 'S' Suffix to update teh flag

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
	LDR R2, =0x12345678
	
	; Rotate Right with carry
	; R2 = Unchanged and 
	; R0  = [R2] after 33 bit rotation with carry
	MOV R0, R2, RRX 
	
	; Guess the output, 4-bits means 1 digit
	;What will happen when we execute below Instructions
	;LDR R1, =0x81223344
	;MOV R6, R1, RRX #4
	;MOV R7, R1, RRX #8
	;MOVS R8, R1, RRX #16
	
	;Try to set the carry bit and execute the instruction --> Observe the output
	
	NOP
	END