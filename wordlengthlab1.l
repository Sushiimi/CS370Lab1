     /*  This lex routine uses a counting array to match alphabeticstrings 
         and make a frequency count.
  
         The real item to notice is that yywrap() is called at EOF and then is run
         to do what we need to do.   yywrap() returns true when we have a successful 
         end to the program.  We may want to return false (0) if we want to lexing process 
         to fail 

        Shaun Cooper
        January 2015
   */
   
    /* 
        Lex routine edited by Ian Johnson -- 1-19-2018
    */
	int lgths[100];
	int countnums = 0;
    /* 
        added a second rule to count numbers from the given input
        added 1-19-2018 by Ian Johnson
    */
%%
[a-zA-Z]+	lgths[yyleng]++;
[0-9]+	    countnums++;
.	|
\n	;
%%
yywrap()
{
	int i;
	printf("Length  No. words\n");
	for (i=1; i<100; i++) {
		if (lgths[i] > 0) {
			printf("%5d%10d\n",i,lgths[i]);
		}
	}
	/* 
	   additional print statements added to display the 
	   number count - added 1-19-2018 by Ian Johnson
    */
	printf("Number Count\n");
	printf("%7d\n", countnums++);
	return(1);
}

main()
{  yylex();

}
