#include<stdio.h>

void main(){
	int n = 5;
	int i = 1;
	while(i <= n){
		int j = 0;
		while(j < i){
			printf("*");
			j++;
		}
		printf("\n");
		i++;
	}
}
