    ; here we create and call functions usng jump statements 


    mov ah , 14 


    mov bl ,32 
    mov cl ,35


    call functionname        ; this is like function call 



     mov bl ,34
    mov cl ,35
    call functionname        ; this is like function call 

   








    ;------------------------- function definiiton------------------

    jmp skip                ; ensuring if program counter reaches here it should skip the function 
                            ; this function will add bl into al , then cl into al 

    functionname : 

    xor al , al 
    add al ,  bl 
    add al ,  cl 

    int 16


    ret                     ; flow get jumped to line just after where it is called 

    skip :                   ; end of the function definition 
    ;-----------------------------------------------------------------------------------------

    jmp $ 



    times 510-$+$$ db 0 
    dw 0xaa55


