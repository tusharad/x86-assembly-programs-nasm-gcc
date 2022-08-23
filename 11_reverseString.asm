;; Reverse a string
section .data
	msg db "this is a string",0
	len equ $-msg
section .bss
	msg2 resb len
section .text
	global main
	extern printf,puts
main:
	mov ebx,msg
	mov edx,msg2
	add ebx,len
	dec ebx
	dec ebx
	xor ecx,ecx
	inc ecx
	inc ecx
while:
	mov al,byte[ebx]
	mov byte[edx],al
	
	cmp ecx,len
	jnl endof
	inc ecx
	
	dec ebx
	inc edx

	jmp while

endof:
	push msg2
	call puts
	add esp,4
	
	push msg
	call puts
	add esp,4

	ret
