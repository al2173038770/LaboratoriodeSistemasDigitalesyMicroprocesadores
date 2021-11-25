title VIDEO1.ASM
.model small
.stack 100h

.data 
saludo db "HOLA","$"

.code 
main proc
	mov ax, @data
	mov ds,ax

	;Modo texto y modo grafico	
	mov ax, 0b800h
	mov es, ax				;Posicion del cursor

	;Primer caracter de la cadena
	mov bx, offset saludo
	
	;Indice de cadena
	mov di,0h
	;Indice de ES 
	mov si,0h

	sig:	
		mov dl,[bx+si]	;Caracter
		;Compara si es fin de cadena
		cmp dl,'$'	
		je fin
		; Definimos la estructura de video
		mov es:[di], dl		;Pasamos el caracter
		mov es:[di+1], 74	;Atributos
		inc si				;Incrementamos el offset
		inc di				;Incrementamos direccion de indice
		inc di				;x2
	loop sig
	
	fin:
mov ah, 4ch
int 21h	
main endp
end
