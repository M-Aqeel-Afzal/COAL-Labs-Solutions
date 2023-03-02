

include hw.lib
.model small
.stack
.data
.code
main proc

mov ax,@data
mov ds,ax

Chars_Print 'A',26


mov ah,4ch
int 21h

main endp
end
end