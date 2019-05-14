DATA SEGMENT
    COUNT DB 0H
    MSG1 DB '*$'
    NEW DB 10,13,'$'
ENDS

PRINT MACRO MSG
   
    LEA DX,MSG
    MOV AH,9
    INT 21H
ENDM

CODE SEGMENT
    ASSUME DS:DATA CS:CODE
    
START:

        MOV AX,DATA
        MOV DS,AX 
        
        
        MOV CX,5
        LOOP1:
              MOV BL,6
              SUB BL,CL
              MOV COUNT,0
               
             LOOP2:
                   
                  PRINT MSG1
                  INC COUNT
                  
                  CMP BL,COUNT
                  JG LOOP2
                  
                  PRINT NEW
                  
              LOOP LOOP1
        
        MOV AH,4CH
        INT 21H
        
ENDS
END START
                  
                      
             
