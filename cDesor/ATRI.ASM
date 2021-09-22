title atri.asm

.model small 
.stack 100h

.code 
main proc

mov al, 'A'
mov bl, 47h
mov bh, 0h
mov cx, 1h

mov ah, 9
int 10h

main endp
end
