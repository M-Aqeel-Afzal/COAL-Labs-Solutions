.model small
.stack
.data
var1 byte 6
Array byte 1,2,2,0,2,2
index byte ?
.code
START:
MOV AX, @DATA
MOV DS,AX
MOV Cl,0
MOV Dl, 0                    ;di will give us the index of most repeating element
MOV SI,OFFSET Array

L1:
cmp cl,6
je Exit
mov bh,1
mov bl, cl
add bl,1
mov DI,SI
add DI,2
JMP L2

JMP L1

L2:
cmp bl, 6
je L3
mov ch, [DI]
cmp ch,[SI]
je L7
jne L8
L8:
add bl,1
add DI,2
JMP L2

L7:
add bh,1
JMP L8

L3:
cmp bh,dl
JG L4
JNG L5


L4:
mov bp,SI
mov dl, bh
JMP L5

L5:
add SI,2
add cl,1
JMP L1





Exit:
;mov di,offset Array
;mov di,dl
;mov bh,[di]

mov ah,04ch
int 21h
end START