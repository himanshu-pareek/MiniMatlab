%{
#include <stdio.h>
int yyerror(char*);
extern int yylex(void);
%}

%token KEYWORD_UNSIGNED
%token KEYWORD_BREAK
%token KEYWORD_RETURN
%token KEYWORD_VOID
%token KEYWORD_CASE
%token KEYWORD_FLOAT
%token KEYWORD_SHORT
%token KEYWORD_CHAR
%token KEYWORD_FOR
%token KEYWORD_SIGNED
%token KEYWORD_WHILE
%token KEYWORD_GOTO
%token KEYWORD_BOOL
%token KEYWORD_CONTINUE
%token KEYWORD_IF
%token KEYWORD_DEFAULT
%token KEYWORD_DO
%token KEYWORD_INT
%token KEYWORD_SWITCH
%token KEYWORD_DOUBLE
%token KEYWORD_LONG
%token KEYWORD_ELSE
%token KEYWORD_MATRIX
%token IDENTIFIER
%token INTEGER_CONSTANT
%token FLOATING_CONSTANT
%token CHARACTER_CONSTANT
%token ZERO_CONSTANT
%token STRING_LITERAL
%token LEFT_SQUARE_BRAC_PUNC
%token LEFT_SMALL_BRAC_PUNC
%token LEFT_CURL_BRAC_PUNC
%token RIGHT_SQUARE_BRAC_PUNC
%token RIGHT_SMALL_BRAC_PUNC
%token RIGHT_CURL_BRAC_PUNC
%token DOT_PUNC
%token ARROW_PUNC
%token INCREMENT_PUNC
%token DECREMENT_PUNC
%token BIT_AND_PUNC
%token MULT_PUNC
%token PLUS_PUNC
%token MINUS_PUNC
%token DIVIDE_PUNC
%token MOD_PUNC
%token LEFT_SHIFT_PUNC
%token RIGHT_SHIFT_PUNC
%token LESS_THAN_PUNC
%token GREATER_THAN_PUNC
%token LESS_EQUAL_PUNC
%token GREATER_EQUAL_PUNC
%token EQUAL_EQUAL_PUNC
%token NOT_EQUAL_PUNC
%token XOR_PUNC
%token BIT_OR_PUNC
%token AND_PUNC
%token OR_PUNC
%token QUESTION_MARK_PUNC
%token COLON_PUNC
%token SEMICOLON_PUNC
%token EQUAL_PUNC
%token MULT_EQUAL_PUNC
%token DIVIDE_EQUAL_PUNC
%token MOD_EQUAL_PUNC
%token PLUS_EQUAL_PUNC
%token MINUS_EQUAL_PUNC
%token LEFT_SHIFT_EQUAL_PUNC
%token RIGHT_SHIFT_EQUAL_PUNC
%token BIT_AND_EQUAL_PUNC
%token XOR_EQUAL_PUNC
%token BIT_OR_EQUAL_PUNC
%token COMMA_PUNC
%token TRANSPOSE_PUNC

%start translation_unit

%%

primary_expression	: IDENTIFIER	{ printf ("primary-expression ==> identifier\n"); }
			| constant	{ printf ("primary-expression ==> constant\n"); }
			| STRING_LITERAL	{ printf ("primary-expression ==> string-literal\n"); }
			| LEFT_SMALL_BRAC_PUNC expression RIGHT_SMALL_BRAC_PUNC	{ printf ("primary-expression ==> ( expression )\n"); }
			;			
			
constant	: INTEGER_CONSTANT { printf ("constant ==> INTEGER_CONSTANT\n"); }
		| FLOATING_CONSTANT { printf ("constant ==> FLOATING_CONSTANT\n"); }
		| CHARACTER_CONSTANT	{ printf ("constant ==> CHARACTER_CONSTANT\n"); }
		| ZERO_CONSTANT	{ printf ("constant ==> ZERO_CONSTANT\n"); }

