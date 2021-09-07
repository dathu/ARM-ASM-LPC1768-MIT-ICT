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
	LDR R0, =SRC; Load address of SRC into R0
	LDR R1, =DST; Load the address of DST onto R1
	LDR R3, [R0]; Load data pointed by R0 into R3
	STR R3,[R1] ; Store data from R3 into the address pointed by R1
STOP
	B STOP
	
SRC DCD 8,0x123456; SRC location in code segment
	AREA DATASEG, DATA, READWRITE
	
DST DCD 0 ;DST location in Data segment
	
	END