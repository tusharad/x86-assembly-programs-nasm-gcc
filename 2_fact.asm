;; Assembly program for factorial of a number
	section .data
	msg db "Factorial is %d",10,0
	section .text
	extern printf
	global main
main:
	mov ecx,5
	mov eax,1
lp:
	mul ecx		;;eax = eax*ecx
	cmp ecx,1
	jz endof
	dec ecx
	jmp lp
endof:
	push eax
	push msg
	call printf
	add esp,8
	ret
