; BUBBLE SORT
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
	LDR R0, =0X10000000  ; Load R0 with RAM location load mem with 50, 25, 5, 20, 10 (4 byte Boundry)
	MOV R1, #5 	;Initialize the number 'n' of elements in an array
	SUBS R1, R1, #1 ;Decrement R1 by 1. to perform '5-1' comparison.
OUTLOOP 
	MOV R3, R1 	;R3 is used as counter for inloop
	MOV R0, #0X10000000 	;Initialize RO with starting address of Data 
INLOOP 
	LDR R2,[R0],#4	;R2 is loaded with first array number. After loading address is incremented
	LDR R4, [R0] 	;R4 is loaded with second array Number
	CMP R4, R2 	;Compare first and second array elements
	BCS SKIP	;Check carry flag. If C flag = 1
	STR R2,[R0], #-4	;If C = 0, then store R2 content in address present in R0.
	STR R4, [R0], #4 	; store R4 content in new RO location. then again increment R0 
SKIP 
	SUBS R3, R3, #1 	;Decrement R3 by 1 
	BNE INLOOP	; If R3 is not equal to 0 Branch to label INLOOP 
	SUBS R1, R1,#1	;Decrement R1 by 1
	BNE OUTLOOP

	NOP
	END