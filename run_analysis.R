#=============
run_analysis.R
#=============

library(dplyr) # SQL functions
library(data.table) # fread function

# 0. Extract the data
zipURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFileName <- "UCI HAR Dataset.zip"
download.file(zipURL, zipFileName)
unzip(zipFileName)
list.files("./UCI HAR Dataset")


# ==============================================================================
# 1. Merges the training and the test sets to create one data set.
# ==============================================================================

path <- getwd()

# Next one doesn't work as it's passed as a data frame.
# features <- fread(file.path(path, "UCI HAR Dataset", "features.txt"))[,2]
# class(features)

# Need to add as.is = TRUE to keep it as character, otherwise it's passed as factor. 
features <- read.table(file.path(path, "UCI HAR Dataset", "features.txt"), as.is = TRUE)[,2]
class(features)

activities <- read.table(file.path(path, "UCI HAR Dataset", "activity_labels.txt"), as.is = TRUE, 
                         col.names = c("index","values"))
class(activities)

trainSubject <- fread(file.path(path, "UCI HAR Dataset", "train/subject_train.txt"), col.names = "Subject")
trainLabels <- fread(file.path(path, "UCI HAR Dataset", "train/Y_train.txt"), col.names = "Activity")
trainSet <- fread(file.path(path, "UCI HAR Dataset", "train/X_train.txt"))
colnames(trainSet) <- features

trainDataSet <- cbind(trainSubject, trainLabels, trainSet)

testSubject <- fread(file.path(path, "UCI HAR Dataset", "test/subject_test.txt"), col.names = "Subject")
testLabels <- fread(file.path(path, "UCI HAR Dataset", "test/Y_test.txt"), col.names = "Activity")
testSet <- fread(file.path(path, "UCI HAR Dataset", "test/X_test.txt"))
colnames(testSet) <- features

testDataSet <- cbind(testSubject, testLabels, testSet)

allDataSet <- rbind(trainDataSet, testDataSet)


# ==============================================================================
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# ==============================================================================

dataSet <- select(allDataSet, c("Subject", "Activity", contains("mean"), contains("std")))

# ==============================================================================
# 3. Uses descriptive activity names to name the activities in the data set
# ==============================================================================

dataSet$Activity <- factor(dataSet$Activity, levels = activities$index, labels = activities$values)

# ==============================================================================
# 4. Appropriately labels the data set with descriptive variable names. 
# ==============================================================================
colnames(dataSet[, 1]) # Subject column name
colnames(dataSet[, 2]) # Activity column name
colnames(dataSet) # All column names

# ==============================================================================
# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.
# ==============================================================================

tidyDataSet <- dataSet %>% 
    group_by(Subject, Activity) %>% 
    summarise(across(everything(), mean))


write.csv(tidyDataSet, "tidyDataSet.csv")


# Clean the environment ----
rm(list=ls())
