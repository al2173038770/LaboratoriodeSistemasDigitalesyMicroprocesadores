title nombre01.asm
.model small
.stack 100h

.data
nombre	db "ARTURO",'$'
nombre1	db "BEAR",'$'
salto	db 0Ah,0Dh,'$'

.code
main proc
 mov ax, @data
 mov ds, ax		;inicializacion el registro del segmento de datos
 
 mov dx,offset nombre	;Obtenemos el offset de nombre DX:DS
 mov ah,9
 int 21h

 mov bx, offset nombre	;Enlaza con el offset

 mov dl, [bx]
 mov ah,2
 int 21h
 
 

 mov dl, [bx+1]
 mov ah,2
 int 21h

 mov dl, [bx]+2
 mov ah,2
 int 21h

 mov dx,offset salto
 mov ah,9
 int 21h
 
 mov dx, offset nombre1
 mov ah,9
 int 21h 

 mov ah,4ch
 int 21h
main endp
end