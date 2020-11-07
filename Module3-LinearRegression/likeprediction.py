import numpy as np
import matplotlib.pyplot as plt  # To visualize
import pandas as pd  # To read data
from sklearn.linear_model import LinearRegression
from afinn import Afinn
import math

file1 = open("new_comment.txt", 'r')
Lines = file1.readlines()
file1.close()

new_comment = Lines[0]
print(new_comment)

data = pd.read_csv('output.csv')  # load data set
Y = data.iloc[0:, 0].values.reshape(-1, 1)  # values converts it into a numpy array
X = data.iloc[0:, 3].values.reshape(-1, 1)  # -1 means that calculate the dimension of rows, but have 1 column
linear_regressor = LinearRegression()  # create object for the class
linear_regressor.fit(X, Y)  # perform linear regression
Y_pred = linear_regressor.predict(X)  # make predictions

analyzer = Afinn()
# new_comment = "wow that looks amazing!"
score = analyzer.score(new_comment)
likes = linear_regressor.predict([[score]])
likes = math.ceil(likes[0][0])
print(likes)
fd = open("new_comment_likes.txt","w")
fd.write(str(likes))
fd.close()
        
#plt.scatter(X, Y)
#plt.plot(X, Y_pred, color='red')
#plt.show()
