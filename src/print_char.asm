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
    push eax ; Empujamos eax para que el caracter se encuentre en memoria
    mov eax, 4 ; syscall: sys_write
    mov ebx, 1 ; file descriptor: stdout
    mov ecx, esp ; Puntero al caracter
    mov edx, 1 ; Longitud: 1 byte
    int 0x80 ; Llamada al kerneñ 
    mov esp, ebp
    pop ebp
    ret
