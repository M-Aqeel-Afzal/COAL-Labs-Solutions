

.model medium
.stack 100h

Employee struct
  Id   	db 5  dup	('$')
  N  db 10 dup	('$')
  Salary   db 12 dup  ('$')
  House_No db 10 dup  ('$')
  City   	db 10 dup 	('$')
  Pin_Code db 10 dup  ('$')
Employee ends

.data

  obj Employee <>
  msg1 db 'Enter Employ ID:$'
  msg2 db 'Enter Employee Name:$'
  msg3 db 'Enter Employee Salary:$'
  msg4 db 'Enter Employee House_No:$'
  msg5 db 'Enter Employee City:$'
  msg6 db 'Enter Employee Pin_Code:$'
  cda db 10,13,'$'

.code
start:
main proc
	mov AX,@data
	mov DS,AX

    mov dx,offset cda
    mov ah,9h
    int 21h

    ;Taking input of Employee ID
    mov dx,offset msg1
    mov ah,9h
    int 21h

    mov ah,3Fh
    int 21h
    mov obj.ID,Ah

    ;Taking input of Employee Name
    mov dx,offset msg2
    mov ah,9h
    int 21h

    mov ah,3Fh
    int 21h
    mov obj.N,Ah

    ;Taking input of Employee Salary
    mov dx,offset msg3
    mov ah,9h
    int 21h

    mov ah,3Fh
    int 21h
    mov obj.Salary,AH

    ;Taking input of Employee House_No
    mov dx,offset msg4
    mov ah,9h
    int 21h

    mov ah,3Fh
    int 21h
    mov obj.House_No,Ah

    ;Taking input of Employee City
    mov dx,offset msg5
    mov ah,9h
    int 21h

    mov ah,3Fh
    int 21h
    mov obj.City,Ah

    ;Taking input of Employee Pin_Code
    mov dx,offset msg6
    mov ah,9h
    int 21h

    mov ah,3Fh
    int 21h
    mov obj.Pin_Code,AH



	mov ah,4ch
	int 21h
main endp
end start
