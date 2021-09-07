;Example to demonstarte Branch Instruction ==> 'B' with condition
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
		MOV R1, #0X2 	; Moving Value 1
		MOV R2, #0X4 	; Moving Value 2
		MOV R3, #0X02 	;Moving count value
		
LOOP	ADD R0, R1, R2  ; operation 1
		SUB R3, #0X01 	; operation 2
		CMP R3, #0X00	; affecting the status of flag==> 1st time not equal so z = 0 and 2nd time equal so z = 1
		BNE LOOP
	
	NOP
	END