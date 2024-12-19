; reversing a 2 digit no , more digigt will leads to overflow 2 digit ==> 8 bit 
; cl will contain fuinal result 

mov al , 59

mov bl , 10 
mov cl , 0
mov bh , 0 
xor dl , dl 

start : 
xor ah , ah 
div bl 

cmp al , 0 
je setter


main:
mov bh , ah 
mov ch , al 
mov al , cl 
mul bl 
add al , bh 

mov  cl ,al 

cmp dl ,1 
je end 

mov al , ch
jmp start 



setter:
mov dl , 1 
jmp main 



end : 
mov ah , 0x0e

mov al , cl 

int 0x10

times   510-($-$$) db 0 
dw 0xaa55
