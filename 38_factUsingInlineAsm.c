#include<stdio.h>

int fact = 1;
int n = 5;

int main(){
	asm(	"pusha\n\t"
		"movl fact,%eax\n\t"
		"movl n,%ecx\n\t"
		"lp:\n\t"
		"imul %ecx,%eax\n\t"
		"decl %ecx\n\t"
		"cmpl $1,%ecx\n\t"
		"jnz lp\n\t"
		"movl %eax,fact\n\t"
		"popa\n\t"
	);
	printf("%d\n",fact);
	return 0;
}
