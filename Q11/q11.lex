%{ 
   #include<stdio.h>
   #include"y.tab.h"	
%}
%%
[a] { return AS;}
[b] { return BS;}
[ \t]+ {;}
\n {return *yytext;}
. {;}
%%
