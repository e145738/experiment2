#include<stdio.h>
#include<stdlib.h>

int main (int argc, char *argv[]){

	double A = atof(argv[1]);
	double B = atof(argv[2]);
	double C = atof(argv[3]);
	double tmp = 0;

	if(A < B){
		tmp = A;
	}else{
		tmp = B;
	}

	if(tmp > C){
		tmp = C;
	}

	printf("%f",tmp);

}


