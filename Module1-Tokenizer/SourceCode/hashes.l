%{
#include<bits/stdc++.h>
using namespace std;
char res[100],file_name[100],file_name_ext[100],dest_file_name[100];
int line_count = 1;
%}

letter [a-zA-Z_.]
digit [0-9]
number {digit}+
id {letter}({letter}|{digit})*
tag ({letter}|{digit})+
delim [ \t]
hash [ \n]"#"{tag}{delim}
mention [^{letter}|^{digit}]"@"{tag}{delim}
punctuation [.!?`,;:#@]+
caps [ ][A-Z]+[ ]
first [ ][A-Z][a-z]+{punctuation}[ ]


%%

^{number}"LIKES " {
        int i=0;
        while(yytext[i]!='L'){
                fprintf(yyout,"%d",yytext[i++]-48);
        }
        fprintf(yyout,";");
        yyless(yyleng-1);
}

{mention} {
        yyless(yyleng-1);
}
{caps} {
        fprintf(yyout," ");
        yyless(yyleng-1);
}
{first} {
        yyless(yyleng-1);
}
{punctuation} {
        fprintf(yyout," ");
}
"\n" {fprintf(yyout,";%d\n",line_count++);}
"\n." ;
. { fprintf(yyout,"%s",yytext); }
%%
int main(int argc, char** argv){
        yyin = fopen(argv[1],"r");
        strcpy(file_name_ext,argv[1]);
        file_name_ext[strlen(file_name_ext)] = '\0';

        strncpy(file_name,file_name_ext,strlen(file_name_ext)-4);
         strcpy(dest_file_name,file_name);

        strcat(dest_file_name,"_filteredComments.txt");
        yyout = fopen(dest_file_name,"w");

        yylex();
        return 0;
}