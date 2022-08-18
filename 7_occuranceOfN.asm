;; Assembly program to find occurance of a number in an array
	section .data
	Array dd 10,20,30,40,20,10,10,-1
	msg db "occurances of 10 are %d",10,0
	section .text
	global main
	extern printf
main:
	xor ecx,ecx
	xor esi,esi
lp:	
	mov ebx,Array
	mov eax,4
	mul ecx 		;;result would be stored in eax
	add ebx,eax
	cmp dword[ebx],-1
	jz endof
	inc ecx
	cmp dword[ebx],10
	jz lp1
	jmp lp
lp1:
	inc esi
	jmp lp
endof:
	push esi
	push msg
	call printf
	add esp,8
	
	ret
