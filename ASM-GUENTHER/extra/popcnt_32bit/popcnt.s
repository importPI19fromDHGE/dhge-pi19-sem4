    .intel_syntax noprefix
    .text
    .globl popcnt
popcnt:
    push ebp
    mov ebp, esp
    
    popcnt eax,[ebp+8]
    
    mov esp, ebp
    pop ebp
    ret