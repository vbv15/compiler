%{ 
   #include<stdio.h>
   #include"y.tab.h"	
%}
%%
[0-9] { return Digit;}
[a-z] {return Alphabet;}
[ \t]+ {;}
\n {return *yytext;}
. {;}
%%
