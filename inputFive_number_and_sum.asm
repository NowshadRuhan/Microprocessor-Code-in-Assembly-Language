;READ FIVE NUMBERS AND PRINT THEIR SUM

DATA SEGMENT
    NEWLINE DB 10,13,"$"  

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
        
        MOV BL, 0
        
        
        MOV CX, 5
        INPUT:               ; TAKING INPUT FIVE NUMBERS
            MOV AH, 1 
            INT 21H
            
            SUB AL, 30H      ; ASCII TO BCD (ORIGINAL VALUE)
            ADD BL, AL 
            
            PRINT NEWLINE
            
        LOOP INPUT
        
       
       
       ;SPLITING FIRST DIGIT AND LAST DIGIT
        MOV AX, 00
        MOV DL, 10
        MOV AL, BL
        DIV DL
        
        MOV BX, AX       
        ADD BL, 30H
        ADD BH, 30H
        
        
        MOV DL, BL        ; PRINTING FIRST DIGIT
        MOV AH, 2
        INT 21H
               
        MOV DL, BH        ; PRINTING LAST DIGIT
        MOV AH, 2
        INT 21H
        
        MOV AH, 4CH       ; TERMINATING THE PROGRAMME
        INT 21H
ENDS
END START