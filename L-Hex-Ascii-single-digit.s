;ALP to covert Hex Number to ASCII Code Single digit

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
	LDR R0, =src ; Get the memory loc of Hex Digit source
	LDR R5, [R0] ; Copy the value from memory to R5, i.e 0x1 or 0xE
	LDR R1, =DST ; Load R1 with Address of Destination location 
	AND R2,R5,#0x0F ; Masking to get only LSB byte in case of multidigit number
	CMP R2,#09 ; Affects the carry flag if no>9 c = 1 else C = 0
	BLO DOWN ; No < 9, add only 30
	ADD R2,#07 ; No > 9, add 7 + 30
DOWN
	ADD R2,#0x30
	STRB R2, [R1], #01 ; Store the result in Memory pointed by R1
	
	NOP
src dcd 0xA ; 0xA

	AREA ASCII, DATA, READWRITE 
DST DCD 0

	END 