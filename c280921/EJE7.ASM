title EJE7.ASM
.model small
.stack 100h

.data 
msj1 		db 'INSERTE CADENAS: ','$'
msj2		db 'NUMERO DE CARACTERES PERMITIDOS: ','$'
msj3		db 'NUMERO DE CARACTERES INSERTADOS: ','$'
msj4		db 'PRIMER CARACTER INSERTADO: ','$'
msj5 		db 'EL ULTIMO CARACETER INSERTADO: ', '$'
salto		db 10,13,'$'


keyboardArea	db 		5;label	byte
maxkeys			db 		5
charsInput	 	db 		5 dup(0)	
buffer 			db 		5 dup(0)


.code 
main proc
	mov ax,@data
	mov ds,ax
	
	;Muestra el primer mensaje de instruccion 
	mov dx, offset msj1 
	mov ah, 9
	int 21h

	;Espera introduccion de caracteres
	mov ah, 0Ah
	mov dx, offset keyboardArea
	int 21h
	
	;Salto de linea
	mov dx, offset salto 
	mov ah, 9
	int 21h
	
	;Muestra el numero de caracteres permintidos
	;Muestra el segundo mensaje
	mov dx, offset msj2
	mov ah, 9
	int 21h

	;Imprime valor de campo 1
	mov bx, offset keyboardArea
	mov dl,[bx]
	add dl, 30h
	mov ah, 2
	int 21h

	;Salto de linea
	mov dx, offset salto 
	mov ah, 9
	int 21h

	;Muestra los caracteres insertados
	;Muestra el segundo mensaje
	mov dx, offset msj3
	mov ah, 9
	int 21h

	;Muestra el segundo campo
	inc bx
	mov dl,[bx]
	add dl, 30h
	mov ah, 2
	int 21h

	;Salto de linea
	mov dx, offset salto 
	mov ah, 9
	int 21h
	
	;=========================================================
	;Muestra el primer caracter
	;Muestra el segundo mensaje
	mov dx, offset msj4
	mov ah, 9
	int 21h

	;Muestra el tercer campo
	inc bx
	mov dl,[bx]
	mov ah, 2
	int 21h

	;Salto de linea
	mov dx, offset salto 
	mov ah, 9
	int 21h

	;=========================================================
	;Muestra el ultimo caracter

	mov dx, offset msj5
	mov ah, 9
	int 21h

	;Muestra el tercer campo
	mov bx, offset keyboardArea
	mov cx, 00
	mov cx,[bx+1]
	and cx, 0fh
	inc cx
	add bx, cx
	mov dl,[bx]
	mov ah, 2
	int 21h

	;Salto de linea
	mov dx, offset salto 
	mov ah, 9
	int 21h		
	
mov ah, 4ch	
int 21h
main endp
end
