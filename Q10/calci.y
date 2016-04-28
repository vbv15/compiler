%{ 
   #include<stdio.h>
  // #include<math.h>
   void yyerror(char *str);	
%}
%token <dval> Number
%left '+' '-'
%left '*' '/'
%right '^'
%union
{
	double dval;
}
%token <dval> DOUBLE
%type <dval> E
%type <dval> F 
%type <dval> T
%type <dval> A
%type <dval> B

%%

Program: Lines Program 
       | Lines
       |
       | error '\n'{yyerror("Re-enter the previous line");
	 		    yyerrok;}
       ;
Lines: E '\n' { printf("%d\n",$1);}
     | 'n'
     ;
E: E'+'T {$$ = $1+$3;}
 |T {$$ = $1;}
 ;
T: T'-'F {$$ = $1-$3;}
 |F {$$ = $1;}
 ;
F: F'*'A {$$ = $1*$3;}
 |A {$$ = $1;}
 ;
A: A'/'B {$$ = $1/$3;}
 |B {$$ = $1;}
 ;
B: '('E')' {$$ = $2;}
 |Number {$$ = $1;}
 ;
%%
 
 void yyerror(char *str)
 {
    fprintf(stderr,"error:%s\n",str);
 }
 
 int yywrap()
 {
   return 1;
 }
 
 main()
 {
   yyparse();
 }
 


