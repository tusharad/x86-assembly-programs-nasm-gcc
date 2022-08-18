;; Assembly program to addition of array elements	
	section .data
	Array dd 10,20,30,40,-1
	msg db "Input number is %d",10,0
	section .text
	global main
	extern printf
main:
	xor ecx,ecx 		;;make ecx 0
	xor esi,esi
lp:	
	mov ebx,Array 		;;Put address of array in ebx
	mov eax,4 		;;size
	mul ecx 		;;(index*size)
	add ebx,eax 		;;base + mulResult
	cmp dword[ebx],-1
	jz endof
	add esi,dword[ebx]
	pusha			;; pushing all register values in stack
	popa			;; poping back all previous register values
	inc ecx
	jmp lp
endof:	
	push esi
	push msg 
	call printf
	add esp,8
	
	ret
	
