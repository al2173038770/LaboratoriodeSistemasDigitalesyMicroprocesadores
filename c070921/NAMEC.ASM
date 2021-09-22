;NOMBRE NUEVO
title NAMEC.ASM
.model small
.stack 100h

.data
nombre db 'ARTURO','$'

.code
;FUNCION PRINCIPAL
main proc
 mov ax, @data
 mov ds, ax 
 mov bx, offset nombre	;Imprime el primer caracter
 
 siguiente:
  
  ;primero comparamso si el caracter en bx es valido
  call retardo	;genera retardo
  mov dl,[bx]	
  cmp dl,'$'	
  je fin	; Si el caracter es '$' saltamos a la linea 29 
		; Si no es caracter de paro continuamos
  ;IMPRIME CARACTER
  
  call color 
   
  ;mov ah,2
  ;int 21h
  
  inc bx	;Incrementamos bx para el siguiente caracter
  jmp siguiente ; Salta a la linea 15
  
 fin:		;Ya se detecto el caracter '$' por lo tanto termina  
 
 mov ah, 4ch
 int 21h
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
 
color proc 
    push ax
    push bx 
    push cx
   
    mov al, dl 
    mov bl, 71h
    mov bh, 0h
    mov cx, 1
    
    mov ah, 9
    int 10h
  
    pop cx
    pop bx
    pop ax 
    ret   
color endp

end