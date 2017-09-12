%{
#include "ass3_15CS30016.tab.c"
%}

%option nounput yylineno
%x comment

UNSIGNED	"unsigned"
BREAK		"break"
RETURN		"return"
VOID		"void"
CASE		"case"
FLOAT		"float"
SHORT		"short"
CHAR		"char"
FOR		"for"
SIGNED		"signed"
WHILE		"while"
GOTO		"goto"
BOOL		"Bool"
CONTINUE	"continue"
IF		"if"
DEFAULT		"default"
DO		"do"
INT		"int"
SWITCH		"switch"
DOUBLE		"double"
LONG		"long"
ELSE		"else"
MATRIX		"Matrix"
IDENTIFIER	[_a-zA-Z][_a-zA-Z0-9]*
ZERO_CONSTANT	"0"
DIGIT		[0-9]
NONZERO_DIGIT	[1-9]
INTEGER_CONSTANT	[1-9][0-9]*
DIGIT_SEQUENCE	[0-9]+
FRACTIONAL_CONSTANT	(({DIGIT_SEQUENCE})?\.{DIGIT_SEQUENCE})|({DIGIT_SEQUENCE}\.)
SIGN		[+-]
EXPONENT_PART	[Ee]({SIGN})?{DIGIT_SEQUENCE}
FLOATING_CONSTANT	({FRACTIONAL_CONSTANT}({EXPONENT_PART})?)|({DIGIT_SEQUENCE}{EXPONENT_PART})
ESCAPE_SEQUENCE	("\\n")|("\\a")|("\\b")|("\\f")|("\\r")|("\\t")|("\\v")|("\\?")|("\\'")|("\\\"")|("\\\\")
C_CHAR		([^("\\")("\n")("\'")])|{ESCAPE_SEQUENCE}
C_CHAR_SEQUENCE	{C_CHAR}+
CHARACTER_CONSTANT	"\'"{C_CHAR_SEQUENCE}"\'"
STRING_LITERAL	"\""{C_CHAR_SEQUENCE}?"\""
LEFT_SQUARE_BRAC_PUNC	"["
RIGHT_SQUARE_BRAC_PUNC	"]"
LEFT_SMALL_BRAC_PUNC	"("
RIGHT_SMALL_BRAC_PUNC	")"
LEFT_CURL_BRAC_PUNC	"{"
RIGHT_CURL_BRAC_PUNC	"}"
TRANSPOSE_PUNC		".\'"
DOT_PUNC		"."
ARROW_PUNC		"->"
INCREMENT_PUNC		"++"
DECREMENT_PUNC		"--"
BIT_AND_PUNC		"&"
MULT_PUNC		"*"
PLUS_PUNC		"+"
MINUS_PUNC		"-"
NEGATION_PUNC		"~"
NOT_PUNC		"!"
DIVIDE_PUNC		"/"
MOD_PUNC		"%"
LEFT_SHIFT_PUNC		"<<"
RIGHT_SHIFT_PUNC	">>"
LESS_THAN_PUNC		"<"
GREATER_THAN_PUNC	">"
LESS_EQUAL_PUNC		"<="
GREATER_EQUAL_PUNC	">="
EQUAL_EQUAL_PUNC	"=="
NOT_EQUAL_PUNC		"!="
XOR_PUNC		"^"
BIT_OR_PUNC		"|"
AND_PUNC		"&&"
OR_PUNC			"||"
QUESTION_MARK_PUNC	"?"
COLON_PUNC		":"
SEMICOLON_PUNC		";"
EQUAL_PUNC		"="
MULT_EQUAL_PUNC		"*="
DIVIDE_EQUAL_PUNC	"/="
MOD_EQUAL_PUNC		"%="
PLUS_EQUAL_PUNC		"+="
MINUS_EQUAL_PUNC	"-="
LEFT_SHIFT_EQUAL_PUNC	"<<="
RIGHT_SHIFT_EQUAL_PUNC	">>="
BIT_AND_EQUAL_PUNC	"&="
XOR_EQUAL_PUNC		"^="
BIT_OR_EQUAL_PUNC	"|="
COMMA_PUNC		","
HASTAG_PUNC		"#"
SINGLE_LINE_COMMENT	"//"[^\r\n]*[\r\n]
WHITESPACE		[ \t\n]

%%

