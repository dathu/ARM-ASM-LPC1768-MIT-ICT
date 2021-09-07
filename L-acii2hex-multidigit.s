;ALP to covert 2N ASCII to N Hex Number NO WORKING

	AREA    RESET, DATA, READONLY
    EXPORT  __Vectors

__Vectors 
	DCD  0x40001000     ; stack pointer value when stack is empty
    DCD  Reset_Handler  ; reset vector
  
    ALIGN

	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
	
Reset_Handler
	LDR R1, =0X40000200 ; Get the memory location of ASCII input  enter 36 in memory
	LDR R0, [R1] ; Read ASCII Number from the memory. 
	MOV R10,#0x08 ; N = 8 number of HEX ASCII digits
	LDR R3, =DST   ;Copy the address where she hexadecimal value should be stored. 
UP	AND R2,R0,#0x0F ; Masking to get only LSB byte in case of multidigit number
	CMP R2, #0X3A ; Cheek if ASCII number > 3A(06) 
	BLT NEXT ; branch to NEXT if RO<Ox1A 
	SUB R2, R2, #0x30 ; if ASCII number >3A subtract 7. Otherwise skip this instruction.
NEXT 
	SUB R2, R2, #0X30 ; Subtract 30 and store the ASCII number in R0. 
	STRB R2, [R10], #01 ; Store the result in Memory pointed by R10
	ROR R0, #4  ; Rotate the Number to process the next digit
	SUBS R10, #01 ; decrement the count by 1 and check for zero condition
	BNE UP ; if Z = 0 repeat the process else exit
	NOP
	
	AREA ASCII, DATA, READWRITE 
DST DCD 0

	END 