;; Reverse a string using movsb
section .data
	msg db "Hello World!",10,0
	len equ $-msg
section .bss
	reversedMsg resb len
section .text
	global main
main:
	mov esi,msg
	mov edi,reversedMsg
	mov ecx,len
	add esi,len		;;go to last character of msg (at 10)
	dec esi			;; got to last character of msg (at !)

while:
	std			;; set esi direction in reverse
	lodsb			;; copy character 
	cld			;; decrement esi
	stosb			;; paste character in edi
	loop while		;; decrement ecx and jmp to while

	;;print the msg

	mov eax,4
	mov ebx,1
	mov ecx,reversedMsg
	mov edx,len
	int 0x80

	ret
