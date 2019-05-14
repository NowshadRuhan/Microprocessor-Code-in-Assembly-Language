DATA SEGMENT
    N1 DB ?
    N2 DB ?
    M1 DB ?
    M2 DB ?
    RESULT DB ?
    TXT1 DB 10,13,"ENTER A NUMBER: $"
    TXT2 DB 10,13,"ENTER ANOTHER NUMBER: $" 
    TXT3 DB 10,13,"RESULT IS : $"
ENDS

CODE SEGMENT
    ASSUME DS:DATA CS:CODE
    
    START:
        MOV AX, DATA
        MOV DS, AX
        
        LEA DX, TXT1   ;PRINT A STRING
        MOV AH, 9
        INT 21H    
        
        MOV AH, 1      ;SCAN N1
        INT 21H
        SUB AL, 30H
        MOV N1, AL
        
        MOV AH, 1      ;SCAN N2
        INT 21H
        SUB AL, 30H
        MOV N2, AL
        
        
        LEA DX, TXT2
        MOV AH, 9
        INT 21H
        
        MOV AH, 1      ;SCAN M1
        INT 21H
        SUB AL, 30H
        MOV M1, AL
        
        MOV AH, 1      ;SCAN M2
        INT 21H
        SUB AL, 30H
        MOV M2, AL
        
        ADD AL, N2
        
        MOV AH, 0          ;CLEAR UNWANTED GARBAGE DATA FROM AH
        AAA                ;ASCII ADJUST after ADDITION
        
        MOV BX, AX
        
        
        ADD BL, 30H
        MOV RESULT, BL     ;STORE LAST DIGIT
        
        MOV AL, BH
        ADD AL, N1
        ADD AL, M1
        MOV AH, 0          ;CLEAR UNWANTED GARBAGE DATA FROM AH
        AAA                ;ASCII ADJUST after ADDITION
        
        MOV BX, AX
        ADD BH, 30H
        ADD BL, 30H
        
        
        LEA DX, TXT3
        MOV AH, 9
        INT 21H
        
        
        MOV DL, BH
        MOV AH, 2
        INT 21H
        
        MOV DL, BL
        MOV AH, 2
        INT 21H
        
        MOV DL, RESULT
        MOV AH, 2
        INT 21H
        
        MOV AH, 4CH
        INT 21H
ENDS
END START