title EBASICA.ASM
.model small
.stack 100h
.data
mensaje1 db "Damen un caracter:",'$'
salto    db 10,13,'$'
mensaje2 db "El caracter insertado es:",'$'

.code 
main proc
    mov ax, @data
    mov ds, ax 
    sig:
        mov dx,offset mensaje1	
        mov ah,9
        int 21h
        
        ;Introduce caracter
        mov ah,1
        int 21h
        
        mov dx,offset salto	
        mov ah,9
        int 21h
        
        cmp al, 
        je fin
    
        mov dx,offset mensaje2	
        mov ah,9
        int 21h
        
        mov dl, al

        mov ah,2
        int 21h 
        
        mov dx,offset salto	
        mov ah,9
        int 21h        
    loop sig
    
    ;Muestra caracter
    fin:

    mov ah, 4ch	
    int 21h
main endp
end
