;; Assembly program to find occurance of a number in an array
section .data
	getN db "Enter how many elements: ",0
	input db "%d",0
	getNum db "Enter number you want to find",10,0
	output db "Occurances are is %d",10,0
section .bss
	array resd 10
	n resd 1
	num resd 1
section .text
	global main
	extern printf,scanf
main:
	;; Display getN message
	push getN
	call printf
	add esp,4

	;;Scanf
	push n
	push input
	call scanf
	add esp,8

	;;Get n elements from user
	
	xor ecx,ecx
scan:
	;;Calculate array location
	mov ebx,array
	mov eax,4
	mul ecx
	add ebx,eax
	
	;;scanf("%d",&arr[i]);
	pusha
	push ebx
	push input
	call scanf
	add esp,8
	popa


	inc ecx
	cmp ecx,dword[n]
	jl scan

;;Get number you want to find
	pusha
	push getNum
	call printf
	add esp,4
	popa
	
	pusha
	push num
	push input
	call scanf
	add esp,8
	popa

;;finding occurance

	xor ecx,ecx
	xor esi,esi
	mov edi,dword[num]
while:
	mov ebx,array
	mov eax,4
	mul ecx
	add ebx,eax
	
	cmp dword[ebx],edi
	jnz noIncrement
	inc esi
noIncrement:
	inc ecx
	cmp ecx,dword[n]
	jl while	

endof:	
	pusha
	push esi
	push output
	call printf
	add esp,8
	popa

	ret
