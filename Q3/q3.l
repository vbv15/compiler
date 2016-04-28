%option noyywrap
%{
	#include<stdio.h>
int max=0;
int count=0;
int prev_len=0;

%}
charc [a-zA-Z]+


%%
{charc}  {  
		max=yyleng;
		
		if(max>prev_len)
		{	
			count=max;
			prev_len=yyleng;
			
		}	
		
	  }

%%

main()
{
	FILE *f1=fopen("inputfile4.txt","r");
	FILE *f2=fopen("outputfile4.txt","w");

	if(!f1)
	{
	printf("Can not open a file.");
	}
	yyin=f1;
	if(!f2)
	{
		printf("Can not open a file.");
	}
		yyout=f2;
		yylex();
		fprintf(yyout,"The maximum length of word is: %d",count);
		
		fclose(yyin);
		fclose(yyout);
		
	return 0;
}
