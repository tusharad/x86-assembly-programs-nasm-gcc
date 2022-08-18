;; Assembly program to print array elements
	section .data
	Array dd 10,20,30,40,-1
	msg db "Input number is %d",10,0
	section .text
	global main
	extern printf
main:
	xor ecx,ecx 		;;make ecx 0
lp:	
	mov ebx,Array 		;;Put address of array in ebx
	mov eax,4 		;;size
	mul ecx 		;;(index*size)
	add ebx,eax 		;;base + mulResult
	cmp dword[ebx],-1
	jz endof
	pusha			;; pushing all register values in stack
	push dword[ebx]
	push msg 
	call printf
	add esp,8
	popa			;; poping back all previous register values
	inc ecx
	jmp lp
endof:	
	ret
	
