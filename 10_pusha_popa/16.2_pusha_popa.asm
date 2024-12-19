

mov ah , 14 
mov al , 'a'

int 16 


mov sp , 0x1234          ; no error
mov bp , 0x1234         ; no error



pusha 

mov al , 'b'
int 16



; mov sp , 0x1234          error hoga 
;  push 'm'                error hoga 
; pop                      error hoga 




popa 



push 'm'           ; no error

int 16

jmp $
times 510-$+$$ db 0 
dw 0xaa55