title asterisk.asm   Mi primer programa en ensamblador
.model small
.stack 100h

.code
main proc
 mov ah, 2
 mov dl,'*'
 int 21h

 mov ah, 4ch
 int 21h
main endp
end