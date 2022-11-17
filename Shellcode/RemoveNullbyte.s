; Null byte를 제거한 shell code

BITS 32                           ; nasm에게 32비트 코드임을 알림

jmp short last                    ; 맨 끝으로 점프
helloworld:
  ; ssize_t write(int fd, const void *buf, size_t count);
  pop ecx                         ; return 주소를 pop해서 ecx에 저장
  xor eax, eax                    ; eax = 0으로 초기화
  mov al, 4                       ; wirte systemcall
  xor ebx, ebx                    ; ebx = 0으로 초기화
  mov bl, 1                       ; fd = 1, stdout
  xor edx, edx                    ; edx = 0으로 초기화
  mov dl, 15                      ; 문자열의 길이 (argument 3)
  int 0x80                        ; systemcall
  
  ; void _exit(int status);
  mov al, 1                       ; exit systemcall
  xor ebx, ebx                    ; Status = 0
  int 0x80                        ; systemcall
  
last:
  call helloworld                 ; nullbyte 제거를 위해 위로 돌아감
  db "Hello, world!", 0x0a, 0x0d  ;
