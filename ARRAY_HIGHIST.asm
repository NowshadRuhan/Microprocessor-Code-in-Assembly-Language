DATA SEGMENT
    ARRAY DB 4,6,2,5,8,9,1,6,7
    MSG DB "THE HIGHIST VALUE IN ARRAY IS = $"
ENDS
CODE SEGMENT
    ASSUME DS:DATA CS:CODE
    
START:
        MOV AX,DATA
        MOV DS,AX
        
        LEA SI,ARRAY
        
        LEA DX,MSG
        MOV AH,9
        INT 21H
        
        MOV AX,00
                 
        MOV BL,0
                 
        MOV CX,9 
        LOOP1:
               
               MOV AL,ARRAY[SI]
                    
               INC SI
               CMP SI,9
               JG EXIT
               
               CMP AL,BL
               JG LAVEL1
               
        LOOP LOOP1
               
        LAVEL1:
               
                MOV BL,AL
                    
                CMP SI,9
                JL LOOP1
                        
        
        EXIT: 
                ADD BL,30H 
                MOV DL,BL
                MOV AH,2
                INT 21H            
                    
        
        MOV AH,4CH
        INT 21H
        
ENDS
END START
                        
                        
                    


