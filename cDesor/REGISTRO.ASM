title REGISTROG.ASM
.model small
.stack 100h

.code 
main proc
 mov ax, 1010101011001100b
 mov bx, 1110000110101010b
 mov cx, 0011110011100001b
 mov dx, 1011011010110110b
 


 mov ah 4ch
 int 21h

main endp
end