postfix_expression	: primary_expression	{ printf ("postfix-expression ==> primary-expression\n");  }
			| postfix_expression LEFT_SQUARE_BRAC_PUNC expression RIGHT_SQUARE_BRAC_PUNC	{ printf ("postfix-expression ==> postfix-expression [ expression ]\n");  }
			| postfix_expression LEFT_SMALL_BRAC_PUNC argument_expression_list_opt RIGHT_SMALL_BRAC_PUNC	{ printf ("postfix-expression ==> postfix-expression ( argument-expression-list-opt )\n");  }
			| postfix_expression DOT_PUNC IDENTIFIER	{ printf ("postfix-expression ==> postfix-expression . identifier\n"); }
			| postfix_expression ARROW_PUNC IDENTIFIER	{ printf ("postfix-expression ==> postfix-expression -> identifier\n"); }
			| postfix_expression INCREMENT_PUNC	{ printf ("postfix-expression ==> postfix-expression ++\n");  }
			| postfix_expression DECREMENT_PUNC	{ printf ("postfix-expression ==> postfix-expression --\n");  }
			| postfix_expression TRANSPOSE_PUNC	{ printf ("postfix-expression ==> .'");  }
			;

argument_expression_list_opt	: argument_expression_list	{ printf ("argument-expression-list-opt ==> argument-expression-list\n");  }
				| 	{ printf ("argument-expression-list-opt ==> EMPTY_STRING");  }
				;

argument_expression_list	: assignment_expression		{ printf ("argument-expression-list ==> assignment-expression\n");  }
				| argument_expression_list COMMA_PUNC assignment_expression	{ printf ("argument-expression-list ==> argument-expression-list , assignment-expression\n");  }
				;

unary_expression	: postfix_expression	{ printf ("unary-expression ==> postfix-expression\n");  }
			| INCREMENT_PUNC unary_expression	{ printf ("unary-expression ==> ++ unary-expression\n");  }
			| DECREMENT_PUNC unary_expression	{ printf ("unary-expression ==> -- unary_expression\n");  }
			| unary_operator cast_expression	{ printf ("unary-operator cast-expression\n");  }
			;

unary_operator	: BIT_AND_PUNC	{ printf ("unary-operator ==> &\n");  }
		| MULT_PUNC	{ printf ("unary-operator ==> *\n");  }
		| PLUS_PUNC	{ printf ("unary-operator ==> +\n");  }
		| MINUS_PUNC	{ printf ("unary-operator ==> -\n");  }
		;

cast_expression	: unary_expression	{ printf ("cast-expression ==> unary-expression\n"); }
		;

multiplicative_expression	: cast_expression	{ printf ("multiplicative-expression ==> cast-expression\n"); }
				| multiplicative_expression MULT_PUNC cast_expression	{ printf ("multiplicative-expression ==> multiplicative-expression * cast-expression\n"); }
				| multiplicative_expression DIVIDE_PUNC cast_expression	{ printf ("multiplicative-expression ==> multiplicative-expression / cast-expression\n");  }
				| multiplicative_expression MOD_PUNC cast_expression	{ printf ("multiplicative-expression ==> multiplicative-expression MOD cast-expression\n"); }
				;
				
additive_expression	: multiplicative_expression	{ printf ("additive-expression ==> multiplicative-expression\n"); }
			| additive_expression PLUS_PUNC multiplicative_expression	{ printf ("additive-expression ==> additive-expression + multiplicative-expression\n"); }
			| additive_expression MINUS_PUNC multiplicative_expression	{ printf ("additive-expression ==> additive-expression - multiplicative-expression\n"); }
			;

shift_expression	: additive_expression	{ printf ("shift-expression ==> additive-expression\n"); }
			| shift_expression LEFT_SHIFT_PUNC additive_expression	{ printf ("shift-expression ==> shift-expression << additive-expression\n"); }
			| shift_expression RIGHT_SHIFT_PUNC additive_expression	{ printf ("shift-expression ==> shift-expression >> additive-expression\n"); }
			;

relational_expression	: shift_expression	{ printf ("ralational-expression ==> shift-expression\n"); }
			| relational_expression LESS_THAN_PUNC shift_expression	{ printf ("relational-expression ==> relational-expression < shift-expression\n"); }
			| relational_expression GREATER_THAN_PUNC shift_expression	{ printf ("relational-expression ==> relational-expression > shift-expression\n"); }
			| relational_expression LESS_EQUAL_PUNC shift_expression	{ printf ("relational-expression ==> relational-expression <= shift-expression\n"); }
			| relational_expression GREATER_EQUAL_PUNC shift_expression	{ printf ("relational-expression ==> relational-expression >= shift-expression\n"); }
			;

