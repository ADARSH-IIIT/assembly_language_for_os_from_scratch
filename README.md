# assembly_language_for_os_from_scratch

we will need nasm ==> netwide assembler
qemu ==> an emulator that mimics of an system (a system with no os)



nasm -f bin filename.asm  -o  executeable.bin          ===> bin means binary 

 qemu-system-x86_64 -drive format=raw,file=executable.bin