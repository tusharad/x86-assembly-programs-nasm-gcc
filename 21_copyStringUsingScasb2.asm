;;Copy last and first word using scasb
section .data
	src db "low level string"
	len equ $-src
section .bss
	;;dest resb len
	fstring resb len
	sstring resb len
	fcount resd 1
	scount resd 1
section .text
	global main
main:	mov ecx,len
	mov edi,src
	mov al,' '
	repnz scasb
	mov edx,edi
	mov esi,src
	
	sub edx,esi
	mov dword[fcount],edx
	mov dword[fstring],esi

	mov al,' '
	repnz scasb

	mov esi,edi
	mov al,0
	repnz scasb
	mov edx,edi

	sub edx,esi
	mov dword[scount],edx
	mov dword[sstring],esi

	mov eax,4
	mov ebx,1
	mov ecx,dword[sstring]
	mov edx,dword[scount]
	int 0x80


	mov eax,4
	mov ebx,1
	mov ecx,dword[fstring]
	mov edx,dword[fcount]
	int 0x80

ret
