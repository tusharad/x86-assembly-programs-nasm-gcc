section .data
	msg db "hello there %d",10,0
section .text
	global main
	extern printf
main:
	mov rdi,msg
	mov rsi,23
	
	push rdi
	call printf WRT ..plt
	pop rdi

	ret
