; print ing a so many  chars in a row 




mov ah , 14

mov al , 'h'
int 16


mov al , 'e'
int 16


mov al , 'l'
int 16
int 16

mov al , 'o'
int 16



times 510-$+$$ db 0 

dw 0xaa55