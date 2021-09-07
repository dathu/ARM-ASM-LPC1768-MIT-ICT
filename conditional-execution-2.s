; Conditional Execution 1

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

	MOV     R0, #0x2     ; setting up initial variable 
	CMP     R0, #0x3     ; comparing r0 to number 3. Negative bit get's set to 1 (2 - 3 = -1)
	
	;the ADDLT instruction is executed because LT condition is full filled when 
	;V != N (values of overflow and negative bits in the CPSR are different).
	
	ADDLT   R0, R0, #0x1 ; increasing r0 IF it was determined that it is smaller (lower than) number 3 
	
	; Below are used to move data between register and APSR
	;LDR R4, =0X00000000 
	;MSR xPSR, R4 ; Setting NZCV flag to 1 in xPSR
	
	CMP     R0, #0x3     ; comparing r0 to number 3 again. Z = 1, N =0, C = 1 (SUBSTRACTION OF TWO EQUAL NUMBER)
	
	
	;MOV     R5, #0x5
	; Below are used to move data between register and APSR
	;LDR R4, =0X00000000 
	;MSR xPSR, R4 ; Setting NZCV flag to 1 in xPSR
	
	;CMP R5, #0x5 comparing r0 to number 5. Z = 1, N =0, C = 1 (SUBSTRACTION OF TWO EQUAL NUMBER)
	
	;CMP R5, #0X6 comparing r0 (=5) to number 6. Z = 0, N =1, C = 0 (SUBSTRACTION OF SMALLER NUMBER FROM BIGGER NUMBER)

	NOP
	END