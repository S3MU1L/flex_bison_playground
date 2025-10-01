%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "symtab.h"

int yylex(void);
void yyerror(const char *s);
%}

%union {
    int intval;
    char *id;
}

%token <intval> NUMBER
%token <id> IDENTIFIER
%token PRINT
%type <intval> expression term factor

%left '+' '-'
%left '*' '/'

%%


program:
    /* empty */
  | program statement
  ;

statement:
    assignment
  | print_stmt
  | expr_stmt
  ;

assignment:
    IDENTIFIER '=' expression ';'
    {
      symtab_set($1, $3);
      free($1);
    }
  ;

print_stmt:
    PRINT '(' expression ')' ';'
    {
      printf("%d\n", $3);
    }
  ;

expr_stmt:
    expression ';'
    {
      /* evaluate but discard result */
    }
  ;

expression:
    expression '+' term { $$ = $1 + $3; }
  | expression '-' term { $$ = $1 - $3; }
  | term { $$ = $1; }
  ;

term:
    term '*' factor { $$ = $1 * $3; }
  | term '/' factor {
        if ($3 == 0) {
            yyerror("division by zero");
            $$ = 0;
        } else $$ = $1 / $3;
    }
  | factor { $$ = $1; }
  ;

factor:
    NUMBER { $$ = $1; }
  | IDENTIFIER {
        int val;
        if (symtab_get($1, &val)) {
            $$ = val;
        } else {
            fprintf(stderr, "undefined variable '%s' (using 0)\n", $1);
            $$ = 0;
        }
        free($1);
    }
  | '(' expression ')' { $$ = $2; }
  ;

%%


void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
