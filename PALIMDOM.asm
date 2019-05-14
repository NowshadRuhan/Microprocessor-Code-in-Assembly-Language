DATA SEGMENT
    STR1 DB "NON$"
    STR2 DB 4 DUP('$')
    MSG1 DB 10,13, 'STRING IS PALIMDOM $'
    MSG2 DB 10,13, 'STRING IS NOT PALIMDOM $'
    
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
        
        MOV BL,0
        
        LEA SI,STR1
        LEA DI,STR1
        
        ADD DI,2
        
        MOV CX,3
        
CHECK:
        MOV AL,[SI]
        MOV BL,[DI]
         
        CMP AL,BL
        JNE NO
        
        INC SI
        DEC DI
        LOOP CHECK 
        
        
        DISPLAY MSG1
        JMP EXIT
        
        
NO:  
        DISPLAY MSG2
            
        
EXIT:        
        MOV AH,4CH
        INT 21H
        
ENDS
END START