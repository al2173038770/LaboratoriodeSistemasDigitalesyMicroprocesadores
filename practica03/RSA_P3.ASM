title RSA_P3.ASM
.model small
.stack 100h

.data 
mensaje db "INGENIERIA EN COMPUTACION","$"

.code 
main proc
    
    call printCad
    call moverCad

mov ah, 4ch	
int 21h
main endp

printCad proc
    push ax
    push bx
    push cx
    push dx
    push di

    mov ax, @data
	mov ds,ax

    ;Posicion horizontal del cursor
    mov di,4Eh                     ;Posicion central:1998

    ;Modo texto y modo grafico
    mov ax, 0b800h          
	mov es, ax

	;Primer caracter de la cadena
	mov bx, offset mensaje
	
	;Indice de la cadena 
	mov si,0h

	sig:	
		call retardo
        mov dl,[bx+si]	            ;Caracter de cadena
		;Compara si es fin de cadena
		cmp dl,'$'	
		je fin
		; Definimos la estructura de video
		mov es:[di], dl		        ;Pasamos el caracter
		mov es:[di+1], 00011110b	;Atributos
		inc si				        ;Incrementamos el offset
		inc di				        ;Incrementamos direccion de indice
		inc di				        ;x2
	loop sig 

    fin: 

    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    ret
printCad endp

moverCad proc
    push ax
    push bx
    push cx
    push dx
    push di

    mov ax, @data
	mov ds,ax

    ;Modo texto y modo grafico
    mov ax, 0b800h          
	mov es, ax

    ;Posicion horizontal del cursor
    mov di,4Eh                     ;Posicion central:1998

	;Primer caracter de la cadena
	mov bx, offset mensaje
	
	;Indice de la cadena 
	mov si,0h
    
    mov ax, 1920
    mov bp, 1998

    ;Quitamos los atributos del caracter
	movC:	
		call retardo
        mov dl,[bx+si]	            ;Caracter de cadena
		;Compara si es fin de cadena
		cmp dl,'$'
		je finM

        call bajacaracter
        add ax, 2
        add bp, 2

        inc si				        ;Incrementamos el offset
		inc di				        ;Incrementamos direccion de indice
		inc di				        ;x2
	loop movC

    finM:
    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    ret
moverCad endp

bajacaracter proc
    push ax
    push bx
    push cx
    push bp
    push di
    
    bajaC:
        call retardo
        ;Quitamos atributos
		mov es:[di], dl		        ;Pasamos el caracter
		mov es:[di+1], 00000000b	;Atributos
        ;Bajamos la posiciond el cursor
        add di, 0A0h                ;Suma 160

        cmp di, bp
        je movDer

        ;Escribimos el caracter
        mov es:[di], dl		        ;Pasamos el caracter
		mov es:[di+1], 10011110b	;Atributos
    loop bajaC

    movDer:
    call moverDerC
    
    pop di
    pop bp
    pop cx
    pop bx
    pop ax
    ret
bajacaracter endp

moverDerC proc
    push ax
    push bx
    push cx
    push bp
    push di
    
    movDC:
        call retardo
        ;Quitamos atributos
		mov es:[di], dl		        ;Pasamos el caracter
		mov es:[di+1], 00000000b	;Atributos
        dec di
        dec di                      
        cmp di, ax
        mov es:[di], dl		        ;Pasamos el caracter
		mov es:[di+1], 10011110b	;Atributos
        je finDer
    loop movDC

    finDer:
    
    pop di
    pop bp
    pop cx
    pop bx
    pop ax
    ret
moverDerC endp

;FUNCION DE RETARDO CLASE (31/08/2021)
retardo proc
    push bx
    push cx

    mov cx, 000fh
    
    inicio0:
    mov bx,008FFh
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

