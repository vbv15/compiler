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
Lines: AS X BS '\n' {printf("Word belongs to the language (a^nb^n)\n");}
       ;
X : AS X BS {;}
  |
  ;
%%
 
 void yyerror(char *str)
 {
    fprintf(stderr,"error: Word does not belongs to the language (a^nb^n)  \n Re-enter Word:");
 }
 
 int yywrap()
 {
   return 1;
 }
 
 main()
 {
   yyparse();
 }
