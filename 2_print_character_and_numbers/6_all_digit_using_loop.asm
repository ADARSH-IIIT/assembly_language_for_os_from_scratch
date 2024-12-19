; to add ascii value in a number just add '0'

;   mov al , 3 ==> add al , '0'

; as '0' ==> 48 ==> adding 48 in any singlwe digit number ==> ascii of that number 



; ONLY FOPR SINGLE DIGIT 


;   IF MULTI DIGIT , EXTRA EACH DIGIT ==> GET ITS ASCII ==> PRINT ==> LOOP 







mov al , 123

mov bl , 10 



start:
xor ah , ah 

div bl     ;     al == >answer  , ah== remaindeer





mov bh , al 

mov al , ah 

mov ah , 14 

add al , '0'


cmp al , 48
je  end 

int 16 


mov al , bh
jmp start 




end:









times   510-($-$$) db 0 
dw 0xaa55
