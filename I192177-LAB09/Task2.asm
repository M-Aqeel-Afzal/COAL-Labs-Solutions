.model small
.stack 100h
.DATA
	var1 db 5
	var2 db 7
	msg1 db 'Variable2 is big and is placed in AX',10,13,'$'
	msg2 db 'Variable1 is big and is placed in AX',10,13,'$'
.CODE
start:
check macro num1,num2,txt1,txt2
  mov bl,num1
  mov cl,num2

  .while bl<cl
   mov al,cl
   mov dx,offset txt1
   mov ah,09h
   int 21h
   mov bl,0
   mov cl,0
  .endw
  .while bl>cl
   mov dx,offset txt2
   mov ah,09h
   int 21h
   mov al,bl
   mov bl,0
  .endw
endm
main proc
	mov ax,@data
	mov ds,ax
	check var1,var2,msg1,msg2
	mov ah,4ch
	int 21h
main endp
end start
