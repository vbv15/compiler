%{ 
   #include<stdio.h>
   void yyerror(char *str);	
%}
%token AS BS

%%
Program: Lines Program 
       | Lines
       |
       ;
Lines: AS AS AS AS AS AS AS AS AS AS X BS '\n' {printf("Input is valid : language (a^nb) n>=10\n");}
     | error '\n'
       {
        yyerrok;
       }
     ;
X : AS X {;}
  |
  ;
%%
 
 void yyerror(char *str)
 {
    fprintf(stderr,"Input is not valid : language (a^nb) n>=10  \n Re-enter Word:");
 }
 
 int yywrap()
 {
   return 1;
 }
 
 main()
 {
   yyparse();
 }
