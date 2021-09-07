; Fibonacci series 10 no: 0, 1, 1, 2, 3, 5, 8, D, 15, 22, 37, 59 HEx Series
	AREA RESET, DATA, READONLY
	EXPORT __Vectors
	
__Vectors
	DCD 0x10001000 ; stack pointer value when stack is empty
	DCD Reset_Handler ; reset vector
	
	ALIGN
	AREA AModes, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
	
Reset_Handler
	LDR R5,=0X50000000 ;Load Memory Address 
	MOV R1, #10 ;number of comparison 
l2 	LDR R2,[R5]   ;Load 1st word to R2 Register loc = 0X50000000
	ADD R6,R5,#04 ;get new Word address
	LDR R3,[R6]   ;Load 2nd Word to R3 Register loc = 0X50000004
	ADD R4,R2,R3  ; r4 <- r2+r3
    
	STR R4,[R6,#4]  ;Store r4 result in next memory location 
	MOV R5,R6       ;change the Address for next word comparison 

	SUBS R1,#01     ;Subtract count by one
	BNE l2       ;Check Z flag if 1 come out of loop else loop2  

	NOP
	END