#include<stdio.h>

void main(){
	int n = 5;
	int k = 1;	
	int i = 0;
	while(i < n){
		int j = 0;
		int m = 0;
		while(m < n-i){
			printf(" ");
			m++;
		}
		while(j < k){
			printf("*");
			j++;
		}
		printf("\n");
		k = k+2;
		i++;
	}
}
