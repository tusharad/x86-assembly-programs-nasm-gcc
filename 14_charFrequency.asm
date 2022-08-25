;; Assembly program to find the frequency of the given character in the string
section .data
	msg db "Enter character: ",0
	input db "%c",0
	myString db "this is a string",0
	msg2 db "Count of character %s is %d",10,0
section .bss
	cha resb 1
section .text
	global main
	extern printf,scanf
main:
	pusha
	push msg
	call printf
	add esp,4
	popa

	pusha
	push cha
	push input
	call scanf
	add esp,8
	popa

	xor ecx,ecx
	mov al,byte[cha]
	
	mov byte[esi],al
	inc esi
	mov byte[esi],0
	dec esi
	
	mov ebx,myString
while:
	cmp byte[ebx],0
	jz endof
	cmp byte[ebx],al
	jnz noCount
	inc ecx
noCount:
	inc ebx
	jmp while
endof:
	pusha
	push ecx
	push esi
	push msg2
	call printf
	add esp,12
	popa

	ret
