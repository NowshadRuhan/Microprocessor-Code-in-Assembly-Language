;SCAN A STRING AND PRINT IT'S LENGTH

DATA SEGMENT
    NEWLINE DB 10,13,"$"  
    MSG1 DB 10,13,"LENGTH: $" 
    MSG2 DB 10,13,"INPUT STRING IS: $"
    
    SCAN LABEL BYTE
    MAX_LEN DB 0FFH
    LEN DB ?
    STR DB 0FFH DUP('$')

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
        
        LEA DX, SCAN	 	
        MOV AH, 0AH	      ;SCANNING THE STRING
        INT 21H
         
        PRINT NEWLINE
        PRINT MSG1 
        
        MOV DL, LEN
        ADD DL, 30H
        MOV AH, 2         ;PRINT THE LENGTH
        INT 21H
        
        PRINT MSG2
        PRINT STR         ;PRINT THE STRING
        
        
        MOV AH, 4CH       ; TERMINATING THE PROGRAMME
        INT 21H
ENDS
END START

