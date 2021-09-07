; Program to perform 

	AREA RESET, DATA, READONLY
	EXPORT __Vectors
	
__Vectors
	DCD 0x10001000 ; stack pointer value when stack is empty
	DCD Reset_Handler ; reset vector
	
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler

Sourloc DCD 1,2,3,4,5
Reset_Handler	

	LDR R0,=SRC ; Load RO with Address of Source location 
	LDR R1,=DST ; Load R1 with Address of Destination location 
	MOV R2,#5 ; Load R2 with number of datas to be transfer 
	
REPEAT 
	LDR R3,[R0],#4 ; R3=[R0] and R0=R0+4,Load R3 with first data and R0 is incremented Post Indexing
	STR R3,[R1],#4 ; R3 -> [R1] store it in address present in R1 and increment R1 
	SUBS R2,R2,#1 ;R2=R2-1 
	BNE REPEAT ;branch to label REPEAT if Z flag Not Equal to 1 
	
STOP
	B STOP
	
SRC DCD 1,2,3,4,5
	
	AREA DATAWRITE , DATA, READWRITE 
DST DCD 0,0,0,0,0 
		
	END