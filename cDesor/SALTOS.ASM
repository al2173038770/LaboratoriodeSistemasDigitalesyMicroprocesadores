title saltos.asm
.model small 
.stack 100h

.code
main proc
 mov bl,'A'
 mov cl, 'H'
 jmp etiqueta
 inc bl 		;si BL='A' con INC BL seria 'B'
 inc cl		;si CL='H' con INC CL seria 'I'

etiqueta:

 mov dl,bl	;Imprime bl
 mov ah, 2
 int 21h

 mov dl,cl	;Imprime cl
 mov ah,2
 int 21h

 mov ah,4ch
 int 21h
main endp
end
