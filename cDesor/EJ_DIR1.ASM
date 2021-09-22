title 
.model small
.stack 100h
.data
hola  db 'HOLA','$'

.code
main proc
 mov ax, @data	       	; CON ESTO INICIALIZO EL REGISTRO
 mov ds, ax	 	 ;DEL SEGMENTO DE DATOS DS
  
 mov dx, offset hola
 mov ah, 9

 int 21h
main endp
end
