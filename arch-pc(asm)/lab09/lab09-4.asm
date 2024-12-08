%include 'in_out.asm'

SECTION .data
msg: DB 'Введите x: ',0
result: db "f(x) = 7(𝑥 + 1) = ",0

SECTION .bss
x: RESB 80
res: RESB 80

SECTION .text
global _start

_start:
mov eax, msg
call sprint
mov ecx, x
mov edx, 80
call sread
mov eax,x
call atoi
call _calcul 
mov eax,result
call sprint
mov eax,[res]
call iprintLF
call quit

_calcul:
add eax,1
mov ebx,7
mul ebx
mov [res],eax
ret 

