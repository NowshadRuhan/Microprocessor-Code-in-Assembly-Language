;SCAN A SINGLE DIGIT NUMBER AND CHECK IT IS ODD OR EVEN

DATA SEGMENT
    NEWLINE DB 10,13,"$"  
    MSG1 DB 10,13,"INPUT ANY NUMBER: $" 
    MSG2 DB 10,13,"NUMBER IS ODD$"
    MSG3 DB 10,13,"NUMBER IS EVEN$"

ENDS

PRINT MACRO MSG   ; A FUNCTION TO PRINT STRING
    LEA DX, MSG
    MOV AH, 9     
    INT 21H
ENDM              


CODE SEGMENT
    ASSUME DS:DATA CS:CODE
    
    START:
        
        MOV AX, DATA
        MOV DS, AX
        
        PRINT MSG1
        
        MOV AH, 1      ;SCAN A NUMBER
        INT 21H
        
        MOV AH, 0
        MOV DL, 2
        DIV DL
        
        CMP AH,0
        
        JE EVEN
        
        PRINT MSG2
        JMP DONE:
        
        EVEN:
        PRINT MSG3
        
        
        DONE:
        
        MOV AH, 4CH    ; TERMINATING THE PROGRAMME
        INT 21H
ENDS
END START