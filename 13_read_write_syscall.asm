;; Assembly program to accept and print character using read,write system call
section .data
	string db "string to be printed",10,0
	string2 db "your input character is ",0
	len equ $-string2
	newline db 10,0
section .bss
	a resb 1
section .text
	global main
	extern printf
main:
;;	push string	call puts	add esp,4
	mov eax,3
	mov ebx,0
	mov ecx,a
	mov edx,1
	int 80h		;;accept character

	mov eax,4
	mov ebx,1
	mov ecx,string2
	mov edx,len
	int 0x80	;;print string2

	mov eax,4
	mov ebx,1
	mov ecx,a
	mov edx,1
	int 0x80	;;print character

	mov eax,4
	mov ebx,1
	mov ecx,newline
	mov edx,1
	int 0x80	;;print newline

;;	mov eax,1	mov ebx,0	int 0x80	;;exit 0

	ret
