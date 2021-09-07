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
	
	MOV R0, #-4
	mov r1,# 3
	mov r2,#-3
	mov r3, # -1
	MOVT r4,#0x50
	MOVW R5,#0X00005678
	SMULL R6,R7,R0,R1
	
	smlal r2,r3,r0,r1
    mvn r2,r2
    add r2,r2,#1
up rrx r2,r2
	tst r2,#1
	add r3,r3,#1
	bne up
	end