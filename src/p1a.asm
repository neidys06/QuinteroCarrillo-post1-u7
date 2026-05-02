; p1a.asm - INT 21h: salida de texto basica
; Compilar: nasm -f bin p1a.asm -o ../bin/p1a.com
ORG 100h

section .data
    msg1 db "Arquitectura de Computadores", 0Dh, 0Ah, "$"
    msg2 db "Unidad 7: Pantalla y Teclado", 0Dh, 0Ah, "$"
    msg3 db "Laboratorio POST-1", 0Dh, 0Ah, "$"

section .text
start:
    ; Imprimir msg1
    mov ah, 09h
    mov dx, msg1
    int 21h

    ; Imprimir msg2
    mov dx, msg2
    int 21h

    ; Imprimir msg3
    mov dx, msg3
    int 21h

    ; Salir
    mov ah, 4Ch
    xor al, al
    int 21h