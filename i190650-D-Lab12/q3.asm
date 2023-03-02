


.model small
.stack 100h
.data

fname db 'q3file',0
handle dw 0
msg db 'my name is muhammad Aqeel Afzal'
msg1 db '         Section D'
buffer db 25 dup(' ')

.code
start:
main proc

 mov ax,@data
 mov ds,ax

 ;writing in the  file 
 mov ah,3dh				;command for writing in file
 mov dx,offset fname	;giving the name of file to be opened
 mov al,01h 
 int 21h
 mov handle,ax			;moving address of ax in handle which is a pointer

 mov ah,40h				;command for writing
 mov bx,handle			;giving the addres to bx
 mov cx,38				;number of character to be stored
 mov dx,offset msg		;msg which is to be stored in file
 int 21h

 mov ah,40h				;command for writing
 mov bx,handle			;giving the addres to bx
 mov cx,18				;number of character to be stored
 mov dx,offset msg1		;msg which is to be stored in file
 int 21h


 ;closing the file
 mov ah,3eh			;command for closing the file
 mov dx,handle		;giving the address to dx using handle pointer
 int 21h

 mov ah,4ch
 int 21h


main endp
end start

