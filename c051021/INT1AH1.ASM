title INT1AH1.ASM
.model small
.stack 100h

.code 
main proc
    mov ah, 2
    int 1ah
    ;cx= [h][m]
    ;dh= [s]

    mov al, ch
    shr al, 01
    shr al, 01
    shr al, 01
    shr al, 01
    add al, 30h

    mov dl, al 
    int 21h

    mov al, ch
    and al,0Fh
    add al,30h

    mov dl, al 
    int 21h

    mov ah, 4ch	
    int 21h
main endp
    
hora proc
    push ax
    push bx
    
    mov ah, 2
    int 1ah
    ;cx= [h][m]
    ;dh= [s]
    
    mov al, ch
    mov ah, 04
    shr al, ah
    add al, 30h

    mov dl, al 
    int 21h

    mov al, ch
    and al,0Fh
    add al,30h

    mov dl, al 
    int 21h

    mov ah, 4ch	
    int 21h


    pop ax
    pop bx
    ret
hora endp

min proc
min endp

seg proc
    push ax
    push bx

    mov ah, 2
    int 1ah

    ;dh= [s]
    mov al,dh
    ;Obtemeos el valor de lso decimales
    mov ah,04
    shr al,ah
    add al,30h

    ;Imprimimos decimales
    mov dl,al 
    int 21h

    ;Segimos con las unidades
    mov al,dh
    and al,0Fh
    add al,30h

    ;imprimimos unidades
    mov dl, al 
    int 21h

    mov ah, 4ch	
    int 21h    

    pop ax
    pop bx
    ret
seg endp

end


