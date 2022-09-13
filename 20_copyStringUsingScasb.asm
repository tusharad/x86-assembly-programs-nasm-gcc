;;print first word from string
section .data
	msg db "Low level assembly",10,0
	len equ $-msg
section .text
	global main
main:
	mov edi,msg
	
	mov al,' '
	repnz scasb	;;mov edi forward until al is matched
	
	mov edx,edi	;;put address of space in edx
	mov esi,msg	;; put intial address in esi
	sub edx,esi	;; subtract to get length till space

	;;print first word
	mov eax,4
	mov ebx,1
	mov ecx,msg
	int 0x80
	
	ret
