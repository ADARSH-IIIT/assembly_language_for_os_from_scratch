[org 0x7c00]



mov ah , 14 





mov al , [mystring + 7  ]

add al , '0'
int 16 


mystring : 
db 'adarsh' , 0 

jmp $


times 510-$+$$  db 0 
dw 0xaa55 
