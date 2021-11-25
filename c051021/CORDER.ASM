title CORDER.ASM
.model small
.stack 100h

.code 
main proc
    mov cl, 03
    mov al, 10110111b; (10110111) (B7h)
    shr al,01        ; (01011011) (5Bh)
    shr al,cl        ; (00001011) (0Bh)

mov ah, 4ch	
int 21h
main endp
end
