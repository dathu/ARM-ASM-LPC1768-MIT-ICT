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
	; Content of R0, R1 are say Unsigned Number for this Usecase
	LDR R0, =0X30000000 
	LDR R1, =0X8F000000 ; or -71000000 (2's complement)
	;-------------------
	;2's com of 0X8F000000 is 0x71000000
	; Now Add with R0 = 0X30000000 
	; 0X30000000 
	; 0X71000000
	;---------------------
	; 0XA1000000
	;---------------------
	CMP R0, R1 ; R0 - R1 
	
	
	
	;Flags Affected 
	;N = 1 ==> 31 st bit is '1'
	;Z = 0 ==> Result of Substraction is not Zero
	;C = 0 ==> (Smaller Number - Bigger Number) No carry Set 
	;V = 1 ==> +ve no + +ve no (due to 2's complement) = -ve result ;  -ve no + -ve no = +ve result
	;V = 1 ==> As MSB bit is 1 (Most of the time this flag deals with signed Operation)
	
	;Condition Instructions: CS -> SAME,  HS -> HIGHER ; Generally used with Unsigned numbers
	;BCS UP ; Branch on Same i.e, R0 = R1 but for this case C = 0 does'nt branch to 'UP' Label
	
	;GE = Greater or Equal (N = V) ; Generally used with Signed numbers
	BGE UP ; As (N = V) Branches to 'UP' Label
	NOP ; her eit can be any other instructions, for sake of demo I am usig NOP
	NOP
	
UP  ADD R2, R0, R1

	NOP
	END