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
	
	LDR R0, =0X10000000 ; memort location in RAM pointed by R0 (immediate value)
	LDR R1, =0X11223344 ; Value to be store in Memory
	STR R1, [R0] ; Check the memory location 0X10000000 to 0X10000003
	LDRB R2, [R0] ; R2 = 44 (LSB Byte)
	LDRH R3, [R0] ; R3 = 44 33 OR 33 44 ? any guess!!!!

	NOP
	END