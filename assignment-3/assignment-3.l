%option noyywrap
%{
    #define KWBEGIN     1
    #define KWEND       2
    #define KWIF        3
    #define KWTHEN      4
    #define KWWHILE     5
    #define KWDO        6
    #define KWPROCEDURE 7
    #define KWFUNCTION  8
    #define KWINTEGER   9
    #define KWREAL      10
    #define KWBOOLEAN   11
    #define KWTYPE      12
    #define KWVAR       13
    #define KWARRAY     14
    #define KWOF        15
    #define KWRECORD    16

    #define OPLUS       17
    #define OMINUS      18
    #define OMULTIPLY   19
    #define ODIVIDE     20
    #define OMOD        21
    #define OAND        22
    #define OOR         23
    #define ONOT        24
    #define OLT         25
    #define OLE         26
    #define OGT         27
    #define OGE         28
    #define OEQ         29
    #define ONE         30
    #define OASSIGNMENT 31

    #define SLROUNDB    32
    #define SRROUNDB    33
    #define SRB         34
    #define SLB         35
    #define STWODOTS    36
    #define SDOT        37
    #define SCOMMA      38
    #define SSEMICOLON  39
    #define SCOLON      40

    #define IDENTIFIER  41
    #define CONSTANT    42

    #define CONSTINT    1
    #define CONSTREAL   2
    #define CONSTBOOL   3

    int type;
    void z(void);
%}

%%
[ \t\r\n\f]+                {}
[Bb][Ee][Gg][Ii][Nn]		{z(); return (KWBEGIN);}
[Ee][Nn][Dd]                {z(); return (KWEND);}

%%

void z(void)
{
    type = 0;
}

int main(void)
{
    int l;
    printf("Lexeme Code\t\tType Code\t\tText\n");

    while ((l = yylex()) > 0)
    {
        printf("%d\t\t\t%d\t\t\t%s\n", l, type, yytext);
    }
    return 1;
}
