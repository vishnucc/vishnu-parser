all:	
	flex lex_sdc.l
	g++ -o sdc lex.yy.c -lfl
	./sdc

clean: