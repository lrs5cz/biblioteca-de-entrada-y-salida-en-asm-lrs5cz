SECTION .bss
char_buffer resb 1

SECTION .text
global scan_char

; ---------------------------------
; scan_char
; Salida:
;   AL = caracter leído
; ---------------------------------

scan_char:

    push ebp
    mov ebp, esp

    mov eax, 3 ; sys_read
    mov ebx, 0 ; stdin (Recibe el caracter desde el teclado)
    mov ecx, char_buffer ; Dirección de memoria del caracter leído
    mov edx, 1 ; Leer exactamente 1 byte (Tamaño de char)
    int 0x80 ; Llamada al kernel
    mov al, [char_buffer] ; Almacenamos el caracter leído en AL

    mov esp, ebp
    pop ebp
    ret
