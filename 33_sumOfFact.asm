;; sum of i to n where 1/i!
section .data
;;	n dd 5
	input db "%d"
	msg db "Result is %f",10,0
section .bss
	n resd 1
	temp resd 1

	sum resq 1
	one resq 1
section .text
	global main
	extern fact,printf,scanf
main:
;;	mov ecx,dword[n]
	push n
	push input
	call scanf
	add esp,8

	mov ecx,dword[n]

	fldz
	fstp qword[sum]		;;making sum = 0
while:
	push ecx	
	push ecx
	call fact		;;fact(i!)
	add esp,4
	pop ecx

	mov dword[temp],eax	;;temp = 120 (i!)
	fild dword[temp]	

	fld1 			;;st0 = 1, st1 = i!

	fdiv st0,st1		;; 1/i!

	fadd qword[sum]		;;sum += st0
	fstp qword[sum]		;;st0 = sum
	fstp qword[one]		;;st1 = 1
	
	loop while		;;i--,jump to while

	sub esp,8		
	fld qword[sum]		

	fstp qword[esp]		
	push msg
	call printf
	add esp,12

	ret
