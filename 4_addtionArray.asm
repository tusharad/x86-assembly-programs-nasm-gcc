;; Assembly program to addition of array elements	
section .data
	getN db "Enter how many elements: ",0
	input db "%d",0
	output db "Addition of array is %d",10,0
section .bss
	array resd 10
	n resd 1
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

;;adding
	xor ecx,ecx
	xor esi,esi
while:
	mov ebx,array
	mov eax,4
	mul ecx
	add ebx,eax

	add esi,dword[ebx]
	
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
	