{UNSIGNED}				{ return KEYWORD_UNSIGNED; }
{BREAK}					{ return KEYWORD_BREAK; }
{RETURN}				{ return KEYWORD_RETURN; }
{VOID}					{ return KEYWORD_VOID; }
{CASE}					{ return KEYWORD_CASE; }
{FLOAT}					{ return KEYWORD_FLOAT; }
{SHORT}					{ return KEYWORD_SHORT; }
{CHAR}					{ return KEYWORD_CHAR; }
{FOR}					{ return KEYWORD_FOR; }
{SIGNED}				{ return KEYWORD_SIGNED; }
{WHILE}					{ return KEYWORD_WHILE; }
{GOTO}					{ return KEYWORD_GOTO; }
{BOOL}					{ return KEYWORD_BOOL; }
{CONTINUE}				{ return KEYWORD_CONTINUE; }
{IF}					{ return KEYWORD_IF; }
{DEFAULT}				{ return KEYWORD_DEFAULT; }
{DO}					{ return KEYWORD_DO; }
{INT}					{ return KEYWORD_INT; }
{SWITCH}				{ return KEYWORD_SWITCH; }
{DOUBLE}				{ return KEYWORD_DOUBLE; }
{LONG}					{ return KEYWORD_LONG; }
{ELSE}					{ return KEYWORD_ELSE; }
{MATRIX}				{ return KEYWORD_MATRIX; }
{IDENTIFIER}				{ return IDENTIFIER; }
{INTEGER_CONSTANT}			{ return INTEGER_CONSTANT; }
{FLOATING_CONSTANT}			{ return FLOATING_CONSTANT; }
{CHARACTER_CONSTANT}			{ return CHARACTER_CONSTANT; }
{ZERO_CONSTANT}				{ return ZERO_CONSTANT; }
{STRING_LITERAL}			{ return STRING_LITERAL; }
{LEFT_SQUARE_BRAC_PUNC}			{ return LEFT_SQUARE_BRAC_PUNC; }
{RIGHT_SQUARE_BRAC_PUNC}		{ return RIGHT_SQUARE_BRAC_PUNC; }
{LEFT_SMALL_BRAC_PUNC}			{ return LEFT_SMALL_BRAC_PUNC; }
{RIGHT_SMALL_BRAC_PUNC}			{ return RIGHT_SMALL_BRAC_PUNC; }
{LEFT_CURL_BRAC_PUNC}			{ return LEFT_CURL_BRAC_PUNC; }
{RIGHT_CURL_BRAC_PUNC}			{ return RIGHT_CURL_BRAC_PUNC; }
{DOT_PUNC}				{ return DOT_PUNC; }
{ARROW_PUNC}				{ return ARROW_PUNC; }
{INCREMENT_PUNC}			{ return INCREMENT_PUNC; }
{DECREMENT_PUNC}			{ return DECREMENT_PUNC; }
{BIT_AND_PUNC}				{ return BIT_AND_PUNC; }
{MULT_PUNC}				{ return MULT_PUNC; }
{PLUS_PUNC}				{ return PLUS_PUNC; }
{MINUS_PUNC}				{ return MINUS_PUNC; }
{NEGATION_PUNC}				{ /* printf ("<NEGATION PUNCTUATOR>\n"); */ }
{NOT_PUNC}				{ /* printf ("<NOT PUNCTUATION>\n"); */ }
{DIVIDE_PUNC}				{ return DIVIDE_PUNC; }
{MOD_PUNC}				{ return MOD_PUNC; }
{LEFT_SHIFT_PUNC}			{ return LEFT_SHIFT_PUNC; }
{RIGHT_SHIFT_PUNC}			{ return RIGHT_SHIFT_PUNC; }
{LESS_THAN_PUNC}			{ return LESS_THAN_PUNC; }
{GREATER_THAN_PUNC}			{ return GREATER_THAN_PUNC; }
{LESS_EQUAL_PUNC}			{ return LESS_EQUAL_PUNC; }
{GREATER_EQUAL_PUNC}			{ return GREATER_EQUAL_PUNC; }
{EQUAL_EQUAL_PUNC}			{ return EQUAL_EQUAL_PUNC; }
{NOT_EQUAL_PUNC}			{ return NOT_EQUAL_PUNC; }
{XOR_PUNC}				{ return XOR_PUNC; }
{BIT_OR_PUNC}				{ return BIT_OR_PUNC; }
{AND_PUNC}				{ return AND_PUNC; }
{OR_PUNC}				{ return OR_PUNC; }
{QUESTION_MARK_PUNC}			{ return QUESTION_MARK_PUNC; }
{COLON_PUNC}				{ return COLON_PUNC; }
{SEMICOLON_PUNC}			{ return SEMICOLON_PUNC; }
{EQUAL_PUNC}				{ return EQUAL_PUNC; }
{MULT_EQUAL_PUNC}			{ return MULT_EQUAL_PUNC; }
{DIVIDE_EQUAL_PUNC}			{ return DIVIDE_EQUAL_PUNC; }
{MOD_EQUAL_PUNC}			{ return MOD_EQUAL_PUNC; }
{PLUS_EQUAL_PUNC}			{ return PLUS_EQUAL_PUNC; }
{MINUS_EQUAL_PUNC}			{ return MINUS_EQUAL_PUNC; }
{LEFT_SHIFT_EQUAL_PUNC}			{ return LEFT_SHIFT_EQUAL_PUNC; }
{RIGHT_SHIFT_EQUAL_PUNC}		{ return RIGHT_SHIFT_EQUAL_PUNC; }
{BIT_AND_EQUAL_PUNC}			{ return BIT_AND_EQUAL_PUNC; }
{XOR_EQUAL_PUNC}			{ return XOR_EQUAL_PUNC; }
{BIT_OR_EQUAL_PUNC}			{ return BIT_OR_EQUAL_PUNC; }
{COMMA_PUNC}				{ return COMMA_PUNC; }
{TRANSPOSE_PUNC}				{ return TRANSPOSE_PUNC; }
{HASTAG_PUNC}				{ /* printf ("<HASTAG PUNCTUATOR>\n"); */ }
{SINGLE_LINE_COMMENT}			{ /* printf ("<SINGLE LINE COMMENT>\n"); */ }
"/*"					BEGIN(comment);
<comment>[^*\n]*			/* comment */
<comment>"*"+[^*/\n]*			/* comment */
<comment>\n				/* comment */
<comment>"*"+"/"			BEGIN(INITIAL); { /* printf ("<MULTILINE_COMMENT>\n"); */ }
{WHITESPACE}				{ /* Ignore whitespace */ }

%%

int yywrap (void) {
	return 1;
}

