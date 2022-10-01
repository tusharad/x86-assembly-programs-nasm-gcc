;;finding quadratic equation
;; (-b + sqrt(b^2 -4ac)) / 2a

section .data
	msg db "root is %f",10,0
	a dq 1.0
	b dq 4.0
	c dq 2.0
	two dd 2
	four dd 4
section .bss
	aVal resq 1
	bVal resq 1
	sqrtVal resq 1
	root1 resq 1
	root2 resq 1
section .text
	global main
	extern printf
main:
	fld qword[a]
	fild dword[two]
	fmul st0,st1
	fstp qword[aVal]	;;2a
	
	fld qword[b]
	fmul st0,st0
	fstp qword[bVal]	;;b^2

	fild qword[four]
	fld qword[a]
	fmul st0,st1
	fld qword[c]
	fmul st0,st1		;;4ac
	
	fld qword[bVal]
	fsub st0,st1		
	
	fsqrt
	fst qword[sqrtVal]	;;sqrt(b^2 - 4ac)
	
	fld qword[b]
	fchs			;;-b
	
	fadd st0,st1		;;-b+sqrt(b^2 - 4ac)
	
	fld qword[aVal]
	fdiv st1,st0		;;st1 = -b+sqrt(b^2-4ac)/2a
	
	fstp qword[root1]	;;poping st0 
	fstp qword[root1]	;;pushing st1 value in root1
	
	;;printing root one
	sub esp,8		;;since float is 8 byte
	fld qword[root1]	;;loading value into stack

	fstp qword[esp]		;;poped value would be in esp
	push msg
	call printf
	add esp,12		;;4 for msg and 8 for esp
	
	ret
