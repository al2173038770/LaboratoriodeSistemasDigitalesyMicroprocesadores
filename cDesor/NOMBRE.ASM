title nombre.asm
.model small
.stack 100h

.code
main proc
 mov dl,'A'	;Se coloca el caracter J
 mov ah, 2	;Muestra en terminal o salida estandar
 int 21h
 
 mov dl,'R'
 mov ah,2
 int 21h

 mov dl,'T'
 mov ah,2
 int 21h

 mov dl, 'U'
 mov ah,2
 int 21h
 
 mov dl, 'R'
 mov ah,2
 int 21h

 mov dl,'O'
 mov ah,2
 int 21h

 mov dl,10
 mov ah, 2
 int 21h


 mov dl,65	;Se coloca el caracter pero en decimal
 mov ah, 2
 int 21h

 mov dl,82
 mov ah,2
 int 21h
 
 mov dl,84
 mov ah,2
 int 21h

 mov dl,85
 mov ah,2
 int 21h

 mov dl,82
 mov ah,2
 int 21h

 mov dl,79
 mov ah,2 
 int 21h 

 mov dl, 0Ah
 mov ah, 2
 int 21h

 mov dl, 41h	;Se coloca el caracter en hexadecimal
 mov ah, 2
 int 21h
 
 mov dl, 52h
 mov ah,2 
 int 21h

 mov dl, 54h
 mov ah, 2
 int 21h
 
 mov dl, 55h
 mov ah,2
 int 21h
 
 mov dl, 52h
 mov ah,2
 int 21h

 mov dl, 4Fh
 mov ah,2
 int 21h
	
 mov ah,4ch
 int 21h
main endp
end