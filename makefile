myscanner:	ass3_15CS30016_lexer.c ass3_15CS30016.h lex.yy.c
		gcc ass3_15CS30016_lexer.c lex.yy.c -lfl -o myscanner

lex.yy.c:	ass3_15CS30016.l ass3_15CS30016.h
		flex ass3_15CS30016.l

clean:		
		rm myscanner lex.yy.c

