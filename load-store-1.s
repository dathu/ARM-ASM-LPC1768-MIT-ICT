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
	LDR R0, =0X10000000
	LDR R1, =0X12345678 ; ARM follows little endian format so LSB byte is stored @ lower memory location (0X10000000) 
	; followed by MSB @ higher memory location (0X10000003).
	; Note: processor ALU can process 32 bit data but each memory location can store only 8 bit data
	STR R1, [R0]


	NOP
	END