;printing number but only btw 0 to 9 





; 49 ===> ascii of 1 

; WE CAN PRINT 0 TO 9 USING THERE ASCII CODE , BUT WHAT ABOUT TWO DIT BINARY NUMBER ???




mov ah , 14 




mov al , 49

int 16 





times 510-$+$$ db 0 
dw 0xaa55