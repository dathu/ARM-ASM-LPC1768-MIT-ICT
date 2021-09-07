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
	MOV R0, #0X01 
	PUSH {R0}     	; 1000 0FFC
	MOV R1, #0X02
	PUSH {R1}		; 1000 0FF8
	MOV R2, #0X03
	PUSH {R2}		; 1000 0FF4
	MOV R3, #0X04
	PUSH {R4}		; 1000 0FF0
	MOV R4, #0X05
	PUSH {R4}		; 1000 0FEC and
	
	;PUSH {R0, R1, R2, R3, R4}
	POP {R6, R7}

	NOP
	END