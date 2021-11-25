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
	
	mov dx, offset linea
	mov ah, 9 
	int 21h
	
	mov ah, 1
	int 21h
	
	mov dx, offset salto
	mov ah, 9
	int 21h
	
	mov dx, offset linea2
	mov ah, 9
	int 21h
	
	mov dl, al
	mov ah, 2
	int 21h
			
	mov ah, 4ch
	int 21h

main endp
end