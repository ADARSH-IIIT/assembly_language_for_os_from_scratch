; printng multi digit numbers 

; to print multiple didgit no
; we extra each digit and print 
; we take help of div registername 


; before div == >always clear ah by  xor ah , ah 
; we can use loop for more optimization 




xor ah ,ah

mov al , 12
mov bl , 10 


div bl      ; Divide AL by BL (AL = quotient (tens), AH = remainder (ones))

mov bl , ah


mov ah , 14 


add al ,'0'
int 16 

mov al , bl 


add al ,'0'
int 16



times   510-($-$$) db 0 
dw 0xaa55
