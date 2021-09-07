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
	; ------------------- Initializations ---------------------------------------
	
	LDR R0, =0X10000000 ; memort location in RAM pointed by R0 (immediate value)
	
	; ------------------- REGISTER INDIRECT ADDRESSING MODE -----------------------
	
	LDR R1, =0X12345678 ; values to be stored in memory
	STR R1, [R0] ; REGISTER INDIRECT ADRESSING MODE
	
	; ARM follows little endian format so LSB byte is stored @ lower memory location (0X10000000) 
	; followed by MSB @ higher memory location (0X10000003).
	; Note: processor ALU can process 32 bit data but each memory location can store only 8 bit data
	
	; ------------------- PREINDEXING ADDRESSING MODE -----------------------------
	LDR R2, =0X19ABCDEF ; values to be stored in memory
	STR R2, [R0, #4] ; PREINDEXING addressing mode, 
	;observer the value in memory loc & content of R0 after exection of this instruction (R0 content is not changed)
	
	; ------------------- PREINDEXING ADDRESSING MODE with WRITE BACK-----------------------------
	LDR R3, =0XAABBCCDD ; values to be stored in memory
	STR R3, [R0, #8]! ; PREINDEXING addressing mode with WRITE BACK
	;observer the value in memory loc & content of R0 after exection of this instruction (R0 content is UPDATED)
	 
	LDR R4, [R0, #-4] ; PREINDEXING addressing mode -ve index (R0 content is not changed)
	
	LDR R5, [R0, #-8]! ; PREINDEXING addressing mode -ve index with WRITE BACK(R0 content is UPDATED)
	
	
	; ------------------- POST INDEXING ADDRESSING MODE -----------------------------
	LDR R6,[R0], #4 ; POST INDEXING, 
	;1-> fetch the data from memory location pointed by R0 and store it in R6
	;2-> UPDTAE the content of R0 to point it to new memory location
	
	NOP
	END