# Tokenizer
Using Lex tool for extracting features from comments on social media

## Lexical Analysis of the comments of the post
The hashtags, mentions in the comments of any file 'x' are tokenized and 
stored in files **x_hashtags.txt** and **x_mentions.txt**. 

The filtered comments which are to be passed on to a NLP model are stored in file **x_filteredComments.txt**

Install Lex and Yacc tool using
```
sudo apt-get install flex
sudo apt-get install bison
```

## Running a Lex and Yacc program
for compiling a lex program
```
1. write the lex program in a file and save it as file.l (where file is the name of the file).
2. open the terminal and navigate to the directory where you have saved the file.l
3. type - lex file.l
4. then type - cc lex.yy.c -ll
5. then type - ./a.out
```
Your lex progam will be running now (provided it is correct).
for compiling lex and yacc together
```
1. write lex program in a file file.l and yacc in a file file.y
2. open the terminal and navigate to the directory where you have saved the files.
3. type lex file.l
4. type yacc file.y
5. type cc lex.yy.c y.tab.h -ll
6. type ./a.out
```
The lex and yacc will run succesfully now
