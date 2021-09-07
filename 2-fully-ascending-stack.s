;Fully Ascending stack

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
	

;Assume an error free program is executed. Fill up the blanks with appropriate values.         
	ldr r13,=0x10001000
	ldr r0,=0x12345678
	ldr r1,=0x87654321
	ldr r2,=0x45678ab9
	ldr r3,=0x9ba87654
	
	push {r0,r1,r2}
	stm r13, {r0,r3,r2}
	pop {r3}
	pop{r1}
	pop{r2}
	stmdb r13!,{r2,r3}
	pop{r0,r1}

stop b stop

	end