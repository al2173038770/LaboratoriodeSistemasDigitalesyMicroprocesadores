title delay01.asm
.model small
.stack 100h

.code
main proc

 mov al, 'A'
 mov cl, 'A'
 cmp al,cl
 jne etiqueta
 inc al
 inc cl

etiqueta:
 mov dl,al
 mov ah, 2
 int 21h

 mov bx, 0FFFFh
 
 call retardo 		; INVOCO PROCEDIMIENTO RETARDO
  
 mov dl,cl
 mov ah,2
 int 21h

 mov ah,4ch
 int 21h
main endp

;FUNCION RETARDO
retardo proc
 push bx ;GUARDAR VALORES EN LA PILA
 push cx

	 
 mov cx, 000fh
 inicio:
 mov bx, 0FFFFh
 inicio1:
  dec bx
  cmp bx, 0
  jnz inicio1
  
;  dec cx		;SUSTITUIMOS LAS TRES LINEAS POR "LOOP"
;  cmp cx,0
;  jnz inicio
  
  loop inicio	;Esta enlazado con CX por defecto

 pop cx ;REGRESA VALORES DE LA PILA
 pop bx
 ret	;IMPORTANTE DE LO CONTRARIO NO SE SABE DONDE GUARDA CX Y BX
retardo endp


end