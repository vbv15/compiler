%option noyywrap
%{
	#include<stdio.h>
char ch;

%}
smallc [a-z]
capitalc [A-Z]

%%
{smallc}  {  ch=yytext[0]+3; 	
	     if(ch == 123 ||ch == 124||ch == 125)
	      { ch=ch-26;}
	    fprintf(yyout,"%c",ch);
	  }

{capitalc}  {  ch=yytext[0]+3; 
	      if(ch == 92 ||ch == 93||ch == 91)
	      { ch=ch-26;}
  
	    fprintf(yyout,"%c",ch);
	  }
%%

main()
{
	FILE *f1=fopen("inputfile.txt","r");
	FILE *f2=fopen("outputfile.txt","w");

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
		
		
		fclose(yyin);
		fclose(yyout);
		
	return 0;
}
