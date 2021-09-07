;Fibonacci Series of N Numbers

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
	;LDR R0, =0X10000000 ; Memory location
	LDR R0, =SRC ; Memory location
	MOV R5, #NUM ; Number of Add Operation
	
LP	LDR R1, [R0] ; Load 1st num to R1
	LDR R2, [R0, #4] ; Load 1st num to R1
	ADD R3, R1, R2
	STR R3, [R0, #8]
	
	ADD R0, R0, #4
	SUBS R5, #01
	BNE LP


NUM EQU 4
SRC DCD 0,1

	NOP
	END