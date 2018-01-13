#Getting and Cleaning Data Course Project

This repo contains my project work for the Coursera Getting and Cleaning Data course.

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 

The goal is to prepare tidy data that can be used for later analysis. 

The data for this project is available here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The main script for the project is run_analysis.R. It assumes the data has been unzipped and stored in the working folder in a folder called "UCI HAR Dataset". 

The cookbook (cookbook.md) describes the variables and summaries calculated, along with units, and any other relevant information.

The script performs five main tasks outlined in the sections below.

##1. Merge training and test sets as one data set
The readr library is used for reading in the data files through read_table2 which allows for variable whitespace amounts and line widths.

The index column from the features data table is just a numbered index, so it is stripped out.  

Three new data tables are created for readings, activities and subjects by binding the respective rows of the test and training sets using bind_rows. 

The main output of this first stage is created by binding the columns of these three data tables using bind_cols and using colnames to add columns names. These names are "SubjectId", "Activity" and the list of features in the features data table.

##2. Extract only the measurements on the mean and standard deviation for each measurement.
A regex pattern is created to match the column headings for SubjectId, Activity, mean and standard deviation readings.

A subset of the data table is created by applying this regex to the column headings of the output data table from step 1 above.

##3. Uses descriptive activity names to name the activities in the data set
The Activity column is changed to a factor type by applying the mapping from the activity_labels file using recode. 

##4. Appropriately labels the data set with descriptive variable names.
The column headings are made more readable and descriptive using gsub. Basic substitutions are performed using information from features_info.txt.

##5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
The data table is melted to create a list of all variables and their values for each SubjectId and Activity.

This is then further summarised to provide the mean value of each variable for each SubjectId and Activity.
