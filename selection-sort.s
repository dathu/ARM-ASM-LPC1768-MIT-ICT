
	AREA RESET, DATA, READONLY
	EXPORT __Vectors
	
__Vectors
	DCD 0x10001000 ; stack pointer value when stack is empty
	DCD Reset_Handler ; reset vector
	
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
	
Reset_Handler
		LDR r0, =SRC  		;r0 is ptr to ith element  
  	  	LDR r1, =N1  	  	  
  	  	LDR r2,[r1]  	  	;r2 stores number of elements 
  	  	LDR r7, =DST  		
  	  	MOV r8,#0  		
UP   		CMP r8,r2  		
  	  	BEQ OUT  		
  	  	ADD r8,#1  		
  	  	LDR r9,[r0],#4  		
  	  	STR r9,[r7],#4  		
  	  	B UP  		
OUT   		LDR r0,=DST  		
  	  	MOV r1, r0   		;r1 is ptr to element to swap  
  	  	MOV r3,r0   		;r3 is ptr to jth element  
  	  	MOV r10,#0   		;r10 is counter for inner(j) loop  
  	  	MOV r11,#0   		;r11 is counter for OUTer(i) loop  
LOOP1   		CMP r11, r2  	  	;comparing i<10  
  	  	BEQ exit   	  	
  	  	ADD r3,r0,#4  		;sets jth ptr to A[i+1]  
  	  	MOV r1,r0   		;sets swap element to A[i]  
  	  	ADD r10,r11,#1 ;j=i+1  		
LOOP2   		CMP r10,r2   	;j<10  
  	  	BEQ abc  	
  	  	ADD r10,#1   	;j++  
  	  	LDR r4,[r3],#4  	
  	  	LDR r5,[r1]  	
  	  	CMP r5,r4  	
  	  	BLT LOOP2  	
  	  	MOV r1,r3  	
  	  	SUB r1,#4  	
  	  	B LOOP2  	
 		ADD r11,#1  	
  	  	LDR r4,[r0]  	
  	  	LDR r5,[r1]  	
  	  	STR r4,[r1]  	
  	  	STR r5,[r0],#4  	
		exit   	B LOOP1  	
			
			
			
stop  B stop  		
  
N1 dcd 0xA  
SRC dcd 0x1,0x2,0x5,0x3
 	  	  	AREA mydata,DATA,READWRITE  
  
DST DCD 0,0,0,0,0  
 	  	  	END  
