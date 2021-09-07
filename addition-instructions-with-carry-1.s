; Addition Instructions with Carry

	AREA    RESET, DATA, READONLY
    EXPORT  __Vectors

__Vectors 
	DCD  0x100000FF     ; stack pointer value when stack is empty
    DCD  Reset_Handler  ; reset vector
  
    ALIGN

	AREA mycode, CODE, READONLY
	EXPORT Reset_Handler
	ENTRY
Reset_Handler

	LDR R0, =0XFFFFFFFF
	LDR R2, =0X00110011
	
	; Below are used to move data between register and APSR
	LDR R4, =0X20000000 ; need to set 29th bit of xPSR to 1
	MSR xPSR, R4 ; Setting NZCV flag to 1 in xPSR

	ADC R1, R0, R2 ; R1 = 00110011
	ADC R3, R2, #36 ; (36)10 = (24)16; R3 = 0x00110036
	
	;--------------------------------------
	
	LDR R4, =0XFFFFFFFF
	LDR R5, =0X00110011
	
	ADC R4, R5
	ADC R5, #36
	
	;--------------------------------------
	
	LDR R8, =0XFFFFFFFF
	LDR R9, =0XF0110011
	ADCS R10, R8, R9 ; N = 1 , V = 0 AS -VE -VE addition yeild -VE result only
	
	LDR R8, =0X7FFFFFFF
	LDR R9, =0X70110011
	ADCS R10, R8, R9; N = 1 , V = 1 AS +VE +VE addition yeild -VE result 
	;so ween need to take 2's complement for proper result only in case of signed operation
	
	NOP
	END
	