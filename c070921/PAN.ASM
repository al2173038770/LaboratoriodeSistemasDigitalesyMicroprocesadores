title PAN.ASM

.model small
.stack 100h

.code 
main proc

	mov ah, 2	 	;Peticion del modo de video
		;Definimos la posicion del cursor
		mov dh, 0AH		
		mov dl, 014H
		mov bh, 0
	int 10h

	; Una vez cambiado la posicion imprimimos un caracter en la nueva 
	; posicion del curosor
	
	call imprime


mov ah, 4ch
int 21h
main endp
;######################################################################

imprime proc
	push ax
	push bx
	push cx
	push dx
	mov dx, 0 
	
	impNext:
				
	mov ah, 09h
		mov al, 'A'			; Definimos caracter a imprimir  
		mov bl, 1001111b		; Si cambiamos el primer digito por un 1 se parpadea 
		mov bh, 0			; Pagina de video, usualmente es cero
		mov cx, 01h
	 	int 10h
	 	call retardo
	       	
	       	jne impNext			;Factor de repeticion indica cuantas veces debe imprimirse el caracter
						;Interupcion 

	pop dx
	pop cx
	pop bx
	pop ax
	ret
imprime endp

;######################################################################

;FUNCION DE RETARDO CLASE (31/08/2021)
retardo proc
 	push bx
  	push cx

	mov cx, 000fh
  	inicio0:
  		mov bx,0FFFFh
  		inicio1:
	  		dec bx
  			cmp bx,0
  			jnz inicio1
	  		loop inicio0
  	pop cx
  	pop bx
  	ret
retardo endp

end


