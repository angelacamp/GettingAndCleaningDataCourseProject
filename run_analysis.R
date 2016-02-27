## The R script run_analysis.R does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation 
##    for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data 
##    set with the average of each variable for each activity and each subject.

library(dplyr)

## ----- DOWNLOADING THE DATA -----

## download data to the working directory
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "./data.zip", mode = "wb")

## unzip the data file
unzip("data.zip")

## ----- LOADING THE DATA -----

## load descriptive data into R
features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)
activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)

## load the test data sets into R
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)

## load the training data sets into R
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)


## ----- MANIPULATING THE DATA -----

## 0. give variables meaningful names
## extract variable names as character vector from features
featurenames <- as.vector(features$V2)
names(X_test) <- featurenames
names(X_train) <- featurenames
names(subject_train) <- c("subject")
names(y_train) <- c("activityname")
names(subject_test) <- c("subject")
names(y_test) <- c("activityname")

## 1. Merge the training and the test sets to create one data set.
test <- cbind(subject_test, y_test, X_test)
train <- cbind(subject_train, y_train, X_train)
alldata <- rbind(test,train)

## 2. Extracts only the measurements on the mean and standard deviation 
##    for each measurement.
meanstdcols <- grep("subject|activityname|mean[()]|std[()]", names(alldata))
meanstddata <- subset(alldata, select=meanstdcols)

## 3. Uses descriptive activity names to name the activities in the data set
meanstddata$activityname <- as.factor(meanstddata$activityname)
levels(meanstddata$activityname) <- activitylabels$V2

## 4. Appropriately label the data set with descriptive variable names.
## (See step 0)

## 5. From the data set in step 4, creates a second, independent tidy data 
##    set with the average of each variable for each activity and each subject.
meanstdavgs <- aggregate(. ~ subject+activityname, data = meanstddata, FUN = mean)
write.table(meanstdavgs, file = "meanstdavgs.csv", row.names = FALSE)

##  ----- READING THE DATA -----
## The table can be read back into R with the following command:
## data <- read.csv("meanstdavgs.csv", header = TRUE)