#include <stdio.h>

int yyparse(void);

int main(void) {
    printf("Simple calc. Enter statements. Ctrl+D to exit.\n");
    yyparse();
    return 0;
}
