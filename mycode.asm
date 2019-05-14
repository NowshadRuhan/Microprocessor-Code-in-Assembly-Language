DATA SEGMENT
    NUM1 DB 2H
    NUM2 DB 6H
    RESULT DB ? 
    
ENDS       

CODE SEGMENT  
    ASSUME DS:DATA CS:CODE

START:
        MOV AX,DATA
        MOV DS,AX
        
        MOV AL,NUM1
        ADD AL,NUM2
        
        ADD AL,48D
        
        MOV RESULT,AL
        
        MOV DL,RESULT
        MOV AH,2
        INT 21H
        
        MOV AH,4CH
        INT 21H
        
ENDS
END START
 


