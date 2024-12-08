%include 'in_out.asm'

SECTION .data
msg1 db "f(x) = 7(𝑥 + 1) ",0
msg db "Результат: ",0

SECTION .text
global _start

_start:
mov eax,msg1
call sprintLF

pop ecx 
pop edx
sub ecx,1
mov esi,0

next:
cmp ecx, 0 
jz _end 
pop eax 
call atoi
add eax,1
mov ebx,7
mul ebx
add esi,eax
loop next 

_end:
mov eax, msg 
call sprint
mov eax, esi 
call iprintLF
call quit 
