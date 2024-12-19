; we will learn to save some data in memory location and access it 





mov ax, 0x5000    ; Change DS to point to a new segment
mov ds, ax        ; Load the new value into DS



; saving b at ds*16 + 0x1234
mov byte [0x1234] ,  'b' 


mov ax, 0x5001    ; Change DS to point to a new segment
mov ds, ax        ; Load the new value into DS


; as we have increased ds by one , so we have to -16 for correct memory location 

mov al , [0x1234-16]

mov ah  ,14 
int 16 



jmp $ 


times 510-$+$$  db 0 

dw 0xaa55 
