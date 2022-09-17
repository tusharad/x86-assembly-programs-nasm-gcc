section .data
	msg db "Maximum is %d",10,0
section .text
	global main
	extern printf,max
main:
	mov eax,25	;; int a = 25
	mov ebx,30	;; int b = 30

	push eax
	push ebx
	call max	;;calling eax = max(a,b);
	add esp,8

	;;max will be stored in eax
	;;printing max value

	push eax
	push msg
	call printf
	add esp,8

	ret


;;tushar@tushar-Aspire-A315-53:~/MSc/sem3/llap/17_9$ nasm -felf32 maximumOfTwoNumbersUsingFunction.asm                                            ;;tushar@tushar-Aspire-A315-53:~/MSc/sem3/llap/17_9$ nasm -felf32 max.asm                                                                     
;;tushar@tushar-Aspire-A315-53:~/MSc/sem3/llap/17_9$ gcc -m32 maximumOfTwoNumbersUsingFunction.o max.o                                          
;;/usr/bin/ld: maximumOfTwoNumbersUsingFunction.o: warning: relocation in read-only section `.text'                                             
;;/usr/bin/ld: warning: creating DT_TEXTREL in a PIE                                                                                      
;;tushar@tushar-Aspire-A315-53:~/MSc/sem3/llap/17_9$ ./a.out                                                                                      ;;Maximum is 30
