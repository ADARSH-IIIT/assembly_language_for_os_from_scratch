
;;;;;;;      just mov ax , mystring  ===> mov address of string var in ax , asssuming [org 0x7c00 is already there ]      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


print_string_start : 
   pusha 
   mov si , ax 
   mov ah , 14

   print_string_loop : 
   mov al, [si]
   cmp al , 0
   je  print_string_end 
   int 16 
   inc si 
   jmp  print_string_loop

  


print_string_end : 
popa 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;        endddd        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;