/* recognize tokens for the calculator */

%{
#include "token.h"
#include <stdio.h>
#include <stdlib.h>
%}

%option noyywrap nodefault yylineno
%start initial

%%
[0-9]+  { return NUMBER; }
\+      { return PLUS; }
\-      { return MINUS; }
\*      { return TIMES; }
\/      { return DIVIDE; }
\(      { return OPEN_PAREN; }
\)      { return CLOSE_PAREN; }
[\r\n\t\f\v ]+      { return WHITESPACE; }
.       { return ERROR; }
%%

int main(int argc, char **argv) {
    int token;
    while ((token = yylex()) != 0) {
        switch (token) {
            case NUMBER:
                printf("NUMBER\n");
                break;
            case PLUS:
                printf("PLUS\n");
                break;
            case MINUS:
                printf("MINUS\n");
                break;
            case TIMES:
                printf("TIMES\n");
                break;
            case DIVIDE:
                printf("DIVIDE\n");
                break;
            case OPEN_PAREN:
                printf("OPEN_PAREN\n");
                break;
            case CLOSE_PAREN:
                printf("CLOSE_PAREN\n");
                break;
            case WHITESPACE: 
                printf("WHITESPACE\n");
                break;
            default:
                printf("???\n");
        }
    }
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}


