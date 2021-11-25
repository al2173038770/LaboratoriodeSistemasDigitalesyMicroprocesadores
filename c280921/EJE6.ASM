title EJE6.ASM
.model small
.stack 100h

.data 
msj1 		db "INSERTE CADENA: ",'$'
keyboardArea	label	byte
maxkeys		db 5
charsInput 	db ?	
buffer 		db 4 dup(0)


.code 
main proc
	mov ax,@data
	mov ds,ax
	
	mov dx, offset msj1 
	mov ah, 9
	int 21h
	
	mov ah, 0Ah
	mov dx, offset keyboardArea
	int 21h	


mov ah, 4ch	
int 21h
main endp
end
