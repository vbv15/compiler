%option noyywrap
%{
	#include<stdio.h>
	int nchar1,nchar2,white=0,character=0;
%}
line \n
point .
white [ \n\t]+
tab [\t]+
charc [a-zA-Z]+
%%
{point} {++nchar1;}
{line} {++nchar2; ++nchar1;}
{white} {
		white++;
	}
{tab} {
		white=white+3;
	}
{charc} {
		while(yytext[0]!=32)
		{
			charcter++;
		}

		
	}

%%
main()
{
	FILE *f1=fopen("inputchar.txt","r");
	FILE *f2=fopen("outputchar.txt","w");

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
		fprintf(yyout,"Total number of characters %d",nchar1);
		fprintf(yyout,"The total number of lines is %d",nchar2);
		fclose(yyin);
		fclose(yyout);
		printf(" \n ");
	return 0;
}
