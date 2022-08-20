;; Assembly program to print array elements
section .data
	getN db "Enter how many elements: ",0
	input db "%d",0
	printArr db "Array elements are",10,0
	output db "%d",10,0
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


;;print array message
	pusha
	push printArr
	call printf
	add esp,4
	popa

;;printing array
	xor ecx,ecx
while:
	mov ebx,array
	mov eax,4
	mul ecx
	add ebx,eax

	pusha
	push dword[ebx]
	push output
	call printf
	add esp,8
	popa

	inc ecx
	cmp ecx,dword[n]
	jl while	

endof:	
	ret
	
