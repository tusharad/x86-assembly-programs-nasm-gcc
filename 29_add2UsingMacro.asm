;;Assembly program to perform addition of 2 numbers using macro
%macro add2 3
mov eax,%1
mov ebx,%2
add eax,ebx
mov %3,eax
%endmacro

section .data
	msg db "addition is %d",10,0
section .text
	global main
	extern printf
main:
	add2 2,3,ecx		;;calling macro...the macro code will be substituted here
	
	push ecx
	push msg
	call printf
	add esp,8
	
	ret
