CC=gcc
BISON=bison
FLEX=flex
CFLAGS=-Wall -g

all: calc

parser.tab.c parser.tab.h: parser.y
	$(BISON) -d parser.y

lex.yy.c: lexer.l parser.tab.h
	$(FLEX) lexer.l

calc: parser.tab.c lex.yy.c symtab.c main.c
	$(CC) $(CFLAGS) -o calc parser.tab.c lex.yy.c symtab.c main.c -lfl

clean:
	rm -f calc parser.tab.c parser.tab.h lex.yy.c lex.yy.o

