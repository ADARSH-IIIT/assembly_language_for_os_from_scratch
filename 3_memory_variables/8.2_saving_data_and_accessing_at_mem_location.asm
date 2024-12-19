; this is simple program 



mov ah , 14 



mov byte [0x1234] , 'b'



mov al , [0x1234]

int 16



jmp $ 


times 510-$+$$   db 0 

dw 0xaa55