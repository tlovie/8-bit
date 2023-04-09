#include <stdio.h>
#include <stdlib.h>

#define MAX 65536
#define BITS 8

void main() {
	long c,x;
	char *s = malloc(MAX/BITS * sizeof(char));

	for (c=0; c < MAX/BITS; c++)
		s[c]=0;

	for (c=2; c*2 < MAX; c++)
		if ( (s[c/8] & (1 << (c%8) )) ==0) 
			for (x=2*c; x < MAX; x+=c)
				s[x/8] |= (1 << (x%8) );
			

	for (c=0; c < MAX/BITS/16; c++) {
		printf("%x ", 0x1000+c*16);
		for (x=0; x<16; x++)
			printf("%x ", s[16*c+x]);
		printf("\n");
		}  

/*	for (c=0; c < MAX; c++) 
		if (!(s[c/8] & 1 << (c%8)))
			printf("%d ", c);

*/
	}
