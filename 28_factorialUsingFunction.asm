section .data
	msg db "factorial is %d",10,0
section .text
	global main
	extern printf,fact
main:
	mov eax,5 	;; n = 5

	push eax
	call fact	;; fact(5);
	add esp,4

	;;result of fact 5 will be stored to eax

	push eax
	push msg
	call printf
	add esp,8

	ret
	
;; $ nasm -felf32 factorialUsingFunction.asm
;; $ nasm -felf32 fact.asm
;; $ gcc -m32 factorialUsingFunction.o fact.o
;; $ ./a.out
