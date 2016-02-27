---
title: "CodeBook.md"
author: "Angela Camp"
date: "February 25, 2016"
output: html_document
---

This is the README for the code inside run_analysis.R describing how the script works. Information about the variables, data, and transformations can be found in the CodeBook.md document.  

The code is splitted into the following sections:  
* Downloading the Data  
* Loading the Data  
* Manipulating the Data  
* Outputting the Data  

#### Downloading the Data  
Downloads and unzips the data.  
Note: If the UCI HAR Dataset is already downloaded and unzipped in your working directory, this step can be skipped.  

#### Loading the Data  
* Reads the activity labels  
* Reads features into features  
* Loads the Subject, X, and y test and training data  

#### Manipulating the Data  
* Gives variables meaningful names for test and training data  
* Combines the test and training data into one data set, alldata  
* Extracts only the measurements on the mean and standard deviation for each measurement  
* Transforms activityname into factor; Uses descriptive activity names to name the activities in the data set  
* Creates an independent tidy data set, meanstdavgs, with the average of each variable for each activity and each subject  
* Writes meanstdavgs data frame  

The final data frame looks like this:


```r
head(meanstdavgs[, 1:4], n=5)
```

```
##   subject activityname tBodyAcc-mean()-X tBodyAcc-mean()-Y
## 1       1      WALKING         0.2773308       -0.01738382
## 2       2      WALKING         0.2764266       -0.01859492
## 3       3      WALKING         0.2755675       -0.01717678
## 4       4      WALKING         0.2785820       -0.01483995
## 5       5      WALKING         0.2778423       -0.01728503
```

#### Reading the Data  
The tidy data set can be read into R using the following: 

```r
data <- read.table("meanstdavgs.csv", header = TRUE)
```

```
## Warning in file(file, "rt"): cannot open file 'meanstdavgs.csv': No such
## file or directory
```

```
## Error in file(file, "rt"): cannot open the connection
```
