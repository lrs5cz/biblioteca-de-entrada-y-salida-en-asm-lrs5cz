extern print_char
global newline

SECTION .text

newline:

    push ebp
    mov ebp, esp

    mov al, 10 ; ASCII para una nueva línea

    ; ----------------------------------------------------------------------
    ; Opción 1: Llamamos el algoritmo ya definido para imprimir un caracter
    call print_char
    ; ----------------------------------------------------------------------
    ; Opcion 2: Agregamos textualmente el algoritmo
    ; push eax ; Empujamos eax para disponer de AL en la memoria
    ; mov eax, 4 ; sys_write
    ; mov ebx, 1 ; stdout
    ; mov ecx, esp ; Puntero al caracter en el tope de la pila
    ; mov edx, 1 ; Tamaño del caracter (1 byte)
    ; int 0x80 ; Llamada al kernel
    ; ----------------------------------------------------------------------

    mov esp, ebp
    pop ebp
    ret
