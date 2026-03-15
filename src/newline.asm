extern print_char
global newline

SECTION .text

newline:

    push ebp
    mov ebp, esp
    mov al, 10 ; ASCII para una nueva línea

    mov esp, ebp
    pop ebp
    ret
