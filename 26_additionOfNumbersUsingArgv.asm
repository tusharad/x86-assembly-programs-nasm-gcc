;;assembly program to print addition of numbers by receaving numbers via command line arguments
section .data
	msg db "less number of arguments",10,0
	msg2 db "%d",10,0
section .text
	global main
	extern printf,atoi
main:
	push ebp		;;saving ebp value in stack
	mov ebp,esp		;;copying stack pointer in ebp
	
	mov ecx,[ebp+8]		;;copy argc
	cmp ecx,2		;;checking if values are given after ./a.out
	jb insuff		;;print insuffient if no arguments are passed

	xor edx,edx		;;edx = 0 just line for(int i = 0)
	xor ebx,ebx		;;ebx = 0..for sum = 0
lp:
	push edx		;;saving edx value in stack
	mov esi,[ebp+12]	;;moving argv into esi
	
	push dword[esi+edx*4]	;;pushing argv[i] into stack to perform atoi
	call atoi		;;calling atoi to convert "10" into 10
	add esp,4		;;result of this operation eax = atoi(argv[i])
	pop edx			;;retriving edx value which was changed due to call atoi
	
	add ebx,eax		;;adding value into sum
	
	inc edx			;;i++
	cmp edx,5		;;if(i < 5) then go to loop
	jb lp	

	;;printing addition
	pusha
	push ebx
	push msg2			
	call printf
	add esp,8
	popa

	jmp endof
insuff:
	push msg
	call printf
	add esp,4
endof:
	mov esp,ebp
	pop ebp
	ret
