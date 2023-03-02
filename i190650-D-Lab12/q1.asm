


.model small
.stack 100h
.data

fname db 'q1file',0
handle dw 0
msg db 'i am Muhammad Aqeel Afzal'
buffer db 38 dup(' ')
count db 34
.code
start:
main proc

 mov ax,@data
 mov ds,ax

 ;writing in the  file 
 mov ah,3dh				;command for reading in file
 mov dx,offset (fname)	;giving the name of file to be opened
 mov al,00h             
 int 21h
 mov handle,ax			;moving address of ax in handle which is a pointer

 mov ah,3fh				;command for owriting
 mov bx,handle			;giving the addres to bx
 mov dx, offset (buffer)  
 mov cx,38
 int 21h

 ;** loop for displaying****
 mov si,offset (buffer)
 Display:
 mov ah,02h
 mov dl,[si]
 int 21h
 inc si
 dec count
 jnz Display


 ;closing the file
 mov ah,3eh			;command for closing the file
 mov dx,handle		;giving the address to dx using handle pointer
 int 21h

 mov ah,4ch
 int 21h


main endp
end start