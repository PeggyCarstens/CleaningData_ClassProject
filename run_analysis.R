# The purpose of this project is to demonstrate your ability to collect, work with, 
# and clean a data set. The goal is to prepare tidy data that can be used for later 
# analysis. You will be graded by your peers on a series of yes/no questions related 
# to the project. You will be required to submit: 
#   1) a tidy data set as described below, 
#   2) a link to a Github repository with your script for performing the analysis, and 
#   3) a code book that describes the variables, the data, and any transformations 
#     or work that you performed to clean up the data called CodeBook.md. 
#   4) You should also include a README.md in the repo with your scripts. 
#     This repo explains how all of the scripts work and how they are connected.  
# 
# One of the most exciting areas in all of data science right now is wearable computing -
#   see for example  this article . Companies like Fitbit, Nike, and Jawbone Up 
#   are racing to develop the most advanced algorithms to attract new users. 
# The data linked to from the course website represent data collected from the 
# accelerometers from the Samsung Galaxy S smartphone. A full description is available 
# at the site where the data was obtained: 
#   
#   http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
# 
# Here are the data for the project: 
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# 
# You should create one R script called run_analysis.R that does the following. 
# 1.Merges the training and the test sets to create one data set.
# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
#     should 555 be included?
#     should meanFreq be included?
# 3.Uses descriptive activity names to name the activities in the data set
# 4.Appropriately labels the data set with descriptive variable names. 
# 
# 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#x_test and x_train are 8976 bytes long but I don't have any idea on the # of columns or column names
#subject_test/traing.txt (1 col) - subject ID corresponding to the rows in the other tables
#X_test/train.txt - 8976 bytes per row, 561 elements?
#   join to features.txt (561 rows.- space delimited - #<space>description)
#y_test.txt (1 col) (2948 recs each) - activity # 1-6 (walk, walk up, walk down, etc)
#   join to Activity_lables.txt
#subject_train.txt, X_train.txt, y_train.txt (7353 recs each)

# Features.txt - list of 561 features - does this correspond to the x_test/train.txt column headings?

##########################################################

setwd("C:/Users/Peggy/Documents/Training/Coursera/CleaningData/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")

install.packages(c("dplyr","tidyr","sqldf","tcltk"))
library(dplyr)
library(tidyr)
library(sqldf)
#library(tcltk)

# get data needed for both test and train datasets
activity_labels <- read.table("activity_labels.txt", header=FALSE, sep="", col.names = c("activity_id","activity"))
features <- read.table("features.txt", header=FALSE, sep="", col.names = c("feature_id", "feature"))
#get column names from features table and remove special characters
colNames = features[,2]
colNames <- gsub("[(][)]", "", colNames) #remove "()"
colNames <- gsub("[)]", "", colNames)    #remove ")"
colNames <- gsub("[(]", "-", colNames)   #replace "(" with "-"
colNames <- gsub(",", "-", colNames)     #replace "," with "-"

# get test data
subject_test <- read.table("test/subject_test.txt", header=FALSE, sep="", col.names=c("subject_id"))
y_test <- read.table("test/y_test.txt", header=FALSE, sep="", col.names=c("activity_id"))
x_test <- read.table("test/x_test.txt", header=FALSE, sep="", col.names=colNames)

# get train data
subject_train <- read.table("train/subject_train.txt", header=FALSE, sep="", col.names=c("subject_id"))
y_train <- read.table("train/y_train.txt", header=FALSE, sep="", col.names=c("activity_id"))
x_train <- read.table("train/x_train.txt", header=FALSE, sep="", col.names=colNames)

# merge datasets
test <- merge(y_test, activity_labels, by.x="activity_id", by.y="activity_id", ALL=TRUE)
test <- cbind(test, subject_test, x_test)

train <- merge(y_train, activity_labels, by.x="activity_id", by.y="activity_id", ALL=TRUE)
train <- cbind(train, subject_train, x_train)

# merge the test and train datasets
DF <- rbind(test, train)

# create subset of mean and std dev columns
cols <- c(2,3, c(grep(".mean", names(DF))), c(grep(".std", names(DF))))
meanStdDF <- DF[,cols]

actSubj <- group_by(meanStdDF, activity, subject_id)
#this works but I don't want to specify every column
# it seems like one of the apply functions should work
#asDF <- summarize(act, mean(tBodyAcc.mean.X), mean(tBodyAcc.mean.Y))

# calculate mean on all the values in actSubj by act/subject
cols <- names(actSubj)[-1:-2] #cols to summarize
m <- sapply(cols, function(x) substitute(mean(x), list(x=as.name(x))))
actSubjDF <- do.call(summarise, c(list(.data=actSubj), m))

