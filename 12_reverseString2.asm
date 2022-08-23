;; Reverse a string copying into destination address from last to first
section .data
	msg db "this is another string",0
	len equ $-msg
section .bss
	msg2 resb len
section .text
	global main
	extern printf,puts
main:
	mov ebx,msg
	mov edx,msg2
	add edx,len
	dec edx
	dec edx
while:
	mov al,byte[ebx]
	mov byte[edx],al

	cmp byte[ebx],0
	jz endof
	
	dec edx
	inc ebx

	jmp while
endof:
	push msg2
	call puts
	add esp,4
	
	ret
