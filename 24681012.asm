;PRINT THE SERIES
   ;2, 4, 6, 8, 10, 12, 14, 16, 18, ..... , 30
   
   

DATA SEGMENT
    NEWLINE DB 10,13,"$" 
    NUM DB 2 

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
         
        MOV CX, 15
        LOOP1: 
            MOV AX, 00
            MOV AL, NUM
            MOV DL, 10
            DIV DL
            MOV BX, AX
             
             
            CMP NUM, 10     ;IF NUM<10, DO NOT PRINT FIRST DIGIT
            JL SKIP 
             
             
        
            MOV DL, BL      ; PRINT FIRST DIGIT OR RESULT
            ADD DL, 30H
            MOV AH, 2
            INT 21H 
            
            SKIP:                
            MOV DL, BH      ;PRINT LAST DIGIT OR REMINDER
            ADD DL, 30H
            MOV AH, 2
            INT 21H  
            ADD NUM, 2      ; NUM+=2
            
            
            PRINT NEWLINE
        
        LOOP LOOP1
       
        
        MOV AH, 4CH       ; TERMINATING THE PROGRAMME
        INT 21H
ENDS
END START