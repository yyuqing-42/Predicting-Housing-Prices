# Predicting-Housing-Prices

## Summary

Selected 9 predictors out of 80 and built a linear regression model with 90.2% R2 to predict the sale price of houses in Ames, Iowa.

## Data Cleaning and Analysis

First, I checked the missing values of all columns by running colSums() function. I deleted columns with 80~90% missing data. For the other numerical columns with missing values, I chose to replace the missing data with column mean or median. I replaced all the categorical missing values with the most frequent non-missing value of each column. 

To identity good categorical variables, I applied boxplot to all the categorical columns. A variable is considered a important categorical variable when there is a siginficate difference shown in the plot.

## Data Transformation

For future modeling, I created one more variable: Age, which is YearRemodAdd minus YearBuilt. I also converted variables FullBath and GarageCars into dummy(category) variables because I noticed more featured insights when they are used as dummy variables. 

For the response variable SalePrice, I took log over it to increase the linearity. 

## Linear Regression Modeling

At first, I built multiple linear regression models. Based on the results, I removed some predictors with large VIF value (>5) or with very large P-values. 

My final model contains 9 predictors. The R2 of my model is 87.23% and the adjusted R2 is 87.18%. 

My final model: tSalePrice = 1.064e+01 + LotArea * 2.244e-06 + OverallQual * 1.325e-01 + Age * -1.176e-03 + GrLivArea * 1.474e-04 + FullBath * 4.690e-02 + TotRmsAbvGrd * 9.118e-03 + Fireplaces * 2.669e-02 + GarageCars * 9.445e-02 + BsmtFinSF1 * 1.222e-04

## Regression Diagnostics

The diagnostic plots look good. 

- The Residuals vs Fitted plot shows there is a solid linear relationship between predictors and the outcome variables. 

- The Normal Q-Q plot shows the residuals are normally distributed which means my model has good normality.

- The Scale-Location plot shows the residual points appear randomly spread. In another word, my model has a constant variance. 

- The Residual vs Leverage plot shows there is no bad leverage points. 

## Conclusion

 I achieved 90.2% test accuracy on the Kaggle public leaderboard which shows my model is valid model. 
