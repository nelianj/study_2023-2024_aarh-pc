%include 'in_out.asm'

SECTION .data
msg: db 'Как Вас зовут? ', 0
filename: db 'name.txt', 0
msg1: db 'Меня зовут '
thelength: equ $-msg1

section .bss
name: resb 64

section .text
global _start

_start:
mov eax, msg
call sprint

mov ecx, name
mov edx,64
call sread

mov ecx, 0777o
mov ebx, filename
mov eax, 8
int 80h

mov ecx, 2
mov ebx, filename
mov eax, 5
int 80h

mov eax, 4
mov ebx,eax
mov ecx, msg1
mov edx, 22
int 80h

mov eax,4
mov ebx,eax
mov ecx,name
mov edx, 64
int 80h


mov ebx, esi
mov eax, 6
int 80h
call quit
