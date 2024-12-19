; boot.asm - Simple bootloader to read and write sectors on the disk

[org 0x7c00]              ; BIOS loads bootloader at address 0x7C00


start:
    ; Clear registers and setup stack
    xor ax, ax            ; Clear AX
    mov ds, ax            ; Set DS = 0
    mov es, ax            ; Set ES = 0
    mov bp, 0x7BE0        ; Setup stack
    mov sp, bp

    ; Read sector from disk
    mov ah, 0x02          ; Function: Read sector
    mov al, 1             ; Number of sectors to read
    mov ch, 0             ; Cylinder 0
    mov cl, 2             ; Sector 2
    mov dh, 0             ; Head 0
    mov dl, 0x80          ; Drive 0x80 (first hard disk)
    mov bx, 0x8000        ; ES:BX = 0x0000:0x8000 (load into 0x8000)
    int 0x13              ; Call BIOS

    jc read_error         ; Jump if carry flag is set (error)
    
    ; Modify the data in memory (for demonstration)
    mov bx, 0x8000        ; Address where data is loaded
    mov byte [bx], 0x41   ; Modify first byte to 'A' (ASCII 0x41)

    ; Write sector back to disk
    mov ah, 0x03          ; Function: Write sector
    mov al, 1             ; Number of sectors to write
    mov ch, 0             ; Cylinder 0
    mov cl, 2             ; Sector 2
    mov dh, 0             ; Head 0
    mov dl, 0x80          ; Drive 0x80 (first hard disk)
    mov bx, 0x8000        ; ES:BX = 0x0000:0x8000 (data to write)
    int 0x13              ; Call BIOS

    jc write_error        ; Jump if carry flag is set (error)

    ; Success message loop
success:
    mov si, success_msg
    call print_string
    jmp $

read_error:
    mov si, read_err_msg
    call print_string
    jmp $

write_error:
    mov si, write_err_msg
    call print_string
    jmp $

; Subroutine: Print a null-terminated string
print_string:
    lodsb                  ; Load the next byte into AL
    or al, al              ; Check if AL is 0 (end of string)
    jz .done               ; If zero, return
    mov ah, 0x0E           ; BIOS teletype function
    int 0x10               ; Call BIOS
    jmp print_string       ; Loop
.done:
    ret

; Messages
success_msg db "Read and write successful! ", 0
read_err_msg db "Error reading sector. ", 0
write_err_msg db "Error writing sector. ", 0

; Boot sector signature
times 510-($-$$) db 0      ; Fill the remaining space with zeros
dw 0xAA55                  ; Boot sector signature





; error solution -->    dd if=/dev/zero bs=512 count=2 >> execute.bin      execute.bin is the binary file that we are pasiing to qemu 