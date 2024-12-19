;--------------------------------------------------------------------------------------


;this code 2 functions , in ax we pass a hexadeximal value of 16 bit eg , 0x123a in ax 
;there is a reserved memoery locarion mystring 
;in that meme location we save this address in form of string 


;0x123a ===> '0x123a'


;mystring + 0 ===> '0'
;mystring + 1 ===> 'x'
;mystring + 1 ===> '1'
;mystring + 0 ===> '2'
;mystring + 0 ===> '3'
;mystring + 0 ===> 'a'



;first function saves hexa value in memory 
;second a simple print function prints it 



;--------------------------------------------------------------------------------------




[org 0x7c00]


jmp main 








jmp end_of_main

hex_saver:
        mov bx , ax 
        xor si , si 
        mov si  , mystring + 5 


        hex_saver_loop:
                mov cx , bx
                and cx , 0x000f 

                cmp cl , 9 
                jg hex_saver_nextline


                add cl , '0'
                jmp hex_saver_save_to_memory  

                hex_saver_nextline : 
                sub cl , 10 
                add cl , 'a'

                hex_saver_save_to_memory :  
                        mov byte [ si ] , cl
                        shr  bx , 4 
                        dec si 
                        cmp si  , mystring+1
                    je hex_saver_exit 
                        jmp hex_saver_loop

        hex_saver_exit :
                ret  









jmp end_of_main

        string_print : 
                mov ah , 14 
                mov bx , mystring

                string_print_loop:
                        mov al , [bx]
                        int 16 
                        inc bx 
                        cmp bx , mystring+6
                    je string_print_exit  
                        jmp string_print_loop
        string_print_exit : 
            ret 






main  : 
 mov ax , 0x1f

 pusha
 call  hex_saver
 popa
 call  string_print





mystring : 
   db '0x0000'


end_of_main:

jmp $ 

times 510-$+$$ db 0
dw 0xaa55