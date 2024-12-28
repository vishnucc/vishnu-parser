#include "rules.tab.hh" // This header is generated by Bison
#include <iostream>
#include <string>

// Call yyparse from another cpp file
extern int yyparse();
extern FILE *yyin;

int main(int argc, char *argv[]) {
    if (argc > 1) {
        yyin = fopen(argv[1], "r"); // Open input file for lexing
        if (!yyin) {
            std::cerr << "Failed to open input file." << std::endl;
            return 1;
        }
    }
    int result = yyparse(); // Call the parser function
    return result;
}
