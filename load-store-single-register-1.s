	AREA RESET, DATA, READONLY
	EXPORT __Vectors
	
__Vectors
	DCD 0x10001000 ; stack pointer value when stack is empty
	DCD Reset_Handler ; reset vector
	
	ALIGN
	AREA endian, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
	
Reset_Handler
	;---------------------- Word -------------------------------------------------------
	LDR R0, =0X10000000 ; memort location in RAM pointed by R0 (immediate value)
	LDR R1, =0X11223344 ; Value to be store in Memory
	STR R1, [R0] ; Check the memory location 0X10000000 to 0X10000003
	;-----------------------------------------------------------------------------------
	
	;---------------------- Half Word -------------------------------------------------------
	LDR R3, =0X10000004 ; memort location in RAM pointed by R3 (immediate value)
	MOV R4, #3344 ; Value to be store in Memory
	STRH R4, [R3] ; Check the memory location 0X10000004 to 0X10000007
	;-----------------------------------------------------------------------------------
	
	;---------------------- Byte -------------------------------------------------------
	LDR R6, =0X10000008 ; memort location in RAM pointed by R6 (immediate value)
	MOV R7, #0X44 ; Value to be store in Memory
	STRB R7, [R6] ; Check the memory location 0X10000008 to 0X1000000B
	;-----------------------------------------------------------------------------------
	
	;----------------------Signed Byte -------------------------------------------------------
	;LDR R9, =0X1000000C ; memort location in RAM pointed by R0 (immediate value)
	;MOV R10, #0X44 ; Value to be store in Memory
	;STRSB R10, [R9] ; Check the memory location 0X1000000C to 0X1000000F
	;-----------------------------------------------------------------------------------
	
	; STRSH

	NOP
	END