
```{r}
library(tidyverse)
list.files(path = "../input")
train = read.csv("~/Desktop/HTrainW19Final.csv")
test = read.csv("~/Desktop/HTestW19Final No Y values.csv")
head(train)
head(test)
dim(train)
dim(test)

```

```{r}
colSums(is.na(train))
```

```{r}
#remove missing values for train data
#I chose to delete the following columns: Alley, PoolQC, Fence, MiscFeature because there are too many missing values. 
grep(c("Alley"), colnames(train))
grep(c("PoolQC"), colnames(train))
grep(c("Fence"), colnames(train))
grep(c("MiscFeature"), colnames(train))
train2 = train[, c(-7,-73,-74,-75)]
#LotFrontage is a numerical column with 394 NAs, I choose to replace all NAs by the mean 
train2$LotFrontage[which(is.na(train2$LotFrontage))] <- mean(na.omit(train2$LotFrontage))
#MasVnrArea is a numerical column with 16 NAs, I choose to replace all NAs by the mean
train2$MasVnrArea[which(is.na(train2$MasVnrArea))] <- mean(na.omit(train2$MasVnrArea))
#GaraageYrBlt is a numerical column witnh 134 NAs, I choose to replace all NAs by the median
train2$GarageYrBlt[which(is.na(train2$GarageYrBlt))] <- median(na.omit(train2$GarageYrBlt))
#BsmtFinSF1 is a numerical column witnh 1 NAs, I choose to replace all NAs by the mean
train2$BsmtFinSF1[which(is.na(train2$BsmtFinSF1))] <- median(na.omit(train2$BsmtFinSF1))
#BsmtFinSF2 is a numerical column witnh 69 NAs, I choose to replace all NAs by the mean
train2$BsmtFinSF2[which(is.na(train2$BsmtFinSF2))] <- median(na.omit(train2$BsmtFinSF2))
#BsmtUnfSF is a numerical column witnh 1 NAs, I choose to replace all NAs by the mean
train2$BsmtUnfSF[which(is.na(train2$BsmtUnfSF))] <- median(na.omit(train2$BsmtUnfSF))
#TotalBsmtSF is a numerical column witnh 1 NAs, I choose to replace all NAs by the mean
train2$TotalBsmtSF[which(is.na(train2$TotalBsmtSF))] <- median(na.omit(train2$TotalBsmtSF))
#BsmtFullBath is a numerical column witnh 1 NAs, I choose to replace all NAs by the mean
train2$BsmtFullBath[which(is.na(train2$BsmtFullBath))] <- median(na.omit(train2$BsmtFullBath))
#BsmtHalfBath is a numerical column witnh 1 NAs, I choose to replace all NAs by the mean
train2$BsmtHalfBath[which(is.na(train2$BsmtHalfBath))] <- median(na.omit(train2$BsmtHalfBath))

#remove missing values for categorical variables
#MSZoing
train2$MSZoning[which(is.na(train2$MSZoning))] <- as.character(train2$MSZoning[which.max(table(train2$MSZoning))])
#Utilities
train2$Utilities[which(is.na(train2$Utilities))] <- as.character(train2$Utilities[which.max(table(train2$Utilities))])
#MasVnrTyoe
train2$MasVnrType[which(is.na(train2$MasVnrType))] <- as.character(train2$MasVnrType[which.max(table(train2$MasVnrType))])
#BsmtQual
train2$BsmtQual[which(is.na(train2$BsmtQual))] <- as.character(train2$BsmtQual[which.max(table(train2$BsmtQual))])
#BsmtCond
train2$BsmtCond[which(is.na(train2$BsmtCond))] <- as.character(train2$BsmtCond[which.max(table(train2$BsmtCond))])
#BsmtExposure
train2$BsmtExposure[which(is.na(train2$BsmtExposure))] <- as.character(train2$BsmtExposure[which.max(table(train2$BsmtExposure))])
#BsmtFinType1
train2$BsmtFinType1[which(is.na(train2$BsmtFinType1))] <- as.character(train2$BsmtFinType1[which.max(table(train2$BsmtFinType1))])
#BsmtFinType2
train2$BsmtFinType2[which(is.na(train2$BsmtFinType2))] <- as.character(train2$BsmtFinType2[which.max(table(train2$BsmtFinType2))])
#kitchenQual
train2$KitchenQual[which(is.na(train2$KitchenQual))] <- as.character(train2$KitchenQual[which.max(table(train2$KitchenQual))])
#GarageCond
train2$GarageCond[which(is.na(train2$GarageCond))] <- as.character(train2$GarageCond[which.max(table(train2$GarageCond))])
#GaraQual
train2$GarageQual[which(is.na(train2$GarageQual))] <- as.character(train2$GarageQual[which.max(table(train2$GarageQual))])
#BsmtQual
train2$SaleType[which(is.na(train2$SaleType))] <- as.character(train2$SaleType[which.max(table(train2$SaleType))])
#Functional
train2$Functional[which(is.na(train2$Functional))] <- as.character(train2$Functional[which.max(table(train2$Functional))])
#FireplaceQu
train2$FireplaceQu[which(is.na(train2$FireplaceQu))] <- as.character(train2$FireplaceQu[which.max(table(train2$FireplaceQu))])
#GarageType
train2$GarageType[which(is.na(train2$GarageType))] <- as.character(train2$GarageType[which.max(table(train2$GarageType))])
#GarageFinish
train2$GarageFinish[which(is.na(train2$GarageFinish))] <- as.character(train2$GarageFinish[which.max(table(train2$GarageFinish))])
colSums(is.na(train2))
sum(is.na(train2))

#remove all the NAs for the test data
grep(c("Alley"), colnames(test))
grep(c("PoolQC"), colnames(test))
grep(c("Fence"), colnames(test))
grep(c("MiscFeature"), colnames(test))
grep(c("FireplaceQu"), colnames(test))
test2 = test[, c(-7,-73,-74,-75,-58)]

#MSZoing
test2$MSZoning[which(is.na(test2$MSZoning))] <- as.character(test2$MSZoning[which.max(table(test2$MSZoning))])
#LotFrontage
test2$LotFrontage[which(is.na(test2$LotFrontage))] <- mean(na.omit(test2$LotFrontage))
#Exterior1st
test2$Exterior1st[which(is.na(test2$Exterior1st))] <- as.character(test2$Exterior1st[which.max(table(test2$Exterior1st))])
#Exterior12nd
test2$Exterior2nd[which(is.na(test2$Exterior2nd))] <- as.character(test2$Exterior2nd[which.max(table(test2$Exterior2nd))])
#MasVnrType
test2$MasVnrType[which(is.na(test2$MasVnrArea))] <- as.character(test2$MasVnrType[which.max(table(test2$MasVnrType))])
#MasVnrArea
test2$MasVnrArea[which(is.na(test2$MasVnrArea))] <- mean(na.omit(test2$MasVnrArea))
#BsmtQual
test2$BsmtQual[which(is.na(test2$BsmtQual))] <- as.character(test2$BsmtQual[which.max(table(test2$BsmtQual))])
#BsmtCond
test2$BsmtCond[which(is.na(test2$BsmtCond))] <- as.character(test2$BsmtCond[which.max(table(test2$BsmtCond))])
#BsmtExposure
test2$BsmtExposure[which(is.na(test2$BsmtExposure))] <- as.character(test2$BsmtExposure[which.max(table(test2$BsmtExposure))])
#BsmtFinType1
test2$BsmtFinType1[which(is.na(test2$BsmtFinType1))] <- as.character(test2$BsmtFinType1[which.max(table(test2$BsmtFinType1))])
#BsmtFinType2
test2$BsmtFinType2[which(is.na(test2$BsmtFinType2))] <- as.character(test2$BsmtFinType2[which.max(table(test2$BsmtFinType2))])
#BsmtFinSF1
test2$BsmtFinSF1[which(is.na(test2$BsmtFinSF1))] <- median(na.omit(test2$BsmtFinSF1))
#BsmtFinSF2
test2$BsmtFinSF2[which(is.na(test2$BsmtFinSF2))] <- median(na.omit(test2$BsmtFinSF2))
#BsmtUnfSF
test2$BsmtUnfSF[which(is.na(test2$BsmtUnfSF))] <- median(na.omit(test2$BsmtUnfSF))
#TotalBsmtSF
test2$TotalBsmtSF[which(is.na(test2$TotalBsmtSF))] <- median(na.omit(test2$TotalBsmtSF))
#Electrical
test2$Electrical[which(is.na(test2$Electrical))] <- as.character(test2$Electrical[which.max(table(test2$Electrical))])
#Functional
test2$Functional[which(is.na(test2$Functional))] <- as.character(test2$Functional[which.max(table(test2$Functional))])
#FireplaceQu
test2$FireplaceQu[which(is.na(test2$FireplaceQu))] <- as.character(test2$FireplaceQu[which.max(table(test2$FireplaceQu))])
#GarageType
test2$GarageType[which(is.na(test2$GarageType))] <- as.character(test2$GarageType[which.max(table(test2$GarageType))])
#GarageFinish
test2$GarageFinish[which(is.na(test2$GarageFinish))] <- as.character(test2$GarageFinish[which.max(table(test2$GarageFinish))])
#GarageYrBlt
test2$GarageYrBlt[which(is.na(test2$GarageYrBlt))] <- median(na.omit(test2$GarageYrBlt))
#GarageCars
test2$GarageCars[which(is.na(test2$GarageCars))] <- mean(na.omit(test2$GarageCars))
#kitchenQual
test2$KitchenQual[which(is.na(test2$KitchenQual))] <- as.character(test2$KitchenQual[which.max(table(test2$KitchenQual))])
#BsmtFullBath
test2$BsmtFullBath[which(is.na(test2$BsmtFullBath))] <- median(na.omit(test2$BsmtFullBath))
#BsmtHalfBath
test2$BsmtHalfBath[which(is.na(test2$BsmtHalfBath))] <- median(na.omit(test2$BsmtHalfBath))
#GarageCond
test2$GarageCond[which(is.na(test2$GarageCond))] <- as.character(test2$GarageCond[which.max(table(test2$GarageCond))])
#GaraQual
test2$GarageQual[which(is.na(test2$GarageQual))] <- as.character(test2$GarageQual[which.max(table(test2$GarageQual))])
#GarageArea
test2$GarageArea[which(is.na(test2$GarageArea))] <- mean(na.omit(test2$GarageArea))

colSums(is.na(test2))
```