equality_expression	: relational_expression	{ printf ("equality-expression ==> relartional-expression\n"); }
			| equality_expression EQUAL_EQUAL_PUNC relational_expression	{ printf ("equality-expression ==> equality-expression == relational-expression\n"); }
			| equality_expression NOT_EQUAL_PUNC relational_expression	{ printf ("equality-expression ==> equality-expression != relational-expression\n"); }
			;

AND_expression		: equality_expression	{ printf ("AND-expression ==> equality-expression\n"); }
			| AND_expression BIT_AND_PUNC equality_expression	{ printf ("AND-expression ==> AND-expression equality-expression\n"); }
			;

exclusive_OR_expression	: AND_expression	{ printf ("exclusive-OR-expression ==> AND-expression\n"); }
			| exclusive_OR_expression XOR_PUNC AND_expression	{ printf ("exclusive-OR-expression ==> exclusive-OR-expresssion ^ AND-expression\n"); }
			;

inclusive_OR_expression	: exclusive_OR_expression	{ printf ("inclusive-OR-expression ==> exclusive-OR-expression\n"); }
			| inclusive_OR_expression BIT_OR_PUNC exclusive_OR_expression	{ printf ("inclusive-OR-expression ==> inclusive-OR-expression | exclusive-OR-expression\n"); }
			;

logical_AND_expression	: inclusive_OR_expression	{ printf ("logical-AND-expression ==> inclusive-OR-expression\n"); }
			| logical_AND_expression AND_PUNC inclusive_OR_expression	{ printf ("logical-AND-expression ==> logical-AND-expression && inclusive-OR-expression\n"); }
			;

logical_OR_expression	: logical_AND_expression	{ printf ("logical-OR-expression ==> logical-AND-expression\n"); }
			| logical_OR_expression OR_PUNC logical_AND_expression	{ printf ("logical-OR-expression || logical-AND-expression\n"); }
			;

conditional_expression	: logical_OR_expression	{ printf ("conditional-expression ==> logical-OR-expression\n"); }
			| logical_OR_expression QUESTION_MARK_PUNC expression COLON_PUNC conditional_expression	{ printf ("conditional-expression ==> logical-OR-expression ? expression : conditional-expression\n"); }
			;
			
assignment_operator	: EQUAL_PUNC	{ printf ("assignment-operator ==> =\n"); }
			| MULT_EQUAL_PUNC	{ printf ("assignment-operator ==> *=\n"); }
			| DIVIDE_EQUAL_PUNC	{ printf ("assignment-operator ==> /=\n"); }
			| MOD_EQUAL_PUNC	{ printf ("assignment-operator ==> %%=\n"); }
			| PLUS_EQUAL_PUNC	{ printf ("assignment-operator ==> +=\n"); }
			| MINUS_EQUAL_PUNC	{ printf ("assignment-operator ==> -=\n"); }
			| LEFT_SHIFT_EQUAL_PUNC	{ printf ("assignment-operator ==> <<=\n"); }
			| RIGHT_SHIFT_EQUAL_PUNC	{ printf ("assignment-operator ==> >>=\n"); }
			| BIT_AND_EQUAL_PUNC	{ printf ("assignment-operator ==> &=\n"); }
			| XOR_EQUAL_PUNC	{ printf ("assignment-operator ==> ^=\n"); }
			| BIT_OR_EQUAL_PUNC	{ printf ("assignment-operator ==> |=\n"); }
			;

assignment_expression	: conditional_expression	{ printf ("assignment-expression ==> conditional-expression\n"); }
			| unary_expression assignment_operator assignment_expression	{ printf ("assignment-expression ==> unary-expression assignment-operator assignment-expression\n"); }
			;
		
constant_expression	: conditional_expression	{ printf ("constant-expression ==> conditional-expression\n"); }
			; 
			
expression		: assignment_expression	{ printf ("expression ==> assignment-expression\n"); }
			| expression COMMA_PUNC assignment_expression	{ printf ("expression ==> expression , assignment-expression\n"); }
			;
			

declaration		: declaration_specifiers init_declarator_list_opt SEMICOLON_PUNC	{ printf ("declaration ==> declaration-specifiers init-declarator-list-opt\n"); }
			;

declaration_specifiers	: type_specifier declaration_specifiers_opt	{ printf ("declaration-specifiers ==> type-specifier declaration-specifiers-opt\n"); }
			;

init_declarator_list_opt	: init_declarator_list	{ printf ("init-declarator-list-opt ==> init-declarator-list\n"); }
				| 	{ printf ("init-declarator-list-opt ==> EMPTY_STRING\n"); }
				;

declaration_specifiers_opt	: declaration_specifiers	{ printf ("declaration-specifiers-opt ==> declaration-specifiers\n"); }
				| 	{ printf ("declaration-specifiers-opt ==> EMPTY_STRING\n"); }
				;

init_declarator_list		: init_declarator	{ printf ("init-declarator-list ==> init-declarator\n"); }
				| init_declarator_list COMMA_PUNC init_declarator	{ printf ("init-declarator-list ==> init-declarator-list , init-declarator\n"); }
				;
 
init_declarator		: declarator	{ printf ("init-declarator ==> ceclarator\n"); }
			| declarator EQUAL_PUNC	initializer	{ printf ("init-declarator ==> declarator = initializer\n"); }
			;

type_specifier	: KEYWORD_VOID	{ printf ("type-specifier ==> void\n"); }
		| KEYWORD_CHAR	{ printf ("type-specifier ==> char\n"); }
		| KEYWORD_SHORT	{ printf ("type-specifier ==> short\n"); }
		| KEYWORD_INT	{ printf ("type-specifier ==> int\n"); }
		| KEYWORD_LONG	{ printf ("type-specifier ==> long\n"); }
		| KEYWORD_FLOAT	{ printf ("type-specifier ==> float\n"); }
		| KEYWORD_DOUBLE	{ printf ("type-specifier ==> double\n"); }
		| KEYWORD_MATRIX	{ printf ("type-specifier ==> Matrix\n"); }
		| KEYWORD_SIGNED	{ printf ("type-specifier ==> signed\n"); }
		| KEYWORD_UNSIGNED	{ printf ("type-specifier ==> unsigned\n"); }
		| KEYWORD_BOOL	{ printf ("type-specifier ==> Bool\n"); }
		;

declarator	: pointer_opt direct_declarator	{ printf ("declarator ==> pointer-opt direct-declarator\n"); }
		;


pointer_opt	: pointer	{ printf ("pointer-opt ==> pointer\n"); }
		| 	{ printf ("pointer-opt ==> EMPTY_STRING\n"); }
		;
	

direct_declarator	: IDENTIFIER	{ printf ("direct-declarator ==> identifier\n"); }
			| LEFT_SMALL_BRAC_PUNC declarator RIGHT_SMALL_BRAC_PUNC	{ printf ("direct-declarator ==> ( declarator )\n"); }
			| direct_declarator LEFT_SQUARE_BRAC_PUNC assignment_expression_opt RIGHT_SQUARE_BRAC_PUNC	{ printf ("direct-declarator ==> direct-declarator [ assignment-expression-opt ]\n"); }
			| direct_declarator LEFT_SMALL_BRAC_PUNC parameter_type_list RIGHT_SMALL_BRAC_PUNC	{ printf ("direct-declarator ==> direct-declarator ( parameter-type-list )\n"); }
			| direct_declarator LEFT_SMALL_BRAC_PUNC identifier_list_opt RIGHT_SMALL_BRAC_PUNC	{ printf ("direct-declarator ==> direct-declarator ( identifier-list-opt )\n"); }
			;

assignment_expression_opt	: assignment_expression	{ printf ("assignment-expression-opt ==> assignment-expression\n"); }
				| 	{ printf ("assignment-expression-opt ==> EMPTY_STRING\n"); }
				;

