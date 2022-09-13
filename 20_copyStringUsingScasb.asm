;;print first and second word from string
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
	repnz scasb	;;mov edi forward until al is matched
	
	mov edx,edi	;;put address of space in edx
	mov esi,msg	;; put intial address in esi
	sub edx,esi	;; subtract to get length till space

	;;print first word
	mov eax,4
	mov ebx,1
	mov ecx,msg
	int 0x80
	

	;; printint first two words that is till first two spaces
	mov esi,firstWord
	mov edi,msg

	mov al,' '
	repnz scasb	;;mov edi forward until al is matched
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
