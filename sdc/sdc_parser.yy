%{
    #include <iostream>
    #include <string>
    extern char* yytext;
    extern int yylex();
    extern void yyerror(const char *s);

%}




void yyerror(const char* s)
{
    std::cerr << "Error: " << s << std::endl;
}

