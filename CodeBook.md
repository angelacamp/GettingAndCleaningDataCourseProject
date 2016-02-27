---
title: "CodeBook.md"
author: "Angela Camp"
date: "February 25, 2016"
output: html_document
---

This is the CodeBook for the tidy data set meanstdavgs. The CodeBook describes the variables, the data, and transformations/work that was performed to clean up the data and create the data set, meanstdavgs. Information about the scripts can be found in the README.md document.

# Variables
#### subject  
A number from 1 through 30 corresponding to the volunteer subject of the experiment.  

#### activityname  
The type of activity being performed. There are six activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING. Each subject performed each activity.  

#### feature variables 
Adapted from the UCI HAR Dataset's features_info.txt:  
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.  

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

The set of variables that were estimated from these signals are:   
mean(): Mean value  
std(): Standard deviation  

#### Data  
The data in this data set represents the average of each variable for each activity and each subject. The resulting data set has 68 variables with 180 observations. Each row represents the average set of features for a subject (1-30) for each of the six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING).  

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

# Transformations  
The following transformations were performed on the original data to arrive at the final data set, meanstdavgs:  
* Combined subject, activity, and features data from three separate data sets into one data set with 563 variables. Performed for both test (2947 observations) and training (7352 observations) data.  
* Combined resulting test and training data sets from #1 into one comprehensive data set with 10299 observations and 563 variables.  
* Named variables with meaningful descriptions. Extracted names of variables 3:563 from features.txt.  
* Transformed activity from numeric to factor; Transformed levels 1-6 to corresponding activity name in activity_labels.txt.  
* Extracted only the measurements on the mean and standard deviation for each measurement. This reduced the data set from 563 variables to 68 variables (which includes subject and activityname).  
* Computed the average of each variable for each activity and each subject. The resulting data set has 68 variables with 180 observations.  
