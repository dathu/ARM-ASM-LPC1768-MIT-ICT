;ALP to covert  ASCII to Hex Number - Single digit

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
	LDRB R0, [R1] ; Read ASCII Number from the memory. 
	CMP R0, #0X3A ; Cheek if ASCII number > 3A(06) 
	BLT NEXT ; branch to NEXT if RO<Ox1A 
	SUB R0, R0, #0x30 ; if ASCII number >3A subtract 7. Otherwise skip this instruction.
NEXT 
	SUB R0, R0, #0X30 ; Subtract 30 and store the ASCII number in R0. 
	LDR R3, =DST   ;Copy the address where she hexadecimal value should be stored. 
	STRB R0, [R3]     ; Store the result in the memory. 

	NOP
	
	AREA ASCII, DATA, READWRITE 
DST DCD 0

	END 