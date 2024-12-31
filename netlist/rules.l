%{
    #include <iostream>
    #include <string>
    #include "rules.tab.hh"
    
%}
%option yylineno 


%%
\/\/.* ;                       // Skip line if start with //
\/.* ;
^#.*
endmodule   { return ENDMODULE; }
input {return INPUT;}
output {return OUTPUT;}
wire    {return WIRE;}
module  {  return MODULE;}
","     { return COMMA;} 
";"     { return SEMICOLAN;}
"("     { return LPAREN;}
")"     { return RPAREN;}
":"     {return COLON;}
"."     { return DOT;}
[a-zA-Z0-9_]+ { yylval.str = new std::string(yytext);return IDENTIFIER;}

[\t\n\r] {}
.              {}
%%


 int yywrap() {  // Ensure yywrap() is defined for Flex to avoid issues
        return 1;  // Return 1 to indicate end of input
    }