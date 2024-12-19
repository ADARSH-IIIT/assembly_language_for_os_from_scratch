; boot sector padding and signature 







times   510-($-$$) db 0 
dw 0xaa55



; this is of 512 bytes 

;  bootlader reads 0th index ==> first 512 bytes only 


;all bytes should be used => if emplty pad dd with 0 

;last two byte   55 aa 


;as it is big endian ===>  dw ==> defined word 

;55 aa ===> dw 0xaa55

;or do db 0x55
  ;    db 0xaa

  ;  db ==> defined byte ==> 8bit data 


   ; dw ==> defide word ==> 2 byte==> 16 bit 



    ;accu , and all register are of 16 bits , but ram cell is of 8 bit ==> 1 byte only 

    ;save 0x1234 in  emoery => will take 2 consecutive mem location   

    ; $ ==> current relative address 
    ; $$=== > always 0000  ==> relative address of first line 