identifier_list_opt	: identifier_list	{ printf ("identifier-list-opt ==> identifier-list\n"); }
			| 	{ printf ("identifier-list-opt ==> EMPTY-STRING\n"); }
			;

pointer			: MULT_PUNC pointer_opt	{ printf ("pointer ==> * pointer-opt\n"); }
			;

parameter_type_list	: parameter_list	{ printf ("parameter-type-list ==> parameter-list\n"); }
			;

parameter_list	: parameter_declaration	{ printf ("parameter-list ==> parameter-declaration\n"); }
		| parameter_list COMMA_PUNC parameter_declaration	{ printf ("parameter-list ==> parameter-list , parameter-declaration\n"); }
		;

parameter_declaration	: declaration_specifiers declarator	{ printf ("parameter-declaration ==> declaration-specifiers declarator\n"); }
			| declaration_specifiers	{ printf ("parameter-declaration ==> declaration-specifiers\n"); }
			;

identifier_list	: IDENTIFIER	{ printf ("identifier-list ==> identifier\n"); }
		| identifier_list COMMA_PUNC IDENTIFIER	{ printf ("identifier-list ==> identifier_list , identifier\n"); }
		;

initializer	: assignment_expression	{ printf ("initializer ==> assignment-expression\n"); }
		| LEFT_CURL_BRAC_PUNC initializer_row_list RIGHT_CURL_BRAC_PUNC	{ printf ("initializer ==> { initializer-row-list }\n"); }
		;

initializer_row_list	: initializer_row	{ printf ("initializer-row-list ==> initializer-row\n"); }
			| initializer_row_list SEMICOLON_PUNC initializer_row	{ printf ("initializer-row-list ==> initializer-row-list ; initializer-row"); }
			;

initializer_row	: designation_opt initializer	{ printf ("initializer-row ==> designation-opt initializer\n"); }
		| initializer_row COMMA_PUNC designation_opt initializer	{ printf ("initializer-row ==> initializer-row , designation-opt initializer\n"); }
		;

designation_opt	: designation	{ printf ("designation-opt ==> designation\n"); }
		| 	{ printf ("designation_opt ==> EMPTY_STRING\n"); }
		;

designation	: designator_list EQUAL_PUNC	{ printf ("designation ==> designator-list =\n"); }
		;

designator_list	: designator	{ printf ("designatior-list ==> designator\n"); }
		| designator_list designator	{ printf ("designator-list ==> designator-list designator\n"); }
		;

designator	: LEFT_SQUARE_BRAC_PUNC constant_expression RIGHT_SQUARE_BRAC_PUNC { printf ("designator ==> [ constant-expression ]\n"); }
		| DOT_PUNC IDENTIFIER	{ printf ("designator ==> . identifier\n"); }
		;

statement	: labeled_statement	{ printf ("statement ==> labeled-statement\n"); }
		| compound_statement	{ printf ("stetement ==> compound-statement\n"); }
		| expression_statement	{ printf ("stetement ==> expression-statement\n"); }
		| selection_statement	{ printf ("stetement ==> selection-statement\n"); }
		| iteration_statement	{ printf ("stetement ==> iteration-statement\n"); }
		| jump_statement	{ printf ("stetement ==> jump-statement\n"); }
		;

labeled_statement	: IDENTIFIER COLON_PUNC	statement	{ printf ("labeled-statement ==> identifier : statement\n"); }
			| KEYWORD_CASE constant_expression COLON_PUNC statement	{ printf ("labeled-statement ==> case constant-expression : statement\n"); }
			| KEYWORD_DEFAULT COLON_PUNC statement	{ printf ("labeled-statement ==> default : statement"); }
			;

compound_statement	: LEFT_CURL_BRAC_PUNC block_item_list_opt RIGHT_CURL_BRAC_PUNC	{ printf ("compound-statement ==> { block-item-list-opt }\n"); }
			;

block_item_list_opt	: block_item_list	{ printf ("block-item-list-opt ==> block-item-list\n"); }
			| 	{ printf ("block-item-list-opt ==> EMPTY_STRING\n"); }
			;

