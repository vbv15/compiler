%{ 
   #include<stdio.h>
   void yyerror(char *str);	
%}
%union
{
   double dval;
}

%token <dval> Number
%type <dval> E
%type <dval> T
%type <dval> F
%type <dval> A
%type <dval> B

%left '+' '-'
%left '*' '/'
%right '^'

%%
Program: Lines Program 
       | Lines
       |
       ;
Lines: E '\n' {printf("It is a valid expression\n");}
     | error '\n'
       {
        yyerrok;
       }
     ;
E: E'+'T {;}
 |T {;}
 ;
T: T'-'F {;}
 |F {;}
 ;
F: F'*'A {;}
 |A {;}
 ;
A: A'/'B {;}
 |B {;}
 ;
B: '('E')' {;}
 |Number {;}
 ;
%%
 
 void yyerror(char *str)
 {
    fprintf(stderr,"error: Invalid Expression \n Re-enter erpression :");
 }
 
 int yywrap()
 {
   return 1;
 }
 
 main()
 {
   yyparse();
 }
