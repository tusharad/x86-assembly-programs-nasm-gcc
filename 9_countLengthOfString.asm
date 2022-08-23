;; Count length of string.
section .data
	myString db "this is a string",0
	msg db "Length is %d",10,0
section .text
	global main
	extern printf,puts
main:
	xor ecx,ecx
	mov edx,myString
while:
	cmp byte[edx],0
	jz endof
	inc ecx
	inc edx
	jmp while
endof:
	push ecx
	push msg
	call printf
	add esp,8

	ret
