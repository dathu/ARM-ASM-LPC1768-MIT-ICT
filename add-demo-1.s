; Program to perform Addition ==> ADD -> Rd = Rn + Rm ;  

;rn = 0xFFFFFFFF ==> 1111 1111 1111 1111 1111 1111 1111 1111
;RM = 0X00110011 ==> 0000 0000 0001 0001 0000 0000 0001 0001
;-------------------------------------------------------------
;RD = 0X00110010 ==> 0000 0000 0001 0001 0000 0000 0001 0000   C=1
;-------------------------------------------------------------

;  ADC -> Rd = Rn + Rm + Cy
;rn = 0xFFFFFFFF ==> 1111 1111 1111 1111 1111 1111 1111 1111
;RM = 0X00110011 ==> 0000 0000 0001 0001 0000 0000 0001 0001
;C =1                                                      1
;-------------------------------------------------------------
;RD = 0X001100101==> 0000 0000 0001 0001 0000 0000 0001 0001   C=1
;-------------------------------------------------------------

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

	MOV R0, #0X1234
	MOV R1, #0X1111
	ADD R2, R0, R1 ;
	CMP R0, R1
	ADC R4, R0, R1
	ADC R5, R0, #0X11

	NOP
	END