.model small
.stack
.data
key byte 1                                    ;key which is to be checked
array byte 3,5,9,10,99,4,1,3,150,8            ;array
sum byte 0
.code
START:
MOV AX, @DATA
MOV DS,AX
mov al,0
mov di,offset array
mov cx,10
mov al,0


l1:                                     ; loop for summing of array
add bh,[di]
add di,type array
loop l1



mov si,offset array
mov di,offset array
mov cx,10


l2:                                    ;loop for finding index which is required
add al,1
mov dh,[si]
add si,type array
cmp dh,key
je l3                                   ;if key is founded it will jump
add di,type array
loop l2
mov dh,key                             ;these instruction will execute when key is not founed and insert key at end of the array
mov [di],dh
jmp l4

l3:
mov sum,al
mov array,bh
mov [di],bh

l4:
mov ah,04ch
int 21h
end START