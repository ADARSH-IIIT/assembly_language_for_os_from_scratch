; print ing a single char



mov ah , 14     ; this is tty mode 

mov al ,   'A' 


int 16 


jmp $ 



times 510-($-$$) db 0 

dw 0xaa55