%{
    #include <iostream>
    #include <string>
    #include <vector>
    #include <set>
    extern char* yytext;  // Declare yytext (defined by Flex)
    extern int yylex(); 
    extern void yyerror(const char *s);
    extern int yylineno;

    #include "./objects/util.hh"

    std::vector<Modules*> modules_list;\
    std::set<std::string> ports_;
    std::vector<std::string> input_ports_;
    std::vector<std::string> output_ports_;
    std::vector<std::string> wires_;
    Modules* current_module = nullptr; 

%}
%union{
  int ival;
  std::string *str;
}

%token <str> MODULE IDENTIFIER INPUT OUTPUT SEMICOLAN LPAREN RPAREN COMMA ENDMODULE WIRE


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
    MODULE IDENTIFIER LPAREN ports_list RPAREN SEMICOLAN input_output_ports wires_declarations ENDMODULE
        {
            current_module = new Modules(*$2);
            /* if(current_module!=nullptr){std::cout<< "module  created properly ********************"<< current_module->getModuleName() << std ::endl;} */
            modules_list.push_back(current_module);
            for (const auto& port : ports_) {
                current_module->addports(port);
            }
            ports_.clear();

            for (const auto& wire : wires_) {
                current_module->addWire(wire);
            }
            wires_.clear();
            
        }
    |
    MODULE IDENTIFIER input_output_ports wires_declarations ENDMODULE
    {
        current_module = new Modules(*$2);
        modules_list.push_back(current_module);
    
        for (const auto& port : ports_) {
            current_module->addports(port);
        }
        ports_.clear();
        
        for (const auto& wire : wires_) {
            current_module->addWire(wire);
        }
        wires_.clear();
    }

input_output_ports:
    input_ports_ output_ports_
    |input_ports_
    |output_ports_
    ;

input_ports_:
    INPUT ports_list SEMICOLAN
    ;

output_ports_:
    OUTPUT ports_list SEMICOLAN
    ;
ports_list:
    port
    |ports_list COMMA port
    ;

port:
    IDENTIFIER{
        ports_.insert(*$1);     
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
    {
        wires_.push_back(*$1);
    }
%%

int main() {
    yyparse();  // Start parsing

    nlohmann::json all_modules_json;
    for (const auto& mod : modules_list)
    {
        all_modules_json.push_back(mod->toJson());
    }

    // Print the JSON representation of all modules
    std::cout << all_modules_json.dump(4) << std::endl;

    
    // Clean up allocated modules
    for (auto& mod : modules_list)
    {
        delete mod;
    }

    return 0;
}

void yyerror(const char *s) {
    std::cerr << "Error: " << s << "  "<< yylineno << yytext <<std::endl;
}