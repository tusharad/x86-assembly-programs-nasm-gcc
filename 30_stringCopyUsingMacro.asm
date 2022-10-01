;; assembly program to copy string using macro

%macro copy 2
	mov esi,%1
	mov edi,%2
%%while:			;;every label should have %% prefix in case if there
	cmp byte[esi],0		;;are multiple calls to macro..to avoid redefination of label
	jz %%endof
	mov al,byte[esi]
	mov byte[edi],al
	inc esi
	inc edi
	jmp %%while
%%endof:
	
%endmacro	

section .data
	msg db "good to be here",0
	len equ $-msg
section .bss
	msg2 resb len
section .text
	global main
	extern printf
main:
	copy msg,msg2

	push msg2
	call printf
	add esp,4

	ret
