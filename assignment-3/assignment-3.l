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
    void t(int t);
%}

%%
[ \t\r\n\f]+                            {}
[Bb][Ee][Gg][Ii][Nn]                    {t(0); return KWBEGIN;}
[Ee][Nn][Dd]                            {t(0); return KWEND;}
[Ii][Ff]                                {t(0); return KWIF;}
[Tt][Hh][Ee][Nn]                        {t(0); return KWTHEN;}
[Ww][Hh][Ii][Ll][Ee]                    {t(0); return KWWHILE;}
[Dd][Oo]                                {t(0); return KWDO;}
[Pp][Rr][Oo][Cc][Ee][Dd][Uu][Rr][Ee]    {t(0); return KWPROCEDURE;}
[Ff][Uu][Nn][Cc][Tt][Ii][Oo][Nn]        {t(0); return KWFUNCTION;}
[Ii][Nn][Tt][Ee][Gg][Ee][Rr]            {t(0); return KWINTEGER;}
[Rr][Ee][Aa][Ll]                        {t(0); return KWREAL;}
[Bb][Oo][Oo][Ll][Ee][Aa][Nn]            {t(0); return KWBOOLEAN;}
[Tt][Yy][Pp][Ee]                        {t(0); return KWTYPE;}
[Vv][Aa][Rr]                            {t(0); return KWVAR;}
[Aa][Rr][Rr][Aa][Yy]                    {t(0); return KWARRAY;}
[Oo][Ff]                                {t(0); return KWOF;}
[Rr][Ee][Cc][Oo][Rr][Dd]                {t(0); return KWRECORD;}
%%

void t(int t)
{
    type = t;
}

int main(void)
{
    int l;
    printf("Lexeme Code\t\tType Code\t\tText\n");

    while ((l = yylex()) > 0)
    {
        printf("%d\t\t\t\t%d\t\t\t%s\n", l, type, yytext);
    }
    return 1;
}
