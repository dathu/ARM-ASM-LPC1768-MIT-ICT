;ALP to covert N digit Hex Number to ASCII Code

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
	LDR R0,=SRC ; Get the memory loc of Hex Digit source
	LDR R5, [R0] ; Copy the value from memory to R5, i.e 
	MOV R1,#0x08 ; N = 8 number of HEX digits
	LDR R6, =DST ; Load R6 with Address of Destination location 
UP	AND R2,R5,#0x0F ; Masking to get only LSB byte in case of multidigit number
	CMP R2,#09 ; Affects the carry flag if no>9 c = 1 else C = 0
	BLO DOWN ; No < 9, add only 30
	ADD R2,#07 ; No > 9, add 7 + 30
DOWN
	ADD R2,#0x30
	STRB R2, [R6], #01 ; Store the result in Memory pointed by R1
	ROR R5, #4  ; Rotate the Number to process the next digit
	SUBS R1, #01 ; decrement the count by 1 and check for zero condition
	BNE UP ; if Z = 0 repeat the process else exit
	
	NOP
SRC dcd 0x1234AB3D ;

	AREA ASCII, DATA, READWRITE 
DST DCD 0

	END 