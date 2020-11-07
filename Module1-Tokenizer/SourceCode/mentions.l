%{
#include<bits/stdc++.h>
using namespace std;
string mentions = "",tags = "";
int line_count = 1;
char res[100],file_name[100],file_name_ext[100],dest_file_name[100];
%}

letter [a-zA-Z_.]
digit [0-9]
number {digit}+
id {letter}({letter}|{digit})*
delim [ \t]
tag ({letter}|{digit})+
%%
^{number}"LIKES" ;

[^{letter}|^{digit}]"@"{tag}{delim} {
        bzero(res,sizeof(res));
        yyless(yyleng-1);
        strncpy(res,yytext+2,yyleng-2);
        fprintf(yyout,"%s;%s;%d\n",file_name,res,line_count);
        REJECT;
}
"\n" ;
"\n." ;
"\n".*"\n" {line_count++;REJECT;}
. ;
%%

int main(int argc, char** argv){
        yyin = fopen(argv[1],"r");

        strcpy(file_name_ext,argv[1]);
        file_name_ext[strlen(file_name_ext)] = '\0';
        strncpy(file_name,file_name_ext,strlen(file_name_ext)-4);

        strcpy(dest_file_name,file_name);
        strcat(dest_file_name,"_mentions.txt");

        yyout = fopen(dest_file_name,"w");
        yylex();
        return 0;
}
