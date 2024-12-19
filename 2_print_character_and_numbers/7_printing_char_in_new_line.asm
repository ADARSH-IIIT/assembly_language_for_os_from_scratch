; to print in new line 
;first we will move cursor to start of current line using cariage return \r    mov al, 0x0D    ; Carriage return ('\r') 
; print cariage return 

; then we will do next line \n    mov al, 0x0A    ; Line feed ('\n')
; then we will print new line 







[org 0x7c00]        ; Bootloader starts at 0x7C00

start:
   
    mov ah, 14    
    mov al, 'H'    
    int 16


   
    mov al, 0x0D    ; Carriage return ('\r')
    int 0x10        ; Print carriage returnprint_hex_value.asm
    mov al, 0x0A    ; Line feed ('\n')
    int 0x10        ; Print line feed



    ; Print 'e' and new line
    mov al, 'e'     ; Load 'e' into AL
    int 0x10        ; Print 'e'
   

    ; Halt the system
    jmp $           ; Infinite loop to stop execution

times 510 - ($ - $$) db 0 ; Fill the rest of the sector with zeroes
dw 0xAA55             ; Boot signature
