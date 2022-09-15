;;Assembly program to print command line arguments as well as envp arguments
section .data
	msg db "Insuffient/less number of arguments",10,0
	msg2 db "envp[%d] = %s argv[%d] = %s",10,0
section .bss
section .text
	global main
	extern printf
main:
	push ebp		;;save previous ebp value in stack
	mov ebp,esp		;;get stack pointer value in ebp
		
	mov ecx,[ebp+8]		;;copying argc into ecx...(argc = ebp+8, argv = ebp+12,envp = ebp+16)
	cmp ecx,2
	jb insuff		;;jump if value in ecx is below 2
	
	xor edx,edx		;;set edx = 0...just like int i = 0;
lp:
	push edx		;;save value of edx in stack
	mov esi,[ebp+12]	;;copy argv in esi
	mov edi,[ebp+16]	;;copy envp in edi
	
	;;printf
	push dword[esi+edx*4]	;;argv[i]...*4 because esi is an array
	push edx		;;i	
	push dword[edi+edx*4]	;;envp[i]
	push edx		;;i
	push msg2
	call printf
	add esp,20
	
	pop edx			;;retrive saved edx value...since edx register is getting manipulated by using call printf
	inc edx			;;i++
	cmp edx,5
	jb lp			;;jump to loop if i < 5

	jmp endof		;;dont print insufficient..directly end

insuff:
	push msg
	call printf
	add esp,4

endof:
	mov esp,ebp
	pop ebp

	ret

;;tushar@tushar-Aspire-A315-53:~/MSc/sem3/llap/15_9$ ./a.out 10 20 30                                                                    
