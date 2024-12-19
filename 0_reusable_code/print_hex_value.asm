; ----------------------     data in bx register will be printed -----   bx is mandatory -----------------------------------



;[org 0x7c00]
;jmp main 




print_register:
        pusha 
        mov ah , 14 
        mov al, 0x0D    ; Carriage return ('\r')
        int 0x10        ; Print carriage returnprint_hex_value.asm
        mov al, 0x0A    ; Line feed ('\n')
        int 0x10        ; Print line feed

        mov si , 4
        mov al, '0'
        int 16
        mov al , 'x'
        int 16

        
        print_register_loop:
                mov cx , bx
                and cx , 0xf000 
                shr ch , 4 
                cmp ch , 9 
                jg print_register_nextline


                add ch , '0'
                jmp print_register_main  

                print_register_nextline : 
                sub ch , 10 
                add ch , 'a'

                print_register_main :
                        mov al , ch   
                        int 16 
                        dec si 
                        cmp si  , 0
                    je print_register_exit  
                        shl bx , 4 
                        jmp print_register_loop

        print_register_exit  :
                mov al, 0x0D    ; Carriage return ('\r')
                int 0x10        ; Print carriage returnprint_hex_value.asm
                mov al, 0x0A    ; Line feed ('\n')
                int 0x10        ; Print line feed
                popa 
                ret  











;main:
;  mov bx , 0x123f
;  call hex_saver



;jmp $ 
;times 510-$+$$ db 0 
;dw 0xaa55