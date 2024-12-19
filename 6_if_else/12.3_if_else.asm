mov ah , 14 


mov al , 5

cmp al ,5

jge line1 


jmp end 




line1 : 
mov al , 'e'
int 16



end:
jmp $ 

times 510-$+$$ db 0 
dw 0xaa55 