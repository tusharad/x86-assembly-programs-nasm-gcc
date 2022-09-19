;; Assembly program to find if substring exists in a string with spaces

section .data
	msg db "this is a string",0
	len equ $-msg
	msg2 db "string",0
	found db "substring found",0
	notfound db "substring not found",0
section .text
	global main
	extern printf
main:
	mov esi,msg
	mov edi,msg2

lp:
	mov al,byte[edi]
	cmp byte[esi],al
	jnz moveToSpace	

	inc esi
	inc edi

	cmp byte[edi],0
	jz printTrue

	cmp byte[esi],0
	jz printFalse

	jmp lp

moveToSpace:
	mov edi,msg2
	cmp byte[esi],' '
	jz goBacktolp
	cmp byte[esi],0
	jz printFalse
	inc esi
	jmp moveToSpace

goBacktolp:
	inc esi
	jmp lp

printTrue:
	pusha
	push found
	call printf
	add esp,4
	popa
	jmp endof

printFalse:
	pusha
	push notfound
	call printf
	add esp,4
	popa

endof:
	ret
