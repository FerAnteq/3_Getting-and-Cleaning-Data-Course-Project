#=============
run_analysis.R
#=============

library(dplyr) # bind_rows function
library(data.table) # fread function

# 0. Extract the data
zipURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFileName <- "UCI HAR Dataset.zip"
download.file(zipURL, zipFileName)
unzip(zipFileName)
list.files("./UCI HAR Dataset")


# 1. Merges the training and the test sets to create one data set.

fread(file.path(path, "UCI HAR Dataset", "README.txt"))
fread(file.path(path, "UCI HAR Dataset", "features.txt"))

path <- getwd()




# 1. Merges the training and the test sets to create one data set.
trainSet <- fread(file.path(path, "UCI HAR Dataset", "train/X_train.txt"))
testSet <- fread(file.path(path, "UCI HAR Dataset", "test/X_test.txt"))
dataSet <- rbind(trainSet, testSet)



# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 


# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Clean the environment ----
rm(list=ls())
