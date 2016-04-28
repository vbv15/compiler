%{ 
   #include<stdio.h>
   #include"y.tab.h"
   extern int yylval;	
%}
%%
[0-9]+ {yylval = atoi(yytext); return Number;}
[-+*/] {return *yytext;}
"(" {return *yytext;}
")"  {return *yytext;}
[ \t]+ {;}
\n {return *yytext;}
. {;}
%%

