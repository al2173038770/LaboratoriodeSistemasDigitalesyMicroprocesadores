title ejemplo
.model small
.stack 100h
.data
	linea db "Ingresa un caracter: ", '$'
	salto db 0Ah, 0Dh, '$'
	linea2 db "Caracter: ", '$'
.code
main proc
		
	mov ax, @data
	mov ds, ax			
	
	et1:
	mov dx, offset linea
	call imprime
	
	mov ah, 1
	int 21h
	
	mov dx, offset salto
	call imprime
	
	cmp al, 1Bh
	je salir
	
	mov dx, offset linea2
	call imprime
	
	mov dl, al
	mov ah, 2
	int 21h			
	
	mov dx, offset salto
	call imprime
	jmp et1
	
	salir:			
	mov ah, 4ch
	int 21h

main endp

imprime proc 
	push ax
	
	mov ah, 9
	int 21h
	
	pop ax
	ret	
imprime endp	

end