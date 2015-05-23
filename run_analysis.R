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
# 3.Uses descriptive activity names to name the activities in the data set
# 4.Appropriately labels the data set with descriptive variable names. 
# 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##########################################################

# *** Assumes data file has already been unzipped and the following
#     files are located in the current working directory:
#       activity_labels.txt
#       features.txt
#       test/subject_test.txt
#       test/x_test.txt
#       test/y_test.txt
#       train/subject_test.txt
#       train/x_test.txt
#       train/y_test.txt

install.packages(c("dplyr","tidyr"))
library(dplyr)
library(tidyr)

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

# merge test datasets
test <- merge(y_test, activity_labels, by.x="activity_id", by.y="activity_id", ALL=TRUE)
test <- cbind(test, subject_test, x_test)

# merge train datasets
train <- merge(y_train, activity_labels, by.x="activity_id", by.y="activity_id", ALL=TRUE)
train <- cbind(train, subject_train, x_train)

# merge the test and train datasets
DF <- rbind(test, train)

# create subset of activity, subject and mean and std dev columns
cols <- c(2,3, c(grep(".mean", names(DF))), c(grep(".std", names(DF))))
meanStdDF <- DF[,cols]

# group by the activity and subject_id
actSubj <- group_by(meanStdDF, activity, subject_id)

# calculate mean on all the values in actSubj by activity and subject
#   one record per activity/subject
cols <- names(actSubj)[-1:-2] #summarize all columns except activity and subject_id
m <- sapply(cols, function(x) substitute(mean(x), list(x=as.name(x))))
actSubjDF <- do.call(summarise, c(list(.data=actSubj), m))

# add "mean." to the front of the summarized columns to make them more understandable of what they are
d <- names(actSubjDF)
dm <- paste("mean.", d[3:length(d)], sep="")
names(actSubjDF)[3:length(actSubjDF)] = dm

# output the results to the current working folder
write.table(actSubjDF, file="Mean_by_Activity_Subject.txt", row.names=FALSE)


