[ org 0x7c00 ]



mov ah , 14 
mov al , 'C' 

int 16 



mov al , [helperdata]
int 16 


%include "15.3_helper.asm"




times 510-$+$$ db 0 
dw 0xaa55 

