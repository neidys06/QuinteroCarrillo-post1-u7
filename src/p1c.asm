; p1c.asm - Cadena en posicion exacta con color verde brillante
; Compilar: nasm -f bin p1c.asm -o ../bin/p1c.com
ORG 100h

section .data
    titulo db "UNIDAD 7 - PANTALLA Y TECLADO", "$"
    filaT  equ 5
    colT   equ 25

section .text
start:
    ; Limpiar pantalla
    mov ah, 06h
    xor al, al
    xor cx, cx
    mov dx, 184Fh
    mov bh, 07h
    int 10h

    ; Iniciar recorrido caracter a caracter
    mov si, titulo
    mov dl, colT
    mov dh, filaT

.bucle:
    mov al, [si]
    cmp al, "$"
    je .fin

    ; Posicionar cursor
    mov ah, 02h
    xor bh, bh
    int 10h

    ; Escribir caracter verde brillante (0Ah)
    mov ah, 09h
    xor bh, bh
    mov bl, 0Ah
    mov cx, 1
    int 10h

    inc si
    inc dl
    jmp .bucle

.fin:
    mov ah, 07h
    int 21h
    mov ah, 4Ch
    xor al, al
    int 21h