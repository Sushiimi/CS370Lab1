#Ian Johnson - 1-19-2018
#makefile meant to run lex on wordlengthlab1.l and compile it
all: wordlengthlab1.l lex.yy.c
	lex wordlengthlab1.l
	gcc -o wordlength lex.yy.c
