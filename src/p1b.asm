; p1b.asm - INT 10h: cursor y color
; Compilar: nasm -f bin p1b.asm -o ../bin/p1b.com
ORG 100h

section .text
start:
    ; Limpiar pantalla con scroll
    mov ah, 06h
    xor al, al
    xor cx, cx
    mov dx, 184Fh
    mov bh, 07h
    int 10h

    ; Posicionar cursor en fila 2, columna 10
    mov ah, 02h
    xor bh, bh
    mov dh, 02h
    mov dl, 0Ah
    int 10h

    ; Escribir "A" amarillo sobre fondo azul (atributo 1Eh)
    mov ah, 09h
    mov al, "A"
    xor bh, bh
    mov bl, 1Eh
    mov cx, 1
    int 10h

    ; Posicionar cursor en fila 3, columna 10
    mov ah, 02h
    xor bh, bh
    mov dh, 03h
    mov dl, 0Ah
    int 10h

    ; Escribir "U" rojo claro sobre negro (atributo 0Ch)
    mov ah, 09h
    mov al, "U"
    xor bh, bh
    mov bl, 0Ch
    mov cx, 1
    int 10h

    ; Avanzar cursor a columna 11
    mov ah, 02h
    xor bh, bh
    mov dh, 03h
    mov dl, 0Bh
    int 10h

    ; Escribir "7"
    mov ah, 09h
    mov al, "7"
    xor bh, bh
    mov bl, 0Ch
    mov cx, 1
    int 10h

    ; Esperar tecla y salir
    mov ah, 07h
    int 21h
    mov ah, 4Ch
    xor al, al
    int 21h