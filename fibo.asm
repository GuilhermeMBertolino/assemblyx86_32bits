extern printInt
extern getInt

section .data
    num db 0 ; buffer for input
    numlen db 1 ; length of input

global _start

_start:
    push ebp
    mov ebp, esp
    call getInt
    push ebx
    call fibo
    push ebx
    call printInt
    mov esp, ebp
    pop ebp
    mov eax, 1
    xor ebx, ebx
    int 0x80
fibo:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8] ; n
    mov ebx, 0 ; fib(0)
    mov ecx, 1 ; fib(1)
.loop:
    cmp eax, 1
    jle .end
    dec eax
    push ecx
    add ecx, ebx ; ecx = ecx + ebx
    pop ebx ; ebx = ecx - ebx
    jmp .loop
.end:
    mov esp, ebp
    pop ebp
    ret