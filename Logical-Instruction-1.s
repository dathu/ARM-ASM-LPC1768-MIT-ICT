; logical Instructions: AND, ORR, EOR, BIC, ORN
; Flags Affected: 'N & Z' if 'S' is used with instruction
; Used for: Seetings bits, Clearin Bits, Complememtation of bits : I/O, Interfacing Programs


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
	LDR R1, =0xFFFFFFFF
	LDR R2, =0x00110011
	
	;--------------Logical AND------------------------
	AND R3, R2, R1
	AND R4, R2, #0x00110011
	
	LDR R7, =0xFFFFFFFF
	LDR R8, =0x00110011
	AND R8, R7

	;---------------- Clearing all Registers -------------------
	LDR R0, =0x00000000
	LDR R1, =0x00000000
	LDR R2, =0x00000000
	LDR R3, =0x00000000
	LDR R4, =0x00000000
	LDR R5, =0x00000000
	LDR R6, =0x00000000
	LDR R7, =0x00000000
	LDR R8, =0x00000000
	LDR R9, =0x00000000
	
	;---------------Logical OR------------------------
	LDR R1, =0xFFFFFFFF
	LDR R2, =0x00110011
	ORR R3, R2, R1
	ORR R4, R2, #0x00110011
	
	LDR R7, =0xFFFFFFFF
	LDR R8, =0x00110011
	ORR R8, R7	
	
		;---------------- Clearing all Registers -------------------
	LDR R0, =0x00000000
	LDR R1, =0x00000000
	LDR R2, =0x00000000
	LDR R3, =0x00000000
	LDR R4, =0x00000000
	LDR R5, =0x00000000
	LDR R6, =0x00000000
	LDR R7, =0x00000000
	LDR R8, =0x00000000
	LDR R9, =0x00000000
	
	;---------------Logical EOR------------------------
	LDR R1, =0xFFFFFFFF
	LDR R2, =0x00110011
	EOR R3, R2, R1
	EOR R4, R2, #0x00110011
	
	LDR R7, =0xFFFFFFFF
	LDR R8, =0x00110011
	EOR R8, R7
	
	
	;---------------- Clearing all Registers -------------------
	LDR R0, =0x00000000
	LDR R1, =0x00000000
	LDR R2, =0x00000000
	LDR R3, =0x00000000
	LDR R4, =0x00000000
	LDR R5, =0x00000000
	LDR R6, =0x00000000
	LDR R7, =0x00000000
	LDR R8, =0x00000000
	LDR R9, =0x00000000
	
	;---------------Logical AND NOT | BIT CLEAR------------------------
	LDR R1, =0xFFFFFFFF
	LDR R2, =0x00110011
	
	BIC R3, R2, R1
	
	;---------------- Clearing all Registers -------------------
	
	LDR R0, =0x00000000
	LDR R1, =0x00000000
	LDR R2, =0x00000000
	LDR R3, =0x00000000

	;---------------Logical OR NOT -------------------------------
	LDR R1, =0xFFFFFFFF
	LDR R2, =0x00110011
	
	ORN R3, R2, R1
	
	
	; ------- Add 'S' Flag to all the instructions and Observer the status of the Flags -----
	; Z flag is set (Z = 1) when result is zero otherwise Z = 0
	; N flag is set (N = 1) When MSB bit is '1' after logical operation  otherwise N = 0
	;------ Practice Yourself ----------------------------
	;ORREQ R2, R0, R5 
	;ANDS R9, R8, #0x19 
	;EORS R7, R11, #0x18181818 
	;BIC R0, R1, #0xab 
	;ORN R7, R11, R14, ROR #4 
	;ORNS R7, R11, R14, ASR #32
	
	NOP
	END