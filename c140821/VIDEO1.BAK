title VIDEO1.ASM
.model small
.stack 100h
.data db "HOLA","$"

.code 
main proc
	mov ax,0b800H
	mov es,ax
	
	sig:
	mov di,0
	mov es:[di],'A'
	mov es:[di+1],74h
	inc di
	cmp es:[di],'$'
	je fin
	loop sig
	
	fin:
mov ah, 4ch
int 21h	
main endp
end
