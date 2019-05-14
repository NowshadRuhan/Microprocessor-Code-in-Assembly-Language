DATA SEGMENT
    NUM DB 1
    TEN DB 10
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
        
        
        MOV CX,49
             
L1:     
        MOV AX,00
        
        MOV AL,NUM
        DIV TEN     
        
        
        MOV BX,AX
        MOV DL,BL
        ADD DL,30H
        MOV AH,2
        INT 21H 
                 
        MOV DL,BH         
        ADD DL,30H
        MOV AH,2
        INT 21H
        
        ADD NUM,2 
        
        DISPLAY MSG1
        
        
        LOOP L1 
  
       
        MOV AH,4CH
        INT 21H
        
ENDS
END START