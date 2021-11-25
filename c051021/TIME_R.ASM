title TIME_R.ASM
.model small
.stack 100h

.data
mensaje1 db "inicio",10,13,'$'
mensaje2 db "fin",'$'

.code 
main proc
    ;Definimos valores de datos
    mov ax, @data  
    mov ds, ax

    ;Definimos el valor de es
    mov ax, 40h     ;(60)_10
    mov es, ax          

    ;Imprimimos la primera cadena con salto de linea
    lea dx, mensaje1
    mov ah, 9
    int 21h

    ;Definimos el numero de repeticione que repetira "loop otro"
    ;https://stackoverflow.com/questions/2209419/how-to-make-a-loop-in-x86-assembly-language
    mov cx, 10

    otro:
        ;Tomamos el valor que tenemos en en ese momoento
        mov bl, es:[6Ch]
        ;Sumamos el valor que tenemos 18 pulsos es decir un segundo
        add bl, 18

        tryagain:
            ;Se comparamos hasta realizar 18 pulsos 
            cmp bl, es:[6Ch]
        jne tryagain

        ;una vez que detecta 18 pulsos imprime mensaje
        lea dx, mensaje2
        mov ah,9
        int 21h
    loop otro

    mov ah, 4ch	
    int 21h
main endp
end
