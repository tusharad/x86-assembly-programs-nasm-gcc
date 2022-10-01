section .text
	global square
square:
	push ebp
	mov ebp,esp
	mov ecx,dword[ebp+8]
	mov eax,dword[ebp+8]

	mul ecx

	mov dword[ebp-4],eax
	mov eax,dword[ebp-4]

	mov esp,ebp
	pop ebp

	ret
