title HELLO.ASM  
.model small
.stack 100h

.data
HelloMessage DB 'Hello, world...',13, 10, '$'
HowAreUMessage DB 'How are you?', 0Dh, 0Ah, '$'

.code
principal proc
	mov ax, @data																																																	
	mov ds, ax
	
	mov dx, offset HelloMessage
	mov ah,9
	int 21h
																																																								
	mov dx, offset HowAreUMessage	
	mov ah, 9
	int 21h																										
	
	mov ah, 4ch
	int 21h

principal endp 
end principal




