;; Copy one string to another using movesb
section .data
	string db "Hello World!",10,0
	len equ $-string
section .bss
	dest resb len
section .text
	global main
	extern printf
main:
	mov esi,string		;;must store copied string in esi
	mov edi,dest		;; must store to copy string in edi
	mov ecx,len		;; must store counter length in ecx
	
	rep movsb		;;it will copy string esi,edi and decrement ecx till ecx is 0

	;; print msg using system call
	mov eax,4
	mov ebx,1
	mov ecx,dest
	mov edx,len
	int 0x80

	ret
