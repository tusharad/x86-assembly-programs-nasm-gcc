;; Assembly program to find if substring exists in a string with spaces

section .data
	first db "this is a string ",0
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
	cmp byte[esi],0
	jz printFalse
	cmp al,byte[ebx]
	jnz jumpToNextWord
	inc ebx
	jmp endOfIfElse
jumpToNextWord:
	mov ebx,second
while2:
	cmp byte[esi],0
	jz endOfIfElse
	cmp byte[esi],0
	jz endOfIfElse
	inc esi
	jmp while2

endOfIfElse:
	inc esi
	cmp ebx,0
	jz checkFirst
	cmp ebx,0
	jnz endOfIf
checkFirst:
	cmp byte[esi],0
	jz printTrue
	cmp byte[esi],' '
	jz printTrue
endOfIf:
	jmp while
printFalse:
	push notFound
	call puts
	add esp,4
	jmp endof
printTrue:
	push found
	call puts
	add esp,4
endof:
	ret
