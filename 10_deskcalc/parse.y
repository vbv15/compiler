%{
	#include<stdio.h>
	void yyerror(char *str);
%}
%union {
	double dval;
}

%token<dval> NUMBER
%type<dval> E
%type<dval> T
%type<dval> F
%type<dval> G
%type<dval> H
%left '+' '-'
%left '*' '/'
%left '(' ')'
%right UMINUS
%right UPLUS

%%
Program: Lines Program | Lines | ;
Lines: E '\n' {printf("%f\n",$1);} | '\n' | error '\n' { yyerrok; };
E: E'+'T {$$=$1+$3;} | T {$$=$1;} | '-'E %prec UMINUS {$$=-$2;} | '+'E %prec UPLUS {$$=$2;} ;
T: T'-'F {$$=$1+(-$3);} | F {$$=$1;} ;
F: F'*'G {$$=$1*$3;} |G {$$=$1;} ;
G: G'/'H {$$=$1/$3;} |H {$$=$1;} ;
H: '('E')' {$$=$2;} | NUMBER {$$=$1;} ;
%%

void yyerror(char *str) {
	fprintf(stderr, "error: %s\n",str);
	return;
}

int yywrap() {
	return 1;
}

int main() {
	system("clear");
	yyparse();
	return 0;
}
