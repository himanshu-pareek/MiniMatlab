#include "lex.yy.c"

int main (int argc, char* argv[]) {
	int what;
	while (what = yyparse()) {
		if (what < 0) break;
	};
	return 0;
}


