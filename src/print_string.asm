SECTION .text
global print_string

; ---------------------------------
; print_string
; Entrada:
;   EAX = direccion de cadena (puntero)
;   Cadena terminada en 0 (null-terminated)
; ---------------------------------

print_string:
    push ebp
    mov ebp, esp
    push ebx            ; Preservamos EBX 
    push esi            ; Preservamos ESI

    mov esi, eax        ; ESI apunta al inicio de la cadena
    mov edx, 0          ; EDX será el tamaño de nuestra cadena

.count_loop:
    cmp byte [esi], 0   ; ¿Es el caracter nulo?
    je .done_counting   ; Si es 0, terminamos de contar
    inc esi             ; Avanzamos al siguiente byte
    inc edx             ; Incrementamos el contador 
    jmp .count_loop

.done_counting:
    ; Si la cadena está vacía (longitud 0), terminamos la impresión
    cmp edx, 0
    je .end_loop
    
    mov ecx, eax        ; Dirección de la cadena 
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    ; Nota: edx ya posee la longitud de la cadena
    int 0x80            ; Llamada al kernel

.end_loop:
    pop esi             ; Restauramos registros
    pop ebx
    mov esp, ebp
    pop ebp
    ret
