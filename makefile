
myparser:	ass3_15CS30016_parser.c ass3_15CS30016.tab.c lex.yy.c myscanner
		gcc ass3_15CS30016_parser.c -o myparser

myscanner:	ass3_15CS30016_lexer.c lex.yy.c
		gcc ass3_15CS30016_lexer.c  -o myscanner

lex.yy.c:	ass3_15CS30016.l ass3_15CS30016.tab.c
		flex ass3_15CS30016.l

ass3_15CS30016.tab.c:	ass3_15CS30016.y
		bison ass3_15CS30016.y

clean:		
		rm myparser myscanner lex.yy.c ass3_15CS30016.tab.c

