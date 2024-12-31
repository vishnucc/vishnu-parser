all:

	bison -d rules.yy
	flex rules.l
	g++ -o lex_parse lex.yy.c rules.tab.cc -lfl
	./lex_parse < test.v >dump.txt >output.txt
	
clean:
	rm -rf lex.yy.c lex_parse rules.tab.cc rules.tab.hh lexer test.txt 