;; Assembly program to find if substring exists in a string

section .data
	first db "this is a stritng1",0
	second db "string",0
	found db "string found",0
	notFound db "string not found",0
section .text
	global main
	extern puts
main:
	mov esi,first
	mov ebx,second
while:
	mov al,byte[esi]
	cmp al,0
	jz printFalse
	cmp al,byte[ebx]
	jnz backToZero
	
	inc ebx
	inc esi
	cmp byte[ebx],0
	jz printTrue
	jmp while
backToZero:
	mov ebx,second
	inc esi
	cmp byte[ebx],0
	jz printTrue
	jmp while
	
printTrue:
	push found
	call puts
	add esp,4
	jmp endof

printFalse:	
	push notFound
	call puts
	add esp,4
	jmp endof
endof:
	ret
