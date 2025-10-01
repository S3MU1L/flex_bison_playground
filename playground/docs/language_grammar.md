Language Grammar (EBNF format)
================
It is a simple calculator language that supports basic arithmetic operations, variable assignments, and print statements.
```ebnf
program        ::= { statement }
statement      ::= assignment | print_stmt | expr_stmt
assignment     ::= IDENTIFIER '=' expression ';'
print_stmt     ::= 'print' '(' expression ')' ';'
expr_stmt      ::= expression ';'
expression     ::= term { ('+' | '-') term }
term           ::= factor { ('*' | '/') factor }
factor         ::= NUMBER | IDENTIFIER | '(' expression ')'
IDENTIFIER     ::= letter { letter | digit }
NUMBER         ::= digit { digit }
letter         ::= 'a' | 'b' | 'c' | ... | 'z' | 'A' | 'B' | 'C' | ... | 'Z'
digit          ::= '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9'
whitespace     ::= ' ' | '\t' | '\n' | '\r'
```

