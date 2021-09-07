	AREA    RESET, DATA, READONLY
    EXPORT  __Vectors

__Vectors 
	DCD  0x10001000     ; stack pointer value when stack is empty
    DCD  Reset_Handler  ; reset vector
  
    ALIGN

	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
	
Reset_Handler
	mov r1,#0
	mov r8,#10
	ldr r0,= data
	ldr r2,=result
up	ldr r3,[r0],#04
	cmp r3, r1
	bcc loopset
	mov r1,r3
	mov r4,r0
	sub r4, #04
loopset 
	sub r8,#01
	teq r8,#0
	bne up
	str r1,[r2],#04
	str r4,[r2]
here b here
data dcd 0x12345678, 0x1111111, 0xabcd1234, 0x99999999,0xFFFFFFFF, 0x1133333, 0x44444444, 0xeeeeeeee
 area data1 , DATA, readwrite 
result dcd 0
	
	END