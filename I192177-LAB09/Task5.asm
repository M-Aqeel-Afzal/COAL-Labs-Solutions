.model small
.stack 100h
.data
  
  op1  db 1
  op2  db 3
  op3  db 5
  var1 db ?

.code
start:
  mov AX,@data
  mov DS,AX

mov bl,op1
mov cl,op2
mov dl,op3
mov al,var1


 .While bl < cl
      L1:
        cmp bl,dl
        je  L2
        jmp L3
        
        L2:
        mov al,'3'
        jmp L4

        L3:
        mov al,'2'
        jmp L4

        L4:
        inc bl
 .endw        

Exit:
  mov dl,al
  mov ah,02
  int 21h

  mov ah,4ch
  int 21h

end start  