%option noyywrap
%{
	#include<stdio.h>	
%}
white [ \n\t]
ope [-+/*]
digit [0-9]
num {digit}+
expr ({num}{ope}{num})({ope}{num})*|{num} 	
%%
{expr} { printf("Expression is valid: %s\n",yytext);}	
{white} {;}								
.* {printf("INVALID: %s\n",yytext);}
%%
int main()
{
	
	yylex();
	return 0;
}
