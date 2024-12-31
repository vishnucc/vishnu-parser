%{
    #include <iostream>
    #include <string>    
    
    void yyerror(const char* s)
    {
        std:: cout << "Error -> " << s << std::endl;
    }
%}


%%
set {}
","     { } 
";"     { }
[0-9]+ { std:: cout << "period ->" << yytext << std:: endl;}
\#.* {std:: cout << "comment" << std::endl;}
\/\/.* {}

[\t\n\r] {}
. {}
%%

int main(){
    yylex();
    return 0;
}

 int yywrap() {  // Ensure yywrap() is defined for Flex to avoid issues
        return 1;  // Return 1 to indicate end of input
 }
