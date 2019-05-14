DATA SEGMENT
    NUM1 DB '1' 
    
    MSG1 DB 10,13,"$"
    
    DATA ENDS

DISPLAY MACRO MSG
    
    MOV AH,9
    LEA DX,MSG
    INT 21H
ENDM

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA

START:
        MOV AX,DATA
        MOV DS,AX 
        
        
        MOV CX,9
        MOV DL,NUM1
        MOV AH,2     
L1:  
        INT 21H
        ADD DL,1
        
        LOOP L1 
  
       
        MOV AH,4CH
        INT 21H
        
ENDS
END START