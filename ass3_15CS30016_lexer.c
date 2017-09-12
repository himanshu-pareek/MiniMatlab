#include <stdio.h>
#include "lex.yy.c"

extern int yylex ();
extern int yylineno;
extern char* yytext;
extern void yyrestart(FILE* f);

int main (int argc, char** argv) {

	int token;
	FILE* f;
	
	if (argc > 1) {
		f = fopen (argv[1], "r");
		if (!f) {
			perror (argv[1]);
			return (1);
		}
	}
	
	
	if (f) {
		yyrestart(f);
	}
	

	while (token = yylex ()) {
		switch (token) {
			case KEYWORD_UNSIGNED: {
				printf("<KEYWORD, %d, %s>\n", token, yytext);
				break;
			}
			case KEYWORD_BREAK: {
				printf("<KEYWORD, %d, %s>\n", token, yytext);
				break;
			}
			case KEYWORD_RETURN: {
				printf("<KEYWORD, %d, %s>\n", token, yytext);
				break;
			}
			case KEYWORD_VOID: {
				printf("<KEYWORD, %d, %s>\n", token, yytext);
				break;
			}
			case KEYWORD_CASE: {
				printf("<KEYWORD, %d, %s>\n", token, yytext);
				break;
			}
			case KEYWORD_FLOAT: {
				printf("<KEYWORD, %d, %s>\n", token, yytext);
				break;
			}
			case KEYWORD_SHORT: {
				printf("<KEYWORD, %d, %s>\n", token, yytext);
				break;
			}
			case KEYWORD_CHAR: {
				printf("<KEYWORD, %d, %s>\n", token, yytext);
				break;
			}
			case KEYWORD_FOR: {
				printf("<KEYWORD, %d, %s>\n", token, yytext);
				break;
			}
			case KEYWORD_SIGNED: {
				printf("<KEYWORD, %d, %s>\n", token, yytext);
				break;
			}
			case KEYWORD_WHILE: {
				printf("<KEYWORD, %d, %s>\n", token, yytext);
				break;
			}
			case KEYWORD_GOTO: {
				printf("<KEYWORD, %d, %s>\n", token, yytext);
				break;
			}
			case KEYWORD_BOOL: {
				printf("<KEYWORD, %d, %s>\n", token, yytext);
				break;
			}
			case KEYWORD_CONTINUE: {
				printf("<KEYWORD, %d, %s>\n", token, yytext);
				break;
			}
			case KEYWORD_IF: {
				printf("<KEYWORD, %d, %s>\n", token, yytext);
				break;
			}
			case KEYWORD_DEFAULT: {
				printf("<KEYWORD, %d, %s>\n", token, yytext);
				break;
			}
			case KEYWORD_DO: {
				printf("<KEYWORD, %d, %s>\n", token, yytext);
				break;
			}
			case KEYWORD_INT: {
				printf("<KEYWORD, %d, %s>\n", token, yytext);
				break;
			}
			case KEYWORD_SWITCH: {
				printf("<KEYWORD, %d, %s>\n", token, yytext);
				break;
			}
			case KEYWORD_DOUBLE: {
				printf("<KEYWORD, %d, %s>\n", token, yytext);
				break;
			}
			case KEYWORD_LONG: {
				printf("<KEYWORD, %d, %s>\n", token, yytext);
				break;
			}
			case KEYWORD_ELSE: {
				printf("<KEYWORD, %d, %s>\n", token, yytext);
				break;
			}
			case KEYWORD_MATRIX: {
				printf("<KEYWORD, %d, %s>\n", token, yytext);
				break;
			}
			case IDENTIFIER: {
				printf("<IDENTIFIER, %d, %s>\n", token, yytext);
				break;
			}
			case CONSTANT: {
				printf("<CONSTANT, %d, %s>\n", token, yytext);
				break;
			}
			/*
			case FLOATING_CONSTANT: {
				printf("<FLOATING CONSTANT, %d, %s>\n", token, yytext);
				break;
			}
			case CHARACTER_CONSTANT: {
				printf("<CHARACTER CONSTANT, %d, %s>\n", token, yytext);
				break;
			}
			case ZERO_CONSTANT: {
				printf("<ZERO CONSTANT, %d, %s>\n", token, yytext);
				break;
			}
			*/
			case STRING_LITERAL: {
				printf("<STRING LITERAL, %d, %s>\n", token, yytext);
				break;
			}
			case LEFT_SQUARE_BRAC_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case RIGHT_SQUARE_BRAC_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case LEFT_SMALL_BRAC_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case RIGHT_SMALL_BRAC_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case LEFT_CURL_BRAC_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case RIGHT_CURL_BRAC_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case DOT_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case ARROW_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case INCREMENT_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case DECREMENT_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case BIT_AND_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case MULT_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case PLUS_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case MINUS_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			
			case DIVIDE_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case MOD_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case LEFT_SHIFT_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case RIGHT_SHIFT_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case LESS_THAN_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case GREATER_THAN_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case LESS_EQUAL_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case GREATER_EQUAL_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case EQUAL_EQUAL_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case NOT_EQUAL_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case XOR_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case BIT_OR_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case AND_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case OR_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case QUESTION_MARK_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case COLON_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case SEMICOLON_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case EQUAL_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case MULT_EQUAL_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case DIVIDE_EQUAL_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case MOD_EQUAL_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case PLUS_EQUAL_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case MINUS_EQUAL_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case LEFT_SHIFT_EQUAL_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case RIGHT_SHIFT_EQUAL_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case BIT_AND_EQUAL_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case XOR_EQUAL_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case BIT_OR_EQUAL_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			case COMMA_PUNC: {
				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
				break;
			}
			default : {
				printf("Error: Unidentified token : %s", yytext);
			}
		}
	}
	
	if (f) {
		fclose (f);
	}

	return 0;
}

