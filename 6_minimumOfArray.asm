;; Assembly program to print smallest number in the array
	section .data
	Array dd 20,5,10,40,-1
	msg db "Minimum number is %d",10,0
	section .text
	global main
	extern printf
main:
	xor ecx,ecx		;;making ecx 0
	mov esi,dword[Array]	;;putting first value of array in esi
lp:
	mov ebx,Array		;;ebx will store base address of array
	mov eax,4
	mul ecx			;; ecx = eax*ecx
	add ebx,eax		;; ebx = ebx+ecx
	cmp dword[ebx],-1
	jz endof		;;jump to endof if array element is -1
	cmp dword[ebx],esi
	jnl lp1
	mov esi,dword[ebx]
lp1:
	inc ecx
	jmp lp
endof:
	push esi
	push msg
	call printf
	add esp,8
	ret
	
