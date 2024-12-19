mov ah , 14 




mov al , 'a' 

mov cl , 10 


start : 
int 16
inc al
dec cl 

cmp cl , 0 
je end 

jmp start


end:
jmp $ 


times 510-$+$$ db 0 
dw 0xaa55