block_item_list		: block_item	{ printf ("block-item-list ==> block-item\n"); }
			| block_item_list block_item	{ printf ("block-item-list ==> block-item-list block-item\n"); }
			;

block_item	: declaration	{ printf ("block-item ==> declaration\n"); }
		| statement	{ printf ("block-item ==> statement\n"); }
		;

expression_statement	: expression_opt SEMICOLON_PUNC	{ printf ("expression-statement ==> expression-opt ;\n"); }  
			;

expression_opt	: expression	{ printf ("expression-opt ==> expression\n"); }
		| 	{ printf ("expression-opt ==> EMPTY_STRING\n"); }
		;

selection_statement	: KEYWORD_IF LEFT_SMALL_BRAC_PUNC expression RIGHT_SMALL_BRAC_PUNC statement	{ printf ("selection-statement ==> if ( expression ) statement\n"); }
			| KEYWORD_IF LEFT_SMALL_BRAC_PUNC expression RIGHT_SMALL_BRAC_PUNC statement KEYWORD_ELSE statement	{ printf ("selection-statement ==> if ( expression) statement else statement\n"); }
			| KEYWORD_SWITCH LEFT_SMALL_BRAC_PUNC expression RIGHT_SMALL_BRAC_PUNC statement	{ printf ("selection-statement ==> switch ( expression ) statement\n"); }
			;

iteration_statement	: KEYWORD_WHILE LEFT_SMALL_BRAC_PUNC expression RIGHT_SMALL_BRAC_PUNC statement	{ printf ("iteration-statement ==> while ( expression ) statement\n"); }
			| KEYWORD_DO statement KEYWORD_WHILE LEFT_SMALL_BRAC_PUNC expression RIGHT_SMALL_BRAC_PUNC SEMICOLON_PUNC	{ printf ("iteration-statement ==> do statement while ( expression ) ;\n"); }
			| KEYWORD_FOR LEFT_SMALL_BRAC_PUNC expression_opt SEMICOLON_PUNC expression_opt SEMICOLON_PUNC expression_opt RIGHT_SMALL_BRAC_PUNC statement	{ printf ("iteration-statement ==> for ( expression-opt ; expression-opt ; expression-opt ) statement\n"); }
			| KEYWORD_FOR LEFT_SMALL_BRAC_PUNC declaration expression_opt SEMICOLON_PUNC expression_opt RIGHT_SMALL_BRAC_PUNC statement	{ printf ("iteration-statement ==> for ( declaration expression-opt ; expression ) statement\n"); }
			;

jump_statement	: KEYWORD_GOTO IDENTIFIER SEMICOLON_PUNC	{ printf ("jump-statement ==> goto identifier ;\n"); }
		| KEYWORD_CONTINUE SEMICOLON_PUNC	{ printf ("jump-statement ==> continue ;\n"); }
		| KEYWORD_BREAK SEMICOLON_PUNC	{ printf ("jump-statement ==> break ;\n"); }
		| KEYWORD_RETURN expression_opt SEMICOLON_PUNC	{ printf ("jump-statement ==> return expression-opt ;	\n"); }
		;

translation_unit	: external_declaration	{ printf ("translation-unit ==> external-declaration\n"); }
			| translation_unit external_declaration	{ printf ("translation-unit ==> translation-unit external-declaration\n"); }
			;

external_declaration	: function_definition	{ printf ("external-declaration ==> function-declaration\n"); }
			| declaration	{ printf ("external-declaration ==> declaration\n"); }
			;

function_definition	: declaration_specifiers declarator declaration_list_opt compound_statement	{ printf ("function-declaration ==> declaration-specifiers declarator declaration-list-opt compound-statement\n"); }
			;

declaration_list_opt	: declaration_list	{ printf ("declaration-list-opt ==> declaration-list\n"); }
			| 	{ printf ("declaration-list-opt ==> EMPTY_STRING\n"); }
			;

declaration_list	: declaration	{ printf ("declaration-list ==> declaration\n"); }
			| declaration_list declaration	{ printf ("declaration-list ==> declaration-list declaration\n"); }
			;

%%

int yyerror (char* s) {
	printf ("Parser Error : %s\n", s);
	return -1;
}




