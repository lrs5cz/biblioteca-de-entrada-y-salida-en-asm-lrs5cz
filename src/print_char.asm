SECTION .text
global print_char

; ---------------------------------
; print_char
; Entrada:
;   AL = caracter a imprimir
; ---------------------------------

print_char:

    push ebp
    mov ebp, esp
    push eax ; Empujamos eax para disponer de AL en la memoria
    mov eax, 4 ; sys_write
    mov ebx, 1 ; stdout
    mov ecx, esp ; Puntero al caracter en el tope de la pila
    mov edx, 1 ; Tamaño del caracter (1 byte)
    int 0x80 ; Llamada al kernel
    mov esp, ebp
    pop ebp
    ret
