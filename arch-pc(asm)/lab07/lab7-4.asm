%include 'in_out.asm'
SECTION .data
    msgX:	DB 'Input x: ',0
    msgA:       DB 'Input a: ',0
    msg2 db "Наибольшее число: ",0h
    msg3 db "Наибольшее: ",0h
SECTION .bss
    a:	RESB 80
    x:  RESB 80
    result:     RESB 80

SECTION .text
    GLOBAL _start

_start:

    mov eax,msgX
    call sprint
    mov ecx,x
    mov edx,80
    call sread 
    mov eax,x
    call atoi
    mov [x],eax   


    mov eax,msgA
    call sprint
    mov ecx,a
    mov edx,80
    call sread
    mov eax,a
    call atoi 
    mov [a],eax


    mov edx, [x]
    mov ebx, [a]
    cmp ebx, edx
    jl first
first:
    mov eax, msg2
    call sprint ; Вывод сообщения 'Наибольшее число: '
    mov eax,[a]
    call iprintLF ; Вывод 'max(A,B,C)'
    call quit ; Выход


