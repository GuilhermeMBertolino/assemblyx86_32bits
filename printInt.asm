global printInt

printInt:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8] ; get the integer
    xor ecx, ecx ; length
    inc ecx ; length = 1
    mov ebx, 10 ; divisor
    push 0xA ; push '\n'
.loop:
    xor edx, edx ; remainder
    div ebx ; eax = eax / 10, edx = eax % 10
    add dl, '0' ; convert the remainder to ASCII
    sub esp, 1 ; make room for the character
    mov [esp], dl ; store the character
    inc ecx ; increment the length
    cmp eax, 0 ; check if eax is 0
    jne .loop
.print:
    mov eax, 4 ; sys_write
    mov ebx, 1 ; stdout
    mov edx, ecx ; length
    mov ecx, esp ; pointer to the string
    int 0x80
    add esp, ecx ; restore the stack
    mov esp, ebp
    pop ebp
    ret