	
; EXPLORE YOUSELF	
	
	AREA RESET, DATA, READONLY
	;AREA RESET, DATA, READWRITE
	EXPORT __Vectors
	
__Vectors
	DCD 0x10001000 ; stack pointer value when stack is empty
	DCD Reset_Handler ; reset vector
	
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
	
Reset_Handler
	LDR R1, [R0] ; Load R1 from the address in RO
	LDR	R8, [R3, #4] ; Load R8 from the address in R3 + 4
	LDR	R12, [R13, #-4] ; Load R12 from R13 - 4
	STR R2, [R1, #0x100] ; Store R2 to the address in R1 + Ox100
	
	LDRB R5, [R9] ; Load byte into R5 from R9, (zero top 3 bytes)
	LDRB R3, [R8, #3] ; Load byte to R3 from R8 + 3, (zero top 3 bytes)
	STRB R4, [R10, #0x200] ; Store byte from R4 to R10 + 0x200
	
	LDR R11, [R1, R2] ; Load R11 from the address in R1 + R2
	STRB R10, [R7, -R4] ; Store byte from RIO to addr in R7 - R4
	LDR R11, [R3, R5, LSL #2] ; Load R11 from R3 + (R5 x 4)
	LDR R1, [R0, #4]! ; Load Ri from RO + 4, then RO = RO + 4
	STRB R7, [R6, #-1]! ; Store byte from R7 to R6 - 1, ; then R6 = R6 - 1
	
	LDR R3, [R9], #4 ; Load R3 from R9, then R9 = R9 + 4
	
	STR R2, [R5], #8 ; Store R2 to R5, then R5 = R5 + 8 
	
	LDR R0, [PC, #40] ; Load RO from PC + 0x40 (= address of the LDR instruction + 8 + 0x40)
	
	LDR R0, [R1], R2 ; Load R0 from R1, then R1 = R1 + R2
	
	LDRH R1, [R0] ; Load half word to RI from R0 (zero top 2 bytes)
	LDRH R8, [R3, #2] ;Load half word into R8 from R3 + 2
	LDRH R12, [R13, #-6] ; Load half word into R12 from R13 - 6
	STRH R2, [R1, #0x80] ; Store half word from R2 to R1 + 0x80
	
	LDRH R11, [R1, R2] ; Load half word into R11 from address in RI + R2
	STRH R10, [R7, -R4] ; Store half word from R10 to R7 - R4 
	LDRSH R1, [R0, #2]! ; Load signed half word R1 from RO + 2, ; then R0 = R0 + 2 
	
	LDRSB R7, [R6, #-1]! ; Load signed byte to R7 from R6 - 1, ; then R6 = R6 - 1 
	LDRH R3, [R9], #2 ; Load half word to R3 from R9, then R9 = R9 + 2
	STRH R2, [R5], #8 ; Store half word from R2 to R5, then R5 = R5 + 8
	
	NOP
	END