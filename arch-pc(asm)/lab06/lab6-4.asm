%include 'in_out.asm'
SECTION .data
msg: DB 'Введите значение х: ',0
div:DB 'Результат: ',0
rem:DB 'Остаток от деления: ',0
SECTION .bss
x: RESB 80
SECTION .text
GLOBAL _start
_start:
mov eax, msg
call sprintLF
mov ecx, x
mov edx, 80
call sread
mov eax,x ; вызов подпрограммы преобразования
call atoi ; ASCII кода в число, `eax=x`
xor edx,edx ; обнуляем EDX для корректной работы div
mov ebx,2 ; EBX=2
div ebx   ; eax=eax/2
add eax,8 ; EAX=EAX+8
mov ebx,3 ; EBX=3
mul ebx ; EAX=EAX*EBX
mov edi,eax ; запись результата вычисления в 'edi'
mov eax,div ; вызов подпрограммы печати
call sprint ; сообщения 'Результат: '
mov eax,edi ; вызов подпрограммы печати значения
call iprintLF ; из 'edi' в виде символов
mov eax,rem ; вызов подпрограммы печати
call sprint ; сообщения 'Остаток от деления: '
mov eax,edx ; вызов подпрограммы печати значения
call iprintLF ; из 'edx' (остаток) в виде символов
call quit ; вызов подпрограммы завершения
