;; Assembly program to print addition of two arrays and store it in the third array
section .data
	input db "%d",0
	msg db "Enter requried count: ",0
	msg1 db "Number entered by you is %d",10,0
	msg2 db "Maximum is %d",10,0
	msg3 db "Addition is",10,0
	newline db 10,0
	formatting db "%d  +	%d  =	%d",10,0
section .bss
	n resd 1
	myArray resd 10
	myArray2 resd 10
	myArray3 resd 10
section .text
	global main
	extern printf,scanf,puts
main:
	push msg
	call printf
	add esp,4
	
	push n
	push input
	call scanf
	add esp,8
	
	push dword[n]
	push msg1
	call printf
	add esp,8
	
	xor ecx,ecx 		;;COunter set to 0
lp:
	mov ebx,myArray		;; Base in ebx
	mov eax,4
	mul ecx
	add ebx,eax

	pusha	
	push ebx
	push input
	call scanf
	add esp,8
	popa
	
	inc ecx
	cmp ecx,dword[n]
	jl lp

	pusha
	push newline
	call printf
	add esp,4
	popa

;;accepting array 2 elements

	xor ecx,ecx 		;;COunter set to 0
lp2:
	mov ebx,myArray2		;; Base in ebx
	mov eax,4
	mul ecx
	add ebx,eax

	pusha	
	push ebx
	push input
	call scanf
	add esp,8
	popa
	
	inc ecx
	cmp ecx,dword[n]
	jl lp2


	xor ecx,ecx 		;;COunter set to 0
lp1:
	mov ebx,myArray		;; Base in ebx
	mov eax,4
	mul ecx
	add ebx,eax

	pusha	
	push dword[ebx]
	push msg1
	call printf
	add esp,8
	popa
	
	inc ecx
	cmp ecx,dword[n]
	jl lp1


	xor ecx,ecx 		;;COunter set to 0
lp3:
	mov ebx,myArray2		;; Base in ebx
	mov eax,4
	mul ecx
	add ebx,eax

	pusha	
	push dword[ebx]
	push msg1
	call printf
	add esp,8
	popa
	
	inc ecx
	cmp ecx,dword[n]
	jl lp3



	xor ecx,ecx
	xor edx,edx
	xor esi,esi
lp4:
	xor esi,esi
	mov ebx,myArray
	mov ebp,myArray2
	mov edi,myArray3
	
	mov eax,4
	
	push edx
	mul ecx
	pop edx
	
	add ebx,eax
	add ebp,eax
	add edi,eax
	
	cmp edx,dword[n]
	jz lp7
	
	inc edx
	mov esi,dword[ebx]
	add esi,dword[ebp]
	mov dword[edi],esi
lp5:
	inc ecx
	jmp lp4

lp7:
	xor ecx,ecx 		;;COunter set to 0
	pusha
	push msg3
	call printf
	add esp,4
	popa

lp6:
	mov ebx,myArray		;; Base in ebx
	mov ebp,myArray2		;; Base in ebx
	mov edi,myArray3		;; Base in ebx
	mov eax,4
	mul ecx
	
	add ebx,eax
	add ebp,eax
	add edi,eax

	pusha	
	push dword[edi]
	push dword[ebp]
	push dword[ebx]
	push formatting
	call printf
	add esp,16
	popa
	
	inc ecx
	cmp ecx,dword[n]
	jl lp6

endof:
	ret
