; 메모리 세그먼트를 사용하지 않고 실행되는 shell code

BITS 32                         ; nasm에게 32비트 코드임을 알린다.

call helloworld                 ; helloworld를 call 함.
db "Hello, world", 0x0am 0x0d   ; LF + CR

helloworld:
  ; ssize_t write(int fd, const void *buf, size_t count);
  pop ecx                       ; return 주소를 pop한 후 ecx에 저장
  mov eax, 4                    ; wrtie systemcall
  mov ebx, 1                    ; fd = 1 stdout
  mov edx, 15                   ; 문자열 길이 (argument 3)
  int 0x80                      ; systemcall
  
  ; void _exit(int status);
  mov eax, 1                    ; exit system call
  mov ebx, 0                    ; Status = 0, 정상종료
  int 0x80                      ; systemcall ( = exit(0) )
