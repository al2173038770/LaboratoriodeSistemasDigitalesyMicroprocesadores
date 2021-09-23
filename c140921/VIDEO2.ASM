Stitle VIDEO1.ASM
.model small
.stack 100h

.data 
saludo db 'HOLA','$'

.code 
main proc
	mov ax, @data
	mov ds,ax
	
	mov ax, 0b800h
	mov es, ax

	mov bx, offset saludo
	mov si,0h

	mov cx,4ch
	mov di,0h

	sig:
				
		mov dl,[bx+si]
		mov es:[di], dl
		mov es:[di+1], 74
		inc si
		inc di
		inc di
	loop sig
	
	fin:
mov ah, 4ch
int 21h	
main endp
end
