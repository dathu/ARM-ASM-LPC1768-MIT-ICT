; ALP to Check given NUM is EVEN or ODD, If Even store OxEEEE in Reg R1 nad if ODD number, Store Ox1111 in Reg R1
	AREA RESET, DATA, READONLY
	EXPORT __Vectors
	
__Vectors
	DCD 0x10001000 ; stack pointer value when stack is empty
	DCD Reset_Handler ; reset vector

NUM DCD 90 ;Initialize the number

	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler

Reset_Handler
	LDR R0, NUM 
	LSRS R0,#1 ; check LSB by Logically Shift Right by 1 time 
	BCS NEXT ;Branch to NEXT if carry is set[LSB=1) 
	MOV R1,#0XEEEE ;If the number is EVEN store OxEEEE in R1
	B stop 
NEXT MOV R1,#0x1111 ; if ODD number, Store Ox1111 in Reg R1 
stop B stop ; Branch to label stop 

	END