---
title: "Codebook"
author: "Lodewic van Twillert"
date: "Thursday, January 22, 2015"
---

# Data Codebook

==================================================================
  
  Tidy dataset constructed from original dataset
  
  Human Activity Recognition Using Smartphones Dataset
  
  Version 1.0
 
    
==================================================================

## Data 

The original [dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) contains observations of 561 different variables that are difficult to analyze on their own. The codebook of the original dataset can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The new tidy dataset is found as 'tidy_data.txt'.

## Variables

A new tidy dataset is constructed which summarizes the original data and stores it in a more understandable format. The tidy data contains measurements of 81 different variables. All variables are listed, in order, below,

* subject
* activity
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

For all variables, except 'subject' and 'activity', the mean, standard deviation and meanFreq measurements were taken from the original data. 

## Methods and transformation

The data was then transformed to form the tidy dataset. To accomplish this, the following steps are done in order,
  
  * Read the test and training dataset, the activity labels and the subject id's
  * Merge the test and training data to form one big dataset
  * Extract only the mean and standard deviation of measured variables
  * Add appriopriate column names to the dataset, as listed in the original 'features.txt' file
  * Arrange the data by subject and activity label
  * Replace the activity label numbers by their respective activity description
  * Take the mean value of the data grouped by subject and activity
    (e.g. every subject will have 6 observations, one for every activity)
    
  The tidy dataset is written to the 'tidy_data.txt' file, present in this repository.
