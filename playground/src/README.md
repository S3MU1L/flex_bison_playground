Simple calculator language using Flex (lexer) and Bison (parser)

Build:

```sh
cd playground/src
make
```

Run:

```sh
# interactive
./calc

# or feed a program
echo -e "a = 10; print(a + 2);" | ./calc
```

Language features:
- integer numbers
- variables (assignment with `=` and `;`)
- print(expr);
- expressions with + - * / and parentheses

