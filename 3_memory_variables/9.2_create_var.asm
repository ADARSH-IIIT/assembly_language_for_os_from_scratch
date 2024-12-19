[org  0x7c00]


mov ah , 14 



mov al ,  [var1 ]
int 16 


var1 : 
  db 256+65



mov al ,  [var1 ]
int 16 





jmp $ 


times 510 - $+$$  db 0 

dw 0xaa55 



;we can access any var before its initilization or declartion reason in next file 