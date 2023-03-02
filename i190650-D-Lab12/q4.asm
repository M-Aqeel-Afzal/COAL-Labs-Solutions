
.model small
.stack 100h
.data

fname db 'q4file',0
handle dw 0
msg db 5 dup('0')
buffer db 25 dup('0')
count db 0

.code
start:
main proc

 mov ax,@data
 mov ds,ax

 mov dx,offset msg
 mov ah,3fh
 int 21h

  next:
 ;writing in the  file 
 mov ah,3dh				;command for writing in file
 mov dx,offset fname	;giving the name of file to be opened
 mov al,02h 
 int 21h
 mov handle,ax			;moving address of ax in handle which is a pointer

 mov ah,40h				;command for owriting
 mov bx,handle			;giving the addres to bx
 mov cx,5				;number of character to be stored
 mov dx,offset msg		;msg which is to be stored in file
 int 21h


 ;closing the file
 mov ah,3eh			;command for closing the file
 mov dx,handle		;giving the address to dx using handle pointer
 int 21h

 mov ah,4ch
 int 21h


main endp
end start
