# House_Price_Prediction
With 79 explanatory variables describing (almost) every aspect of residential homes in Ames, Iowa, this competition challenges you to predict the final price of each home.

Contest link: https://www.kaggle.com/c/house-prices-advanced-regression-techniques

## Final Position: 1483/4636 ≈ 32nd Percentile

![alt text](https://github.com/icecap360/House_Price_Prediction/blob/master/Results.png?raw=true)

## Technologies used: 
* R
* Jupyter Notebook
* Various packages within R 

## Modelling
The focus this time was on 
1. Feature Engineering
2. Modularization
3. Advanced Algorithms

After reading the book Introduction to Statistical Learning (https://faculty.marshall.usc.edu/gareth-james/ISL/ISLR%20Seventh%20Printing.pdf), I implemented what I learned from the book.
After preprocessing the data, I made helper functions in a Loading_Data script so I can easily import the data into later scripts. I then completed a full data exploration, 
breaking the analysis into categorical and numerical features and employing various types of graphs, which can be found in the figures directory.
The focus was on variants more advanced models such as support vectors and trees, but extensive and effective feature engineering. However linear regression and the analysis of linear regression
through residuals, correlations, qq plots, and leverages.

In the end, support vector machines with a radial kernel with feature engineered variables and filtered outliers/leverage points gave the best error based on the metric mean squared error. 

## Directories:
Install_Packages: a notebook that will download all the necessary packages.

Data: Scripts to preprocess the data, which are then stored within another subdirecory "rdas".

Exploration_And_Visualization: Contains data exploration, data visualization, hypothesis tests, and feature engineering. Graphs are stored within a subdirectory called Figures_and_Graphs. 
The feature engineered train and test data sets are stored in the Data directory previously mentioned.

Models: Trying various model classes, primarily from 3 clases: linear regression, support vector machines and trees. Predictions are in a subdirectory called Predictions.
