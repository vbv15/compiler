%{ 
   #include<stdio.h>
   void yyerror(char *str);	
%}
%token Digit Alphabet

%%
Program: Lines Program 
       | Lines
       |
       ;
Lines: X Y Lines '\n' {printf("It is a valid Variable\n");}
     | error '\n'
       {
        yyerrok;
       }
     |
     ;
X : Alphabet
   | X Alphabet	{;}
  ;
Y : Digit
   | Y Digit {;}
  ;
%%
 
 void yyerror(char *str)
 {
    fprintf(stderr,"error: Invalid Variable \n Re-enter Variable :");
 }
 
 int yywrap()
 {
   return 1;
 }
 
 main()
 {
   yyparse();
 }
