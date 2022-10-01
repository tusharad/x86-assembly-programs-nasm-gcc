section .data
	first dq 90.0
	second dq 15.5
section .bss
	a resq 1
	b resq 1
section .text
	global main
main:
	;;fld qword[second]
	;;fcom
	;;FSTSW ax
	;;SAHF

	fld qword[first]
	fsin

	fld qword[first]
	fcos

	fld qword[first]
	ftan

	ret
