#
# Title:  "Getting and cleaning data - Course project"
# Date:   25-Jan-2015
# File:   %run_analysis.R
# Author: "Lodewic van Twillert"
#

# Load used packages
library(plyr)
library(dplyr)

## LOADING AND MERGING THE DATA

# Download and unzip dataset if it isn't already in the working directory.
if (!'UCI HAR Dataset' %in% dir()) {
    url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
    download.file(url, destfile='Dataset.zip')
    unzip('Dataset.zip')}


# Read the training and test datasets
# Read the label and subject data
train <- read.table('./UCI HAR Dataset/train/X_train.txt')
train_lab <- read.table('./UCI HAR Dataset/train/y_train.txt')
train_sub <- read.table('./UCI HAR Dataset/train/subject_train.txt')

test <- read.table('./UCI HAR Dataset/test/X_test.txt')
test_lab <- read.table('./UCI HAR Dataset/test/y_test.txt')
test_sub <- read.table('./UCI HAR Dataset/test/subject_test.txt')

# Row-bind the test and training dataset to form one big dataset
data <- rbind(test,train)



## FILTERING THE DATASET

# Read the features.txt file
# Create a logical vector to find which features are mean and std measurements
# Extract only the measurements on the mean and standard deviation for each
# measurement
# NOTE: This will also include any 'meanFreq()' measurements
features <- read.table('./UCI HAR Dataset/features.txt')
feat_include <- sapply(features$V2, grepl, pattern='std') |
                sapply(features$V2, grepl, pattern='mean')
data <- data[,which(feat_include)]



## LABELING AND SORTING THE DATA

# Row-bind the label and subject data from the test and training data
# Include them in the data
labs <- rbind(test_lab, train_lab)
subs <- rbind(test_sub, train_sub)
data <- cbind(subs,labs,data)

# Give the data appriopriate column names, as listed in the features.txt file
# Arrange the data by subject and activity number
colnames(data) <- c('subject','activity',
                    as.character(features$V2)[which(feat_include)])
data <- arrange(data,subject,activity)

# Once the data is sorted by activity number, properly label the activity
# description, as stated in the activity_labels.txt file
activity_lab <- read.table('./UCI HAR Dataset/activity_labels.txt')
data$activity <- as.character(activity_lab$V2)[data$activity]



## CREATE TIDY DATASET

# Create a tidy dataset that takes the average of each value, grouped per
# subject and activity. Finally write it to a file
tidy_data <- ddply(data,.(subject, activity),numcolwise(mean))
write.table(tidy_data, file='tidy_data.txt',row.name=FALSE)
