#include <stdio.h>

void main() {
	int c,i=0;

	while( (c=fgetc(stdin)) != EOF ) {
		fprintf(stdout, "%.2X", c);
		//if ( ++i % 16 == 0 ) fprintf(stdout, "\n");
		}
	fprintf(stdout, "\n");
	}
