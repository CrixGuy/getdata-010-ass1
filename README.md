##README
#------------------------------------------------------------
## getdata-010-ass1
###Getting and Cleaning Data (Coursera) - Assignment 1
 
## Abstract: 
#------------------------------------------------------------
###One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.
#
###The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. 
#
#
## Instructions
#------------------------------------------------------------
###Create one R script called run_analysis.R that does the following:
###   1. Merges the training and the test sets to create one data set.
###   2. Extracts only the measurements on the mean and standard deviation for each measurement. 
###   3. Uses descriptive activity names to name the activities in the data set
###   4. Appropriately labels the data set with descriptive variable names. 
###   5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#
#
#
## Files
#------------------------------------------------------------
A detailed list of included files can be found below...
#
###Included are:
- run_analysis.R: A script file that runs an analysis of files from.
- ReadMe.md: This file.
- CodeBook.md: A file describing the variables, and data used, as well as all transformations that were performed to clean up the data.  
- A txt file containing the tidy data set that was created in the final step of the instructions.


## Dataset information
#
###The data that is used for this project was found at:
### https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#
#
###Excerpt from the readme.md file:
#
###The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

###The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

##For each record it is provided:
#======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.