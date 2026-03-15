%include "../include/io.inc"

global _start

SECTION .data

msg_int db "Ingrese un numero:", 10,0
msg_char db "Ingrese un caracter:", 10,0
msg_str db "Ingrese una cadena:", 10,0
msg_result db "Resultados:", 10,0

SECTION .bss
buffer resb 64

SECTION .text

_start:

    ; -------------------------
    ; pedir entero
    ; -------------------------

    mov eax, msg_int
    call print_string

    call scan_int
    call print_int
    call newline


    ; -------------------------
    ; pedir caracter
    ; -------------------------

    mov eax, msg_char
    call print_string

    call scan_char
    call print_char
    call newline


    ; -------------------------
    ; pedir cadena
    ; -------------------------

    mov eax, msg_str
    call print_string

    mov eax, buffer
    mov ebx, 64
    call scan_string

    mov eax, msg_result
    call print_string

    mov eax, buffer
    call print_string
    call newline


    ; -------------------------
    ; salir
    ; -------------------------

    mov eax,1
    xor ebx,ebx
    int 0x80
