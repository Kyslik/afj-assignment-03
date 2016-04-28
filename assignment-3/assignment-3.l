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
    #define SLB         34
    #define SRB         35
    #define STWODOTS    36
    #define SDOT        37
    #define SCOMMA      38
    #define SSEMICOLON  39
    #define SCOLON      40

    #define IDENTIFIER  41
    #define CONSTANT    42
    #define NADA        43

    #define CONSTINT    1
    #define CONSTREAL   2
    #define CONSTBOOL   3

    int type;
    void t(int t);
%}

ID      [[:alpha:]][[:alnum:]]*


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


"+"                                     {t(0); return OPLUS;}
"-"                                     {t(0); return OMINUS;}
"*"                                     {t(0); return OMULTIPLY;}
"/"                                     {t(0); return ODIVIDE;}
[Mm][Oo][Dd]                            {t(0); return OMOD;}
[Aa][Nn][Dd]                            {t(0); return OAND;}
[Oo][Rr]                                {t(0); return OOR;}
[Nn][Oo][Tt]                            {t(0); return ONOT;}
"<"                                     {t(0); return OLT;}
"<="                                    {t(0); return OLE;}
">"                                     {t(0); return OGT;}
">="                                    {t(0); return OGE;}
"="                                     {t(0); return OEQ;}
"<>"                                    {t(0); return ONE;}
":="                                    {t(0); return OASSIGNMENT;}

"("                                     {t(0); return SLROUNDB;}
")"                                     {t(0); return SRROUNDB;}
"["                                     {t(0); return SLB;}
"]"                                     {t(0); return SRB;}
".."                                    {t(0); return STWODOTS;}
"."                                     {t(0); return SDOT;}
","                                     {t(0); return SCOMMA;}
";"                                     {t(0); return SSEMICOLON;}
":"                                     {t(0); return SCOLON;}

[+-]?[[:digit:]]+                       {t(CONSTINT); return CONSTANT;}
[+-]?[[:digit:]]+"."[[:digit:]]         {t(CONSTREAL); return CONSTANT;}
[Tt][Rr][Uu][Ee]|[Ff][Aa][Ll][Ss][Ee]   {t(CONSTBOOL); return CONSTANT;}


{ID}                                    {t(0); return IDENTIFIER;}

.                                       {t(0); return NADA;}

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
