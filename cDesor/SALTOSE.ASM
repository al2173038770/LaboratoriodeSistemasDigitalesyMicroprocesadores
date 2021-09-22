title saltose.asm   Mi primer programa en ensamblador
.model small
.stack 100h

.code
main proc
 mov bl,'A'
 mov cl,'A'
 
 cmp bl,cl
 je etiqueta
 inc bl
 inc cl
 
etiqueta:
 mov dl, bl
 mov ah, 2
 int 21h

 mov dl,cl
 mov ah, 2
 int 21h

 mov ah, 4ch
 int 21h
main endp
end