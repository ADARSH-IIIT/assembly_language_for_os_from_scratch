    ; here we create and call functions usng jump statements 


    mov ah , 14 


    mov bl ,32 
    mov cl ,35


    jmp functionname        ; this is like function call 
    nextline_after_fun :    ; this will act as return line for program counter  








    ;------------------------- function definiiton------------------

    jmp skip                ; ensuring if program counter reaches here it should skip the function 
                            ; this function will add bl into al , then cl into al 

    functionname : 

    xor al , al 
    add al ,  bl 
    add al ,  cl 

    int 16


    jmp nextline_after_fun

    skip :                   ; end of the function definition 
    ;-----------------------------------------------------------------------------------------

    jmp $ 



    times 510-$+$$ db 0 
    dw 0xaa55


