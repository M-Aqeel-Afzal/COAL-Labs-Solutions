
inputstring MACRO string
MOV AH,0AH
LEA DX,string
INT 21h
ENDM

outputstring MACRO string
MOV AH,09H
LEA DX,string
INT 21H
ENDM

.model small
.stack 100h
.data
        string1 DB 80,80 DUP('$')
        string2 DB 80,80 DUP('$')
        MSG1 DB 10,13,'Please enter the input :$'
        MSG2 DB 10,13,'Copied input is :$'

.code
main proc
        MOV AX,@DATA
         MOV DS,AX
        
        outputstring MSG1
        inputstring string1
        LEA SI,string1+2
        LEA DI,string2+2
        
        MOV CL,string1+1 ; storing the lenght of the dtring 
        MOV CH,00H
 LAB1:   
       MOV AL,DS:BYTE PTR[SI]
       MOV DS:BYTE PTR[DI],AL
       INC DI
       INC SI     ; loop for the increment in the lenght of the string
       LOOP LAB1
        
       outputstring MSG2
       outputstring string2+2
              
       mov ah,4ch
       INT 21H


main endp
end