
# README


  This repository contains the run_analysis.r script that is used to analyze data from the Samsung Galaxy S accelerometers. run_analysis.r takes the [dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and creates a new tidy dataset. The tidy dataset contains 180 observations of 81 variables. Information about the methods to construct the tidy dataset and about the variables it contains can be found in the Cookbook.md file.
  
  run_analysis.r contains code to download the original dataset but instructions are given if the user already has the data in the working directory. The data is then transformed to form the tidy dataset. To accomplish this, the following steps are done in order,
  
  * Read the test and training dataset, the activity labels and the subject id's
  * Merge the test and training data to form one big dataset
  * Extract only the mean and standard deviation of measured variables
  * Add appriopriate column names to the dataset, as listed in the original 'features.txt' file
  * Arrange the data by subject and activity label
  * Replace the activity label numbers by their respective activity description
  * Take the mean value of the data grouped by subject and activity
    (e.g. every subject will have 6 observations, one for every activity)
    
