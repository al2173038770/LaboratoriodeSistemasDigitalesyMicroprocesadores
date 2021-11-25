title VID01.ASM
.model small
.stack 100h

.code 
main proc
	mov ax, 0b800h
	mov es,ax
	mov cx, 78
	mov di,0
	
	siguiente:
		mov es:[di],'A'
		mov es: [di+1],74h
		;01110100
		call retardo

		mov es:[di],' '
		mov es:[di+1], 00000000b
		
		inc di
		inc di
		cmp di, 8
	jne siguiente

	mov ah,4ch
	int 21h

mov ah, 4ch	
main endp
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
