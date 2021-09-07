; GCD of two Numbers
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
	LDR R0, =NUM1	; load the address of first Number in code memory
	LDR R1, =NUM2	; load the address of second Number in code memory	
	LDR R0, [R0]	; R0 = 5
	LDR R1, [R1]	; R1 = 10
UP	CMP R0, R1		; Check for Equlity
	BEQ QT			; If numbers are equal then quit the loop
	SUBHI R0,R1		; Here substraction is executed if HI condition is satisfied i.e, C = 1 and Z = 0 , R0 = R0 - R1
	SUBLO R1,R0		; Here substraction is executed if LO condition is satisfied i.e, C = 0 , R1 = R1 - R0
	B UP			; Jump to up
QT	LDR R2, =GCD	; Load the address to store result in data memory in r2
	STR R0, [R2]	; store the result in memory
	
STOP
	B STOP
	
NUM1 DCD 5
NUM2 DCD 10
	
	AREA DATAWRITE , DATA, READWRITE 
GCD DCD 0,0,0,0,0 
		
	END