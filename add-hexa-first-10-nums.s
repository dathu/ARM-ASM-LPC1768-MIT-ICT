;Addition of First 10 Integers in Hexadecimal = 37h

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
	MOV R0, #10
	MOV R1, #0
LOOP ADD R1, R0
	 SUBS R0, #1
	 BNE LOOP
	 LDR R0, =0X10000000
	 STR R1, [R0]

	NOP
	END
