global btole

btole:
    push ebp
    mov ebp, esp
    mov ebx, [ebp+8] ; get the argument
    push ebx ; save it
    xor eax, eax ; clear the result
    mov ecx, 4 ; loop counter
.loop:
    shl eax, 8 ; shift one byte
    or al, byte [esp+ecx-1] ; or in the next byte
    dec ecx ; decrement the counter
    jnz .loop ; loop until done
    mov esp, ebp
    pop ebp