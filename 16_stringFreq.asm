;;Assembly program to print each character's frequency in the string
section .data
	input db "Enter string: ",0
	output db "%s %d",10,0
section .bss
	string resb 100
section .text
	global main
	extern printf,gets
main:
	pusha
	push input	
	call printf
	add esp,4
	popa

	pusha
	push string	
	call gets
	add esp,4
	popa

	mov ecx,1
	mov ebx,string
loopi:
	mov al,byte[ebx]
	cmp al,0
	jz endof
	cmp al,'_'
	jz goi
	
	mov ecx,1	;;cnt = 1
	mov edx,ebx
	inc edx		;;j = i+1
loopj:
	cmp byte[edx],0
	jz endj
	cmp byte[edx],al
	jnz goj
	inc ecx
	mov byte[edx],'_'
goj:
	inc edx
	jmp loopj
endj:	
	;;printf
	mov byte[esi],al
	inc esi
	mov byte[esi],0
	dec esi
	
	pusha
	push ecx
	push esi
	push output
	call printf
	add esp,12
	popa	
	;;end of printf

	inc ecx
goi:
	inc ebx
	jmp loopi	;;after jmp ebx is changing
endof:
	ret
