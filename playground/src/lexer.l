%{
#include "parser.tab.h"
#include <string.h>
#include <stdlib.h>

extern YYSTYPE yylval;
%}

%%

[ \t\r\n]+        /* skip whitespace */

"print"           { return PRINT; }

[0-9]+             {
                    yylval.intval = atoi(yytext);
                    return NUMBER;
                  }

[A-Za-z][A-Za-z0-9]* {
                    yylval.id = strdup(yytext);
                    return IDENTIFIER;
                  }

"="               { return '='; }
";"               { return ';'; }
"("               { return '('; }
")"               { return ')'; }
"+"               { return '+'; }
"-"               { return '-'; }
"*"               { return '*'; }
"/"               { return '/'; }

.                  { fprintf(stderr, "Unexpected character: %s\n", yytext); }

%%

int yywrap(void) { return 1; }

