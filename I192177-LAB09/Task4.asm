
 include hw.lib
.model small
.stack 100h
.data
	msg1 db "Enter starting char: ",10,13, "$"
	msg2 db "Enter number of chars to print: ", "$"
	var1 db ?
	var2 db ?
.code
start:
main proc 

mov ax, @data
mov ds, ax

	mov ah, 09
	mov dx, offset msg1
	int 21h
	mov ah, 01
	int 21h
	mov var1, al
	
	mov ah, 09
	mov dx, offset msg2
	int 21h
	mov ah, 01
	int 21h

	sub al, 48
	mov bl, 10
	mul bl

	mov var2, al

	mov ah, 01
	int 21h

	sub al, 48

	add var2, al


	Print var1, var2

mov ah, 4ch
int 21h

main endp
end start