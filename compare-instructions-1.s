; logical Instructions: TST, TEQ
; Flags are affected , register contents are not updated
; Flags Affected: 'N & Z'
; Used for: verifying the bit status


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
	LDR R0, =0xFFFFFFFF
	LDR R1, =0xFFFFFFFF
	
	CMP R0, R1 ; (R0 - R1) SAME Z = 1
	
	LDR R4, =0X00000000 
	MSR xPSR, R4 ; Clearig all the flags
	
	CMN R0, R1 ; Similar to ADDS thus MSB BIT = 1 => N = 1
	
	MSR xPSR, R4 ; Clearig all the flags
	
	TST R0, R1 ;  Logical AND, as MSB bits are 1 after operation thus N = 1
	
	MSR xPSR, R4 ; Clearig all the flags
	
	TEQ R0, R1 ; Logical EOR, result is zero thus Z = 1

	NOP
	END