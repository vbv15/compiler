%{ 
   #include<stdio.h>
   #include"y.tab.h"	
%}
%%
[0-9]+("."[0-9]+)? {yylval.dval = atof(yytext); return Number;}
[-+*/] {return *yytext;}
"(" {return *yytext;}
")"  {return *yytext;}
[ \t]+ {;}
\n {return *yytext;}
. {;}
%%
