void main(void) {
        long c,x;
        char s[8192];

	printf("Zero array...%x\n", &s );
        for (c=0; c<8192; c++)
                s[c]=0;
	
	printf("Sieve...\n");
        for (c=2; c<=65535; c++)
                if ( ( s[c/8] & (1 << (c%8) )) ==0)
                        for (x=2*c; x<=65535; x += c )
                                s[x/8] |= (1 << (x%8) );

/*	printf("Print Results...\n");
        for (c=0; c<512; c++) {
		for (x=0; x<16; x++)
                	printf("%.2x ", (char)(s[16*c+x]) );
		printf("\n");
		}
*/
        }

