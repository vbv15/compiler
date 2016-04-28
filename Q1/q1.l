%option noyywrap
%{
	#include<stdio.h>
	int nchar1,nchar2,sp;
%}
line \n
point .


%%
{point} {++nchar1;}
{line} {++nchar2; ++nchar1;}

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
		printf(" \n The total number of characters is %d",nchar1);
		printf(" \n The total number of lines is %d",nchar2 );
	printf(" \n The total number of spaces is %d",sp );
		printf(" \n ");
	return 0;
}
