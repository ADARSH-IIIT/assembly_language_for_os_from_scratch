; nested pusha and popa allowed 

mov ah , 14 
mov al , 'a'

int 16 



pusha                       ; stack  - - - - - -  al=a

mov al , 'b'


pusha                       ;   stack ----------al=b  ------------al=a 



popa                        ;    stack  - - - - - -  al=a     and al will have value = b 
int 16


popa                        ;    stack  empty     and al will have value = a
int 16


jmp $
times 510-$+$$ db 0 
dw 0xaa55