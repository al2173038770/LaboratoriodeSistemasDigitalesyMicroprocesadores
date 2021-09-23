;Reyes Santana Arturo
title RSA_P2.ASM
.model small
.stack 100h

.data 
cadena1 db 'EN CASA','$'
cadena2 db 'QUEDATE','$'
cont db 'Para continuar opime cualquier letra .... ',13, 10,'$'

.code
main proc
    call cambioCursor1
    call imprimirCad1
    call cambioCursor2
    call imprimirCad2
    call continua
    call cambiaCadena
    call cambioCursor1
    call imprimirCadena1Color
    call cambioCursor2
    call imprimirCadena2Color
    mov ah, 4ch	
    int 21h
main endp
;#####################################################
imprimirCad1 proc
    push ax
    push bx
    push cx
    push dx
    ;Enlazamos 
    mov ax, @data
    mov ds, ax

    ;Imprimimos segunda cadena caracter por caracter
    mov bx, offset cadena1
    siguiente1: 
        call retardo
        mov dl,[bx]
        cmp dl,'$'      ;Comparamos caracter
        je fin1          ;Salta a linea fin
        call imprCSA    
        inc bx          ;Pasamo al siguiente caracter
        jmp siguiente1   ;Salta a linea siguiente
    fin1:

    pop dx
    pop cx
    pop bx
    pop ax
    ret
imprimirCad1 endp
;#####################################################
imprimirCad2 proc
    push ax
    push bx
    push cx
    push dx
    
    ;Enlazamos 
    mov ax, @data
    mov ds, ax
    
    ;Imprimimos segunda cadena caracter por caracter
    mov bx, offset cadena2
    siguiente2: 
        call retardo
        mov dl,[bx]
        cmp dl,'$'      ;Comparamos caracter
        je fin2          ;Salta a linea fin
        call imprCSA    
        inc bx          ;Pasamo al siguiente caracter
        jmp siguiente2   ;Salta a linea siguiente
    fin2:

    pop dx
    pop cx
    pop bx
    pop ax
    ret
imprimirCad2 endp
;#####################################################
;Imprime caracter sin atributo
imprCSa proc
    push ax
    push bx 
    push cx
   
    mov al, dl  ;Pasamos Caracter
    mov bh, 0h  
    mov cx, 1

    mov ah, 0Ah   ;Imprimimos caracter
    int 10h
  
    pop cx
    pop bx
    pop ax 
    ret   
imprCSA endp
;#####################################################
cambioCursor1 proc
    push ax
    push bx
    push dx
    
    ;Definimos posicion del cursor
    mov ah, 2
    mov bh,0
    mov dh, 0Ah
    mov dl, 025h
    int 10h

    pop dx
    pop bx
    pop ax
    ret
cambioCursor1 endp
;#####################################################
cambioCursor2 proc
    push ax
    push bx
    push dx
    
    ;Definimos posicion del cursor
    mov ah, 2
    mov dh, 0Fh         ;Fila
    mov dl, 025h        ;Columna
    mov bh,0
    int 10h

    pop dx
    pop bx
    pop ax
    ret
cambioCursor2 endp
;#####################################################
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
;#####################################################
;Mesnsaje de intermedio para continuar
continua proc
    push ax
    push cx
    push dx

    ;Pnemos al final de la cadena
    mov dh, 014h         ;Fila
    mov dl, 0            ;Columna
    mov bh,0
    mov ah, 2
    int 10h

    ;Imprime mensaje
    mov ax, @data
    mov ds, ax
    mov dx, offset cont
    mov ah, 09h
    int 21h

    mov ah, 10h
    int 16h

    pop dx
    pop cx
    pop ax
    ret
continua endp
;#####################################################
;Intercambiamos caracter por caracter la cadena
cambiaCadena proc
    push ax
    push bx
    push cx
    push dx
    
    ;Enlazamos 
    mov ax, @data
    mov ds, ax

    ;Imprimimos segunda cadena caracter por caracter
    mov di, offset cadena1
    mov si, offset cadena2
    
    siguiente: 
        
        ;Intercambio
        mov dl,[di]
        mov dh, [si]

        mov [di],dh
        mov [si],dl        

        ;Incremento de posicion
        inc di
        inc si
        ;Comparamos si es fin de cadeana
        cmp dl,'$'
        je fin
        jmp siguiente   ;Regresa

    fin:
    pop dx
    pop cx
    pop bx
    pop ax
    ret
cambiaCadena endp
;#####################################################
;Imprimimos la nueva cadena 1
imprimirCadena1Color proc
    push ax
    push bx
    push cx
    push dx
    ;Enlazamos 
    mov ax, @data
    mov ds, ax

    ;Imprimimos segunda cadena caracter por caracter
    mov bx, offset cadena1
    siguiente1C: 
        call retardo
        mov dl,[bx]
        cmp dl,'$'      ;Comparamos caracter
        je fin1C         ;Salta a linea fin
        call imprCA1    
        inc bx          ;Pasamo al siguiente caracter
        jmp siguiente1C   ;Salta a linea siguiente
    fin1C:

    pop dx
    pop cx
    pop bx
    pop ax
    ret
imprimirCadena1Color endp
;#####################################################
;Imprimimos la nueva cadena 2
imprimirCadena2Color proc
    push ax
    push bx
    push cx
    push dx

    ;Enlazamos 
    mov ax, @data
    mov ds, ax
    
    ;Imprimimos segunda cadena caracter por caracter
    mov bx, offset cadena2
    siguiente2C: 
        call retardo
        mov dl,[bx]
        cmp dl,'$'      ;Comparamos caracter
        je fin2C          ;Salta a linea fin
        call imprCA2    
        inc bx          ;Pasamo al siguiente caracter
        jmp siguiente2C   ;Salta a linea siguiente
    fin2C:

    pop dx
    pop cx
    pop bx
    pop ax
    ret
imprimirCadena2Color endp
;#####################################################
;Imprimimos caracter con atributos
imprCA1 proc
    push ax
    push bx 
    push cx
   
    mov al, dl         ;Pasamos Caracter
    mov bh, 0h
    mov bl, 00011110b  ;Colocamos atriburos en binario
    mov cx, 1

    mov ah, 09h         ;Imprimimos caracter
    int 10h
  
    pop cx
    pop bx
    pop ax 
    ret
imprCA1 endp
;#####################################################
;Imprimimos caracter con atributos
imprCA2 proc
    push ax
    push bx 
    push cx
   
    mov al, dl  ;Pasamos Caracter
    mov bh, 0h
    mov bl, 01110001b ;Colocamos atriburos en binario
    mov cx, 1

    mov ah, 09h   ;Imprimimos caracter
    int 10h
  
    pop cx
    pop bx
    pop ax 
    ret
imprCA2 endp
end
