%option noyywrap
%{
	#include<stdio.h>
	int count=0;
%}

letter [a-zA-Z_]
digit [0-9]
ide {letter}({letter}|{digit})*

%%

{ide}   {
	   count++;
	}
%%

int main()
{
	
	FILE *f1=fopen("input.txt","r");
	if(!f1)
		printf("cannot open read file\n");
	yyin=f1;
	
	FILE *f2=fopen("ouput4.txt","w");
	if(!f2)
		printf("unable to open write file\n");
	yyout=f2;
	
	yylex();
	

	fprintf(yyout,"The total number of Identifiers are : %d\n",count);

	
	fclose(yyin);
	fclose(yyout);
	
	return 0;
}
