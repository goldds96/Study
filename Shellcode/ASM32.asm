section .data                                
     msg db "Hello, world!", 0x0a, 0x0d
     
section .text
     global _start
     
_start:
     ; SYSCALL: write(1, msg, 14)
     mov eax, 4      ; write systemcall
     mov ebx, 1      ; stdout (argument 1)
     mov ecx, msg    ; msg (argument 2)
     mov edx, 14     ; length of message (argument 3)
     int 0x80        ; =syscall
     
     ; SYSCALL: exit(0)
     mov eax, 1      ; exit systemcall
     mov ebx, 0      ; argument 1
     int 0x80        ; =syscall                                      
