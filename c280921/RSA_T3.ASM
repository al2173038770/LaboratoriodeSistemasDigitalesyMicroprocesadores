title RSA_T3.ASM    ;Reyes Santana Arturo
.model small
.stack 100h

.code 
main proc

    mov dl, 030h
    mov bl, 030h
    
    call derecha

    mov ah, 4ch	
    int 21h
main endp

derecha proc 
    push ax
    push bx
    push cx
    push dx
    push di

    ;Modo texto y modo grafico
    mov ax, 0b800h          
	mov es, ax

    dece:
        ;Posicion central derecha
        mov di,7CEh         ;Posicion central:1998    
        mov es:[di], dl     ;Caracter
        mov es:[di+1], 00011110b    ;Atributos 

        uni:
           call izquierda   
           inc bl           ;Incrementa caracter
           cmp bl,03Ah      ;Compara con ':' porque es el que sigue de 9 en Ascii
           je fininc        
        loop uni
 
    fininc:
        mov bl,030h         ;Reiniciamos el contador
        inc dl              ;Incrementamos por derecha
        cmp dl,036h         ;Compraramos si es menor a 6
        jne dece            ;Si no lo es retorna

    pop di
    pop bp
    pop cx
    pop bx
    pop ax
    ret
derecha endp

izquierda proc
    push ax
    push bx
    push cx
    push dx
    push di

    mov di,7D0h     ;Posicion central izquierda 2000
    mov es:[di], bl
    mov es:[di+1], 00011110b

    call retardo

    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    ret
izquierda endp

;PROCESO DE RETARDO CLASE (31/08/2021)
retardo proc
    push bx
    push cx

    mov cx, 000fh
    
    inicio0:
    mov bx,00FFFh
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
