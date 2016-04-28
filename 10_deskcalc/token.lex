%{
	#include<stdio.h>
	#include"y.tab.h"
%}

flt	[0-9]+("."[0-9]+)?

%%
{flt}	{ yylval.dval=atof(yytext); return NUMBER; }
[-+*/]	{ return *yytext; }
"("	{ return *yytext; }
")"	{ return *yytext; }
[ \t]+	{ ; }
\n	{ return *yytext; }
.	{ ; }
%%
