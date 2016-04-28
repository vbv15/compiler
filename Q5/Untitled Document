%option noyywrap
%{
	#include<stdio.h>
	int scomment=0,mcomment=0;
%}

white [ \n\t]+
key1 "int"
key2 "float"
key3 "double"
key4 "getch()"
key5 "#include"
op1 "+"
op2 "-"
op3 "/"
op4 "*"
op5 "++"
op6 "--"
op7 "<"
op8 ">"
op9 "<="
headerfile {key5}[ ]*"<iostream.h>"|"stdio.h"
op10 ">="
op11 "=="
op12 "="
semicolon ";"
brace1 "}"
brace2 "{"
paran1 ")"
paran2 "("
intnum [0-9]+
floatnum [0-9]+("."[0-9]+)?
letter [a-zA-Z_]
digit [0-9]
ide {letter}({letter}|{digit})*
for "for"
while "while"

scomment "//"(.)*(\n)
mcomment "/*"([^*]|(\*+[^*/]))*\*+\/
%%
{white} {;}
{semicolon} {;}
{brace1} {;}
{brace2} {;}
{paran1} {;}
{paran2} {;}
{key1} {
	   fprintf(yyout,"Keyword Data type : Integer \n");
}
{key2}   { fprintf(yyout,"Keyword Data type : Float \n");
}
{key3} {
	   fprintf(yyout,"Keyword Data type : Double \n");
}
{key4} {
	   fprintf(yyout,"In-Built Function : %s\n",yytext);
}
{key5} {
	   fprintf(yyout,"Keyword : %s\n",yytext);
}
{op1} {
	   fprintf(yyout,"Airthmetic Operator  : plus \n");
}
{op2} {
	   fprintf(yyout,"Airthmetic Operator  : minus \n");
}
{op3} {
	   fprintf(yyout,"Airthmetic Operator  : Divide \n");
}
{op4} {
	   fprintf(yyout,"Airthmetic Operator  : Multiply \n");
}
{headerfile} {
	fprintf(yyout,"Header File : %s\n",yytext);
}
{op5} {
	   fprintf(yyout,"Airthmetic Operator  : Increment \n");
}
{op6} {
	   fprintf(yyout,"Airthmetic Operator  : Decrement \n");
}
{op7} {
	   fprintf(yyout,"Relational Operator  : Less than \n");
}
{op8} {
	   fprintf(yyout,"Relational Operator  : Greater than \n");
}
{op9} {
	   fprintf(yyout,"Relational Operator  : Less than equalto \n");
}
{op10} {
	   fprintf(yyout,"Relational Operator  : Greater than equalto \n");
}
{op11} {
	   fprintf(yyout,"Relational  Operator  : equal to  \n");
}
{op12} {
	   fprintf(yyout,"Airthmetic Operator  : Assignment \n");
}
{intnum} {
	   fprintf(yyout,"Integer number  : %s\n",yytext);
}
{floatnum} {
	    fprintf(yyout,"Floating point number  : %s\n",yytext);
}
{for} {
	   fprintf(yyout,"Keyword : for loop \n");
}
{while} {
	   fprintf(yyout,"Keyword : While loop \n");
}

{scomment} {
	    scomment++;
	    fprintf(yyout,"Single line  comment \n");
}
{mcomment} {
		
	    mcomment++;
	    fprintf(yyout,"Multiple line comment \n");
}
{ide} {
	   fprintf(yyout,"Identifier : %s\n",yytext);
}
%%

int main()
{
	
	FILE *f1=fopen("input.cpp","r");
	if(!f1)
		printf("cannot open read file\n");
	yyin=f1;
	
	FILE *f2=fopen("ouput4.txt","w");
	if(!f2)
		printf("unable to open write file\n");
	yyout=f2;
	
	yylex();
	

	fprintf(yyout,"total number of s comments: %d\n",scomment);
	fprintf(yyout,"total number of m comments: %d\n",mcomment);
	
	fclose(yyin);
	fclose(yyout);
	
	return 0;
}
