	AREA RESET, DATA, READONLY
	EXPORT __Vectors
	
__Vectors
	DCD 0x10001000 ; stack pointer value when stack is empty
	DCD Reset_Handler ; reset vector
	
	ALIGN
	AREA movins, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
	
Reset_Handler
	MOV R1, #0XFA05 ; Write value of OxFA05 to R1, flags are not updated 
	MOV R3, #23 ; Write value of 23 to R3, hex equivalent of 23 will be stored i.e, 0X17
	MOV R8, SP ; Write value of stack pointer to R8 
	
	MOVS R11, #0x000B ; Write value of 0x000B to R11, flags get updated 
	MOVS R10, R12 ; Write value in R12 to R10, flags get updated Observer Zero Flag
	
	;Note: only 'N' & 'Z' Flags are affected 'C, V' flags are not affected 

	MVNS R2, #0xF ; Write value of 0xFFFFFFF0 (bitwise inverse of OxF) to the R2 and update flags.
	
	; Below are used to copy half-word into register
	
	MOVW R7, #0X1234 ; Write 0x1234 to lower halfword of R7, Upper Halfword and APSR are unchanged.
	MOVT R5, #0xF123 ; Write 0xF123 to upper halfword of R5, lower halfword and APSR are unchanged.
	
	; Below are used to move data between register and APSR
	LDR R4, =0XF0000000 
	MSR xPSR, R4 ; Setting NZCV flag to 1 in xPSR
	MRS R9, xPSR ;IN xPSR F1: 1 is used to indicate thumb state; IN APSR we focus on NZCV so R9 has 0XF0000000
	
	;Below are used to move the data between register if certain condition are satisfied
	MOVNE R11,R12 ;content of R12=0x00000000 is not copied to R11 as 'Z' flag is set (required was Z=0)
	MOVEQ R11,R12 ;content of R12=0x00000000 is  copied to R11 as 'Z' flag is set
	
	;Below are used to move the data between register using barrel-shifter operation (Logical or Arithmetic shifts) Without updating xPSR
	LDR R4, =0X00000000 
	MSR xPSR, R4 ; Clearig all the flags
	LDR R1, =0X80000004 ; Value to be shifted is stored in R1
	MOV R0, R1, LSL #1 ; R0 = 0x00000008 (Logical Shift) and in xPSR Flags are not updated.
	
	;Below are used to move the data between register using barrel-shifter operation (Logical or Arithmetic) WITH updating xPSR
	LDR R4, =0X00000000 
	MSR xPSR, R4 ; Clearig all the flags
	LDR R1, =0X80000004 ; Value to be shifted is stored in R1
	MOVS R0, R1, LSL #1 ; R0 = 0x00000008 (Logical Shift) and in xPSR Flags are UPDATED (Carry flag is set).
	
	; try out for LSR, ASR, ROR,RRX instructions with mov,movs
	
	NOP
	END