```{r}
remove_outliers <- function(x, na.rm = TRUE, ...) {
  qnt <- quantile(x, probs=c(.25, .75), na.rm = na.rm, ...)
  H <- 1.5 * IQR(x, na.rm = na.rm)
  y <- x
  y[x < (qnt[1] - H)] <- NA
  y[x > (qnt[2] + H)] <- NA
  y
}
train2$MSSubClass = remove_outliers(train2$MSSubClass)
train2$LotFrontage = remove_outliers(train2$LotFrontage)
train2$LotArea = remove_outliers(train2$LotArea)
train2$OverallQual = remove_outliers(train2$OverallQual)
train2$OverallCond = remove_outliers(train2$OverallCond)
train2$YearBuilt = remove_outliers(train2$YearBuilt)
train2$YearRemodAdd = remove_outliers(train2$YearRemodAdd)
train2$MasVnrArea = remove_outliers(train2$MasVnrArea)
train2$BsmtFinSF1 = remove_outliers(train2$BsmtFinSF1)
train2$BsmtFinSF2 = remove_outliers(train2$BsmtFinSF2)
train2$BsmtUnfSF = remove_outliers(train2$BsmtUnfSF)
train2$TotalBsmtSF = remove_outliers(train2$TotalBsmtSF)
train2$X1stFlrSF = remove_outliers(train2$X1stFlrSF)
train2$X2ndFlrSF = remove_outliers(train2$X2ndFlrSF)
train2$LowQualFinSF = remove_outliers(train2$LowQualFinSF)
train2$GrLivArea = remove_outliers(train2$GrLivArea)
train2$BsmtFullBath = remove_outliers(train2$BsmtFullBath)
train2$BsmtHalfBath = remove_outliers(train2$BsmtHalfBath)
train2$FullBath = remove_outliers(train2$FullBath)
train2$BedroomAbvGr = remove_outliers(train2$BedroomAbvGr)
train2$KitchenAbvGr = remove_outliers(train2$KitchenAbvGr)
train2$TotRmsAbvGrd = remove_outliers(train2$TotRmsAbvGrd)
train2$Fireplaces = remove_outliers(train2$Fireplaces)
train2$GarageYrBlt = remove_outliers(train2$GarageYrBlt)
train2$GarageCars = remove_outliers(train2$GarageCars)
train2$GarageArea = remove_outliers(train2$GarageArea)
train2$WoodDeckSF = remove_outliers(train2$WoodDeckSF)
train2$OpenPorchSF = remove_outliers(train2$OpenPorchSF)
train2$EnclosedPorch = remove_outliers(train2$EnclosedPorch)
train2$X3SsnPorch = remove_outliers(train2$X3SsnPorch)
train2$ScreenPorch = remove_outliers(train2$ScreenPorch)
train2$PoolArea = remove_outliers(train2$PoolArea)
train2$MiscVal = remove_outliers(train2$MiscVal)

#remove NAs for train2
#MSSubclass
train2$MSSubClass[which(is.na(train2$MSSubClass))] <- median(na.omit(train2$MSSubClass))
#LotFrontage
train2$LotFrontage[which(is.na(train2$LotFrontage))] <- median(na.omit(train2$LotFrontage))
#MSZoing
train2$MSZoning[which(is.na(train2$MSZoning))] <- as.character(train2$MSZoning[which.max(table(train2$MSZoning))])
train2$LotArea[which(is.na(train2$LotArea))] <- median(na.omit(train2$LotArea))
train2$OverallCond[which(is.na(train2$OverallCond))] <- median(na.omit(train2$OverallCond))
train2$OverallQual[which(is.na(train2$OverallQual))] <- median(na.omit(train2$OverallQual))
train2$YearBuilt[which(is.na(train2$YearBuilt))] <- median(na.omit(train2$YearBuilt))
train2$MasVnrArea[which(is.na(train2$MasVnrArea))] <- median(na.omit(train2$MasVnrArea))
train2$BsmtFinSF1[which(is.na(train2$BsmtFinSF1))] <- median(na.omit(train2$BsmtFinSF1))
train2$BsmtFinSF2[which(is.na(train2$BsmtFinSF2))] <- median(na.omit(train2$BsmtFinSF2))
train2$BsmtUnfSF[which(is.na(train2$BsmtUnfSF))] <- median(na.omit(train2$BsmtUnfSF))
train2$TotalBsmtSF[which(is.na(train2$TotalBsmtSF))] <- median(na.omit(train2$TotalBsmtSF))
train2$X1stFlrSF[which(is.na(train2$X1stFlrSF))] <- median(na.omit(train2$X1stFlrSF))
train2$X2ndFlrSF[which(is.na(train2$X2ndFlrSF))] <- median(na.omit(train2$X2ndFlrSF))
train2$LowQualFinSF[which(is.na(train2$LowQualFinSF))] <- median(na.omit(train2$LowQualFinSF))
train2$GrLivArea[which(is.na(train2$GrLivArea))] <- median(na.omit(train2$GrLivArea))
train2$BsmtFullBath[which(is.na(train2$BsmtFullBath))] <- median(na.omit(train2$BsmtFullBath))
train2$BsmtHalfBath[which(is.na(train2$BsmtHalfBath))] <- median(na.omit(train2$BsmtHalfBath))
train2$FullBath[which(is.na(train2$FullBath))] <- median(na.omit(train2$FullBath))
train2$BedroomAbvGr[which(is.na(train2$BedroomAbvGr))] <- median(na.omit(train2$BedroomAbvGr))
train2$KitchenQual[which(is.na(train2$KitchenQual))] <- as.character(train2$KitchenQual[which.max(table(train2$KitchenQual))])
train2$TotRmsAbvGrd[which(is.na(train2$TotRmsAbvGrd))] <- median(na.omit(train2$TotRmsAbvGrd))
train2$Fireplaces[which(is.na(train2$Fireplaces))] <- median(na.omit(train2$Fireplaces))
train2$GarageYrBlt[which(is.na(train2$GarageYrBlt))] <- median(na.omit(train2$GarageYrBlt))
train2$GarageCars[which(is.na(train2$GarageCars))] <- median(na.omit(train2$GarageCars))
train2$GarageArea[which(is.na(train2$GarageArea))] <- median(na.omit(train2$GarageArea))
train2$WoodDeckSF[which(is.na(train2$WoodDeckSF))] <- median(na.omit(train2$WoodDeckSF))
train2$OpenPorchSF[which(is.na(train2$OpenPorchSF))] <- median(na.omit(train2$OpenPorchSF))
train2$EnclosedPorch[which(is.na(train2$EnclosedPorch))] <- median(na.omit(train2$EnclosedPorch))
train2$X3SsnPorch[which(is.na(train2$X3SsnPorch))] <- median(na.omit(train2$X3SsnPorch))
train2$ScreenPorch[which(is.na(train2$ScreenPorch))] <- median(na.omit(train2$ScreenPorch))
train2$PoolArea[which(is.na(train2$PoolArea))] <- median(na.omit(train2$PoolArea))
train2$MiscVal[which(is.na(train2$MiscVal))] <- median(na.omit(train2$MiscVal))
colSums(is.na(train2))
```

```{r}
remove_outliers <- function(x, na.rm = TRUE, ...) {
  qnt <- quantile(x, probs=c(.25, .75), na.rm = na.rm, ...)
  H <- 1.5 * IQR(x, na.rm = na.rm)
  y <- x
  y[x < (qnt[1] - H)] <- NA
  y[x > (qnt[2] + H)] <- NA
  y
}
test2$MSSubClass = remove_outliers(test2$MSSubClass)
test2$LotFrontage = remove_outliers(test2$LotFrontage)
test2$LotArea = remove_outliers(test2$LotArea)
test2$OverallQual = remove_outliers(test2$OverallQual)
test2$OverallCond = remove_outliers(test2$OverallCond)
test2$YearBuilt = remove_outliers(test2$YearBuilt)
test2$YearRemodAdd = remove_outliers(test2$YearRemodAdd)
test2$MasVnrArea = remove_outliers(test2$MasVnrArea)
test2$BsmtFinSF1 = remove_outliers(test2$BsmtFinSF1)
test2$BsmtFinSF2 = remove_outliers(test2$BsmtFinSF2)
test2$BsmtUnfSF = remove_outliers(test2$BsmtUnfSF)
test2$TotalBsmtSF = remove_outliers(test2$TotalBsmtSF)
test2$X1stFlrSF = remove_outliers(test2$X1stFlrSF)
test2$X2ndFlrSF = remove_outliers(test2$X2ndFlrSF)
test2$LowQualFinSF = remove_outliers(test2$LowQualFinSF)
test2$GrLivArea = remove_outliers(test2$GrLivArea)
test2$BsmtFullBath = remove_outliers(test2$BsmtFullBath)
test2$BsmtHalfBath = remove_outliers(test2$BsmtHalfBath)
test2$FullBath = remove_outliers(test2$FullBath)
test2$BedroomAbvGr = remove_outliers(test2$BedroomAbvGr)
test2$KitchenAbvGr = remove_outliers(test2$KitchenAbvGr)
test2$TotRmsAbvGrd = remove_outliers(test2$TotRmsAbvGrd)
test2$Fireplaces = remove_outliers(test2$Fireplaces)
test2$GarageYrBlt = remove_outliers(test2$GarageYrBlt)
test2$GarageCars = remove_outliers(test2$GarageCars)
test2$GarageArea = remove_outliers(test2$GarageArea)
test2$WoodDeckSF = remove_outliers(test2$WoodDeckSF)
test2$OpenPorchSF = remove_outliers(test2$OpenPorchSF)
test2$EnclosedPorch = remove_outliers(test2$EnclosedPorch)
test2$X3SsnPorch = remove_outliers(test2$X3SsnPorch)
test2$ScreenPorch = remove_outliers(test2$ScreenPorch)
test2$PoolArea = remove_outliers(test2$PoolArea)
test2$MiscVal = remove_outliers(test2$MiscVal)

test2$MSSubClass[which(is.na(test2$MSSubClass))] <- median(na.omit(test2$MSSubClass))
test2$LotFrontage[which(is.na(test2$LotFrontage))] <- mean(na.omit(test2$LotFrontage))

test2$LotArea[which(is.na(test2$LotArea))] <- median(na.omit(test2$LotArea))

test2$OverallCond[which(is.na(test2$OverallCond))] <- median(na.omit(test2$OverallCond))
test2$OverallQual[which(is.na(test2$OverallQual))] <- median(na.omit(test2$OverallQual))
test2$YearBuilt[which(is.na(test2$YearBuilt))] <- median(na.omit(test2$YearBuilt))

test2$MasVnrArea[which(is.na(test2$MasVnrArea))] <- median(na.omit(test2$MasVnrArea))
test2$BsmtFinSF1[which(is.na(test2$BsmtFinSF1))] <- median(na.omit(test2$BsmtFinSF1))
test2$BsmtFinSF2[which(is.na(test2$BsmtFinSF2))] <- median(na.omit(test2$BsmtFinSF2))

test2$BsmtUnfSF[which(is.na(test2$BsmtUnfSF))] <- median(na.omit(test2$BsmtUnfSF))
test2$TotalBsmtSF[which(is.na(test2$TotalBsmtSF))] <- median(na.omit(test2$TotalBsmtSF))
test2$X1stFlrSF[which(is.na(test2$X1stFlrSF))] <- median(na.omit(test2$X1stFlrSF))
test2$X2ndFlrSF[which(is.na(test2$X2ndFlrSF))] <- median(na.omit(test2$X2ndFlrSF))
test2$LowQualFinSF[which(is.na(test2$LowQualFinSF))] <- median(na.omit(test2$LowQualFinSF))
test2$GrLivArea[which(is.na(test2$GrLivArea))] <- median(na.omit(test2$GrLivArea))

test2$BsmtHalfBath[which(is.na(test2$BsmtHalfBath))] <- median(na.omit(test2$BsmtHalfBath))

test2$FullBath[which(is.na(test2$FullBath))] <- median(na.omit(test2$FullBath))
test2$BedroomAbvGr[which(is.na(test2$BedroomAbvGr))] <- median(na.omit(test2$BedroomAbvGr))

test2$TotRmsAbvGrd[which(is.na(test2$TotRmsAbvGrd))] <- median(na.omit(test2$TotRmsAbvGrd))
test2$Fireplaces[which(is.na(test2$Fireplaces))] <- median(na.omit(test2$Fireplaces))
test2$GarageYrBlt[which(is.na(test2$GarageYrBlt))] <- median(na.omit(test2$GarageYrBlt))
test2$GarageCars[which(is.na(test2$GarageCars))] <- median(na.omit(test2$GarageCars))

test2$GarageArea[which(is.na(test2$GarageArea))] <- median(na.omit(test2$GarageArea))
test2$WoodDeckSF[which(is.na(test2$WoodDeckSF))] <- median(na.omit(test2$WoodDeckSF))
test2$OpenPorchSF[which(is.na(test2$OpenPorchSF))] <- median(na.omit(test2$OpenPorchSF))
test2$EnclosedPorch[which(is.na(test2$EnclosedPorch))] <- median(na.omit(test2$EnclosedPorch))
test2$X3SsnPorch[which(is.na(test2$X3SsnPorch))] <- median(na.omit(test2$X3SsnPorch))
test2$ScreenPorch[which(is.na(test2$ScreenPorch))] <- median(na.omit(test2$ScreenPorch))
test2$PoolArea[which(is.na(test2$PoolArea))] <- median(na.omit(test2$PoolArea))
test2$MiscVal[which(is.na(test2$MiscVal))] <- median(na.omit(test2$MiscVal))
colSums(is.na(train2))
```


```{r}
library(car)
#First selecting numerical variables
model <- lm(SalePrice ~ MSZoning + LotFrontage + LotArea + OverallQual + OverallCond + YearBuilt + YearRemodAdd + MasVnrArea + BsmtFinSF1 + BsmtFinSF2 + BsmtUnfSF +TotalBsmtSF+ X1stFlrSF + X2ndFlrSF + KitchenAbvGr+ LowQualFinSF + GrLivArea + BsmtFullBath + BsmtHalfBath + FullBath + HalfBath + BedroomAbvGr + TotRmsAbvGrd + Fireplaces + GarageYrBlt + GarageArea + WoodDeckSF + OpenPorchSF + EnclosedPorch + X3SsnPorch + ScreenPorch + PoolArea + MiscVal + MoSold + YrSold, data = train2)
summary(model)
# keep variables with siginicant p-values
model.1 <- lm(SalePrice ~ LotArea + OverallQual + YearBuilt + YearRemodAdd + MasVnrArea + BsmtFinSF1 + BsmtFinSF2 + BsmtUnfSF +TotalBsmtSF + X1stFlrSF + X2ndFlrSF  + BsmtFullBath +  BedroomAbvGr + TotRmsAbvGrd + Fireplaces + GarageArea + ScreenPorch + PoolArea + MiscVal, data = train2)
summary(model.1)
# And I still choose GrLivArea over X1stFlrSF + X2ndFlrSF
# I keep FUll bath (need transformation) instead of BsmtFullBath 
#i only keep TotRmsAbvGrd between BedroomAbvGr and TotRmsAbvGrd

```


```{r}
dim(train2)
dim(test2)
# I combined YearBuit and YearRemodAdd into one predictor: Age
train2[78] <- data.frame("Age" = train2$YearRemodAdd - train2$YearBuilt)
test2[76] <- data.frame("Age" = test2$YearRemodAdd - test2$YearBuilt)

```

```{r}

model.2 <- lm(SalePrice ~ LotArea + OverallQual  + Age + BsmtFinSF1 + + BsmtUnfSF +TotalBsmtSF  + GrLivArea + FullBath + TotRmsAbvGrd + Fireplaces + GarageArea , data = train2)
summary(model.2)
vif(model.2)

#delete predictors (vif greater than 5)
model.3 <- lm(SalePrice ~ LotArea + OverallQual  + Age + GrLivArea + FullBath + TotRmsAbvGrd + Fireplaces + GarageArea, data = train2)
summary(model.3)
vif(model.3)

# delete meaningless predictors(in my opinion) and we can see that R^2 does not get affected much
#the predictors inside model.4 is all the numerical predictors that we pick 
model.4 <- lm(SalePrice ~ LotArea + OverallQual + Age + GrLivArea + FullBath + TotRmsAbvGrd + GarageArea, data = train2)
summary(model.4)

```

```{r}
#pick categorial variables
attach(train2)
boxplot(SalePrice ~ Street)
boxplot(SalePrice ~ MSSubClass)
boxplot(SalePrice ~ LotShape)
boxplot(SalePrice ~ LandContour)
boxplot(SalePrice ~ Utilities)
boxplot(SalePrice ~ LotConfig)
boxplot(SalePrice ~ LandSlope)
boxplot(SalePrice ~ Neighborhood)
boxplot(SalePrice ~ Condition1) 
boxplot(SalePrice ~ Condition2)
boxplot(SalePrice ~ BldgType)
boxplot(SalePrice ~ HouseStyle)
boxplot(SalePrice ~ RoofStyle)
boxplot(SalePrice ~ RoofMatl)
boxplot(SalePrice ~ Exterior1st)
boxplot(SalePrice ~ Exterior2nd)
boxplot(SalePrice ~ MasVnrType)
boxplot(SalePrice ~ ExterQual)
boxplot(SalePrice ~ ExterCond)
boxplot(SalePrice ~ Foundation)
boxplot(SalePrice ~ BsmtCond)
boxplot(SalePrice ~ BsmtQual)
boxplot(SalePrice ~ BsmtExposure)
boxplot(SalePrice ~ BsmtFinType1)
boxplot(SalePrice ~ BsmtFinType2)
boxplot(SalePrice ~ Heating)
boxplot(SalePrice ~ CentralAir)
boxplot(SalePrice ~ Electrical)
boxplot(SalePrice ~ KitchenQual)
boxplot(SalePrice ~ Functional)
boxplot(SalePrice ~ FireplaceQu)
boxplot(SalePrice ~ GarageType)
boxplot(SalePrice ~ GarageFinish)
boxplot(SalePrice ~ GarageQual)
boxplot(SalePrice ~ GarageCond)
boxplot(SalePrice ~ PavedDrive)
boxplot(SalePrice ~ SaleType)
```

```{r}
#model with numerical and dummy
model2 <- lm(SalePrice ~ LotArea + OverallQual + Age + GrLivArea + FullBath + TotRmsAbvGrd + Fireplaces + GarageArea, data = train2)

#transformation
tSalePrice <- log(SalePrice)
model3 <- lm(tSalePrice ~ LotArea + OverallQual + Age + GrLivArea + FullBath + TotRmsAbvGrd + Fireplaces + GarageArea, data = train2)
summary(model3)
```

```{r}
#I convert FullBath and GarageCars into dummy
dim(train2)
train2[79] <- data.frame("FullBathNew" = factor(train2$FullBath))
boxplot(train2$SalePrice ~ train2$FullBathNew)
train2[80] <- data.frame("GarageCarsNew" = factor(train2$GarageCars))
boxplot(train2$SalePrice ~ train2$GarageCarsNew)
dim(train2)

dim(test2)
test2[77] <- data.frame("FullBathNew" = factor(test2$FullBath))
test2[78] <- data.frame("GarageCarsNew" = factor(test2$GarageCars))
dim(test2)

```


```{r}
#Final model
model4 <- lm(tSalePrice ~ LotArea + OverallQual + Age + GrLivArea + FullBath + TotRmsAbvGrd + Fireplaces + GarageCars + BsmtFinSF1, data = train2)
summary(model4)
plot(model4)
prediction = exp(predict(model4, newdata = test2))
prediction[1:10]
saleprice_prediction = data.frame(Ob = 1:1500, SalePrice = prediction)
write.csv(saleprice_prediction, file = 'Yuqing_Yang_101A-saleprice-predictions.csv', row.names = FALSE)

```