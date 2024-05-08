section .bss
    buffer resb 8 ; buffer to store the input

section .text
global getInt

getInt:
    push ebp
    mov ebp, esp
    mov edi, buffer ; edi points to the buffer
    xor eax, eax ; clear eax
    mov ecx, 8
    rep stosb ; clear the buffer
    mov eax, 3 ; sys_read
    xor ebx, ebx ; stdin
    mov ecx, buffer ; buffer
    mov edx, 8 ; read 8 bytes
    int 0x80
    xor eax, eax ; clear eax
    mov edi, buffer ; edi points to the buffer
    mov ebx, 10
.loop:
    imul eax, ebx ; multiply eax by 10
    xor ecx, ecx ; clear edx
    mov cl, byte [edi] ; move the byte to edx
    sub cl, '0' ; convert the byte to an integer
    add eax, ecx ; add the value to eax
    inc edi ; move to the next byte
    cmp byte [edi], 0x0A ; check if it's a new line
    jne .loop ; if not, repeat
    mov ebx, eax ; move the value to ebx
    mov esp, ebp
    pop ebp
    ret
