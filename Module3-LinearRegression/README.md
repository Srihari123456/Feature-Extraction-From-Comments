# Linear Regression

## comments.txt
First label: no of likes

Second label: comments

Third label: serial number

## emotion_analysis.py
Uses afinn to predict polarity of the filtered comments and writes into output.csv

## output.csv
First label: no of likes

Second label: comments

Third label: serial number

Fourth label: score(polarity)

## likeprediction.py
We take in the output.csv file and fit a linear regressor for polarity and likes to learn the relation. 
