; Write a program to add TEN - 32 bit numbers

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
	
	MOV R5, #0X9 ; counter for number addition
	LDR R0, =VALUE1	;pointer to the first value1
	LDR R1,[R0], #0X4		;load the first value into R1 and r1 =r1 + 4, post indexing
ADNUM
	LDR R3, [R0], #0X4		;load  second number into r3
	ADDS R1, R1,R3	;add two numbers and store the result in r1
	ADCS  R7, #0x0 ; accumulating carry in R7
	SUBS R5, #01 ; Reduce the count
	BNE ADNUM
	LDR R2, =RESULT ; Copy the destination Address
	STR R1,[R2], #0X4   ; Store the Sum with out carry
	STR R7, [R2]    ; store the accumilated carry
	
STOP
	B STOP
	
VALUE1 DCD 0X11111111, 0X22222222, 0X33333333, 0X44444444, 0X55555555, 0X66666666, 0X77777777, 0X88888888, 0X99999999, 0XAAAAAAAA


	AREA data, DATA, READWRITE
RESULT DCD 0

	END