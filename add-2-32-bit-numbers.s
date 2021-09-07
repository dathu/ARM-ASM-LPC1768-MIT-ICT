; Write a program to add two 32 bit numbers

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

	LDR R0, =VALUE1	;pointer to the first value1
	LDR R1,[R0]		;load the first value into R1
	LDR R0,=VALUE2	;pointer to the second value
	LDR R3, [R0]		;load  second number into r3
	ADDS R6, R1,R3	;add two numbers and store the result in r6
	LDR R2, =RESULT 
	STR R6,[R2]   ; ; CY IS NOT STORED IN MEMORY
	
STOP
	B STOP
	
VALUE1 DCD 0XFFFFFFFF
;VALUE1 DCD 0X12345678	; First 32 bit number TRY = 0XFFFFFFFF
VALUE2 DCD 0XABCDEF12	; Second 32 bit number 

	AREA data, DATA, READWRITE
RESULT DCD 0

	END
