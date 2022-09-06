;;Copy first and second word from string
section .data
	msg db "Low level assembly",10,0
	len equ $-msg
section .bss
	firstWord resb len
	secondWod resb len
	firstLen resd 1
	secondLen resd 1
section .text
	global main
main:
	mov esi,firstWord
	mov edi,msg
	mov al,' '
	repnz scasb
	mov edx,edi
	mov esi,msg
	sub edx,esi	

	;;print first word
	mov eax,4
	mov ebx,1
	mov ecx,msg
	int 0x80

	mov al,' '
	repnz scasb
	mov edx,edi
	mov esi,msg
	sub edx,esi

	;;print the second word
	mov eax,4
	mov ebx,1
	mov ecx,msg
	int 0x80

	ret
	
