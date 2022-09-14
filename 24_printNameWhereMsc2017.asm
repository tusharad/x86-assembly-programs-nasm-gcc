;; Assembly program to print first name of student who's from MSc and from year 2017 from this multiline data
section .data
	student  db "Ramesh Suresh Joshi,M,MCA,2017",0
		 db "Sumukhi Dinesh Rajeshwar,F,MSc,2011",0
		 db "Rinku Rajendra Rane,F,MSc,2017",0
		 db "Sunil Ashik Wagh,M,MCA,2017",0
		 db "Jignesh Raju More,M,MSc,2017",0,-1
	len equ $-student
	course db "MSc"
	year db "2017"

section .bss
	fname resb len
	flen resd 1
    complete resd 1
section .text
	global main
main:
	mov ecx,len
	mov edi,student
lp1:
	mov esi,edi
	mov al,' '
	repnz scasb

	mov edx,edi
	sub edx,esi		;;geting length of first word and storing it in edx

	;;saving first word(esi) and its length (edx) in the stack
	mov dword[flen],edx
	mov dword[fname],esi

	;;skip first 2 commas to reach to Msc
	mov al,','
	repnz scasb
	repnz scasb
	
	mov dword[complete],ecx
	mov esi,course	;;put MSc in esi
	mov ecx,3		;;lenth of MSc is 3
	repz cmpsb		;;compare esi and edi
	jnz notMatched   		;;terminate if not equal

	inc edi 		;;skip ,

	;;now check if year is 2017
	mov esi,year
	mov ecx,4
	repz cmpsb
	jnz notMatched

	inc edi

	;;if both conditions passed then print name
	mov eax,4
	mov ebx,1
	mov ecx,dword[fname]
	mov edx,dword[flen]
	int 0x80

lp:
	cmp byte[edi],-1
	jz terminate
	dec edi
	jmp lp1

notMatched:
	cmp edi,0
	jz lp1
	mov ecx,dword[complete]
	mov al,0
	repnz scasb
	dec edi
	jmp lp1
terminate:
	ret