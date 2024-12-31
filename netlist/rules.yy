%{
    #include <iostream>
    #include <string>
    #include <set>
    #include <vector>
 
    extern char* yytext;  // Declare yytext (defined by Flex)
    extern int yylex(); 
    extern void yyerror(const char *s);
    extern int yylineno;

%}
%union{
  int ival;
  std::string *str;
}

%token <str> MODULE IDENTIFIER INPUT OUTPUT SEMICOLAN LPAREN RPAREN COMMA ENDMODULE WIRE COLON DOT


%start netlist
%%

netlist:
    modules
    ;

modules:
    module
    | modules module
    ;


module:
    MODULE IDENTIFIER LPAREN ports_list RPAREN SEMICOLAN input_output_ports wires_declarations instance_declarations ENDMODULE
        {
            std::cout << *$2 << std::endl;  
        }
    |
    MODULE IDENTIFIER input_output_ports wires_declarations instance_declarations ENDMODULE
        {
            std::cout << *$2 << std::endl;
        }

input_output_ports:
    input_ports_ output_ports_
    |input_ports_
    |output_ports_
    ;

input_ports_:
    // INPUT width ports_list SEMICOLAN
    // |
    INPUT ports_list SEMICOLAN
    
    ;

output_ports_:
    // OUTPUT width ports_list SEMICOLAN
    // |
    OUTPUT ports_list SEMICOLAN
    //add output_ports function;
    ;
ports_list:
    port
    |ports_list COMMA port
    ;

port:
    IDENTIFIER{
            
    }
    ;

wires_declarations:
    WIRE wire_declaration SEMICOLAN
    ;


wire_declaration:
    wire
    |wire_declaration COMMA wire
    ;
    
wire:
    IDENTIFIER
   ;

instance_declarations:
    /* empty */
    instance_declaration
    |instance_declarations instance_declaration
    ;

instance_declaration:
    IDENTIFIER IDENTIFIER LPAREN pins_declaration RPAREN SEMICOLAN
    {
        std:: cout << *$1 << "------>" << *$2 << " ----->" << std::endl;
    }
    ;

pins_declaration:
    pin_declaration
    | pins_declaration COMMA pin_declaration
    ;

pin_declaration:
    DOT IDENTIFIER LPAREN IDENTIFIER RPAREN
    {
         std::cout << "Pin: " << *$2 << " & Net: " << *$4 << std::endl;
    }
    |DOT IDENTIFIER LPAREN  RPAREN
    {
         std::cout << "Pin: " << *$2 << " & Net: " << *$4 << std::endl;
    }
%%

int main() {
    yyparse();  // Start parsing

}

void yyerror(const char *s) {
    std::cerr << "Error: " << s << " at line - "<< yylineno << " near " <<yylex <<  (yytext  ? yytext : "EOF")<<std::endl;
}