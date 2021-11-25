title VIDEO1.ASM

.model small
.stack 100h

.code 
main proc

	;Primera posicion de la cuadricula
	mov ax,0B801h
	mov es,ax

	mov di,7CEh			;Posicion horizontal
	mov es:[di],'A'		;Definimos el valor
	mov es:[di+1],74h	;Damos atributos
	


mov ah, 4ch
int 21h

main endp
end
