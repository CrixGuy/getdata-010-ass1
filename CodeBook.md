# Codebook
## getdata-010-ass1
##Getting and Cleaning Data (Coursera) - Assignment 1
#
##Variables used
#
<ul><b>Imported raw data</b>
<li><b>subject_train</b>: Subjects who performed the activity for each record (train data set) </li>
<li><b>subject_test</b>: (as above) (test data set) </li>

<li><b>x_train</b>: Contains the raw data for each of the 561 variables that are recorded for each activity. The column names for this data set are found in features.txt in the top level directory. (train data set) </li>
<li><b>x_test</b>: (as above) (test data set) </li>

<li><b>y_train</b>: Indicates the activity undertaken at the time of record creation. The numbers correspond to the different activities as detailed in the activity_labels.txt file in the top level directory. (train data set) </li>
<li><b>y_test</b>: (as above) (test data set) </li>

<li><b>subject_train</b>: Indicates the subject who performed the activity for each symbol. (train data set) </li>
<li><b>subject_test</b>: (as above) (test data set) </li>

<li><b>features</b>: Column names for large raw data set (561 variables)</li>

<li><b>activities</b>: ID and type of activity (walking, sitting, etc.) that was undertaken at the time of record creation </li>
</ul>



<ul><b>Creating the data set and tidying the data</b>
<li><b>cnames</b>: A list of the column names as collected from features.txt file.</li>

<li><b>test_data</b>: The basic data set that includes all data from the the test data set (y_test, subject_test, x_test and a new column indicating the data set 'test')</li>

<li><b>train_data</b>: The basic data set that includes all data from the the train data set (y_train, subject_train, x_train and a new column indicating the data set 'train')</li>

<li><b>test_and_train</b>: A new data set that combines the train and test data sets</li>

<li><b>tt_ms</b>: Full data set only containing mean and std columns, along with descriptive detail of the record (activity, subject, data type)</li>

<li><b>summarised_data</b>: A new tidy data set with the average of each variable for each activity and each subject </li>

</ul>
#
#
#
#
##Data transformations: 
###
###   	1. Import the files and create the appropriate variables and datasets.
### 	
### 	2. Appropriately label the data set with descriptive variable names. 
### 	   	a) Create column names from the included file.
### 	   	b) Modify the column names, replacing characters that will cause problems when working with the data set specifically hyphens '-' and brackets '()'.
### 	   	c) Apply the column names to the main raw data file that includes the most of the variables.
### 	   	d) Include the extra columns to have a complete data set for test and train datasets.
###
### 	3. Merge all of the columns to create the training and the test data sets, indicating from which data set the data is from.
###
### 	4. Merge the training and the test sets to create one data set.
### 		- Modify the data_type column to change it from factor to character class.
### 		- Remove 'duplicated' columns (eg. fBodyGyro-bandsEnergy_1,8.1, fBodyGyro-bandsEnergy_9,16.1, etc.) as they were interfering with the dplyr package and the duplicated columns were not required.
###
### 	5. Extract only the measurements on the mean and standard deviation for each measurement. 
### 		a) Create new data set to only contain mean and std columns, along with descriptive detail of the record (activity, subject, data type).
###
### 	6. Uses descriptive activity names to name the activities in the data set.
### 		a) Factor the activity column to form ID's that can easily be modified to name the activities in the dataset.
### 		b) Rename the activity id by adjusting the factor levels of the activity column by looking up the activities data set.
###
###   	7. From the data set created thusfar, create a second, independent tidy data set with the average of each variable for each activity and each subject.
### 		a) ready the data set for use with the dplyr package.
### 		b) group the data set by activity and subject.
### 		c) summarise each of the remaining columns to show the average of each variable for each activity and each subject. 
### 		d) write the new data set to a file (step_5_output.txt). 