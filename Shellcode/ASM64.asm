section .data                                
     msg db "Hello, world!", 0x0a, 0x0d
     
section .text
     global _start
     
_start:
     ; SYSCALL: write(1, msg, 14)
     mov rax, 4      ; write systemcall
     mov rdi, 1      ; stdout (argument 1)
     mov rsi, msg    ; msg (argument 2)
     mov rdx, 14     ; length of message (argument 3)
     syscall         ; =syscall
     
     ; SYSCALL: exit(0)
     mov rax, 1      ; exit systemcall
     mov rdi, 0      ; argument 1
     syscall         ; =syscall  
