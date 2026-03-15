SECTION .text
global scan_string

; ---------------------------------
; scan_string
; Entrada:
;   EAX = buffer destino
;   EBX = tamaño máximo
; ---------------------------------

scan_string:

    push ebp
    mov ebp, esp
    push edi            ; Preservamos EDI por convención
    push ebx            ; Guardamos el tamaño máximo para después

    mov ecx, eax        ; Dirección del buffer 
    dec ebx             ; Leemos máximo N-1 para asegurar espacio al '0'
    mov edx, ebx        ; Cantidad de bytes a leer
    mov ebx, 0          ; stdin
    mov eax, 3          ; sys_read
    int 0x80            ; Llamada al kernel
    ; Al volver, EAX contiene el número de bytes leídos (incluyendo el \n si lo hay)

    mov edi, ecx        ; Restauramos la base del buffer en EDI
    add edi, eax        ; EDI apunta ahora al final de los datos leídos
    mov byte [edi], 0   ; Agregamos el caracter nulo para indicar el término de la lectura

    pop ebx             ; Restauramos registros
    pop edi
    mov esp, ebp
    pop ebp
    ret
