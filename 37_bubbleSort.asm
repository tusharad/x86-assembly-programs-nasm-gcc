;;assembly program to take an array of integers and perform bubble sort
section .data
	msg1 db "enter n: ",0
	input db "%d",0
	output db "%d",10,0
section .bss
	arr resd 10
	n resd 1
section .text
	global main
	extern printf,scanf
main:
	;;print enter n
	pusha
	push msg1
	call printf
	add esp,4
	popa

	;;scanf n
	pusha
	push n
	push input
	call scanf
	add esp,8
	popa

	;;loop for scanf arr[i]
	xor ecx,ecx
lp1:
	mov ebx,arr
	mov eax,4
	mul ecx
	add ebx,eax	;;arr[i]

	pusha
	push ebx
	push input
	call scanf
	add esp,8	;;scanf("%d" ,arr[i])
	popa

	inc ecx

	cmp ecx,dword[n]
	jl lp1

	;;outer loop for(int i = 0;i< n;i++)
	xor edi,edi
lp2:
	xor ecx,ecx
lp3:
	;;inner loop for(int j = 0;j < n-1;j++)
	mov ebx,arr
	mov esi,arr
	mov eax,4
	mul ecx

	add ebx,eax	;;arr[i]
	add esi,eax

	add esi,4	;;arr[i+1]
	
	mov eax,dword[esi]
	cmp dword[ebx],eax	;;if(arr[j+1] > arr[j])
	jg swap			;;swap

	inc ecx

	mov edx,dword[n]
	dec edx

	cmp ecx,edx		;;if(j < n-1)
	jz endInner
	
	jmp lp3
swap:	
	mov eax,dword[esi]
	xchg dword[ebx],eax	;;swap
	mov dword[esi],eax

	inc ecx

	mov edx,dword[n]
	dec edx

	cmp ecx,edx
	jz endInner		;;if(j < n-1)

	jmp lp3
endInner:
	inc edi
	cmp edi,dword[n]	;;if(i < n)
	jl lp2
endof:
	;;print array
	xor ecx,ecx
lp4:
	mov ebx,arr
	mov eax,4
	mul ecx
	add ebx,eax	;;arr[i]

	pusha
	push dword[ebx]
	push output
	call printf
	add esp,8	;;printf("%d" ,arr[i])
	popa

	inc ecx

	cmp ecx,dword[n]
	jl lp4

	ret
