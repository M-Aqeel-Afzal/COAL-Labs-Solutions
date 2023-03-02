
.model small
.stack 100h

time struct
	minutes db 5 DUP('$')
	hours db 5 DUP('$')
	seconds db 5 DUP('$')
time ends
.data

obj time<>
msg1 db 'Enter Hours:','$'
msg2 db 'Enter Minutes:','$'
msg3 db 'Enter Seconds:','$'
msg4 db ':$'

.code

print macro a
	mov dx,offset a
	mov ah,09h
	int 21h
endm

main proc
	mov ax,@data
	mov ds,ax

print msg1

mov ah,3fh
int 21h
mov obj.hours,ah


print msg2

mov ah,3fh
int 21h
mov obj.minutes,ah


print msg3

mov ah,3fh
int 21h
mov obj.seconds,ah


print obj.hours
print msg4
print obj.minutes
print msg4
print obj.seconds


mov ah,4ch
int 21h

main endp
end main

