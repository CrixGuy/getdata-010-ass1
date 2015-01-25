#Create one R script called run_analysis.R that does the following:
#   1. Merges the training and the test sets to create one data set.
#   2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#   3. Uses descriptive activity names to name the activities in the data set
#   4. Appropriately labels the data set with descriptive variable names. 
#   5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(dplyr)
library(tidyr)

#Merge training and test sets into on data set

#subject who performed the activity for each symbol
subject_train <- read.table("./getdata-ass1/UCI HAR Dataset/train/subject_train.txt", header=FALSE)
subject_test <- read.table("./getdata-ass1/UCI HAR Dataset/test/subject_test.txt", header=FALSE)

#raw data for each of the 561 variables that are recorded for each activity
x_train <- read.table("./getdata-ass1/UCI HAR Dataset/train/X_train.txt", header=FALSE)
x_test <- read.table("./getdata-ass1/UCI HAR Dataset/test/X_test.txt", header=FALSE)

y_train <- read.table("./getdata-ass1/UCI HAR Dataset/train/y_train.txt", header=FALSE)
y_test <- read.table("./getdata-ass1/UCI HAR Dataset/test/y_test.txt", header=FALSE)

#Column names for large raw data set (561 variables)
features <- read.table("./getdata-ass1/UCI HAR Dataset/features.txt", header=FALSE)  

activities <- read.table("./getdata-ass1/UCI HAR Dataset/activity_labels.txt", header=FALSE) 


#Transform the data: 
# add the column names to the datasets.

cnames <- features[,2]
cnames <- sub("()", "_", cnames, fixed = TRUE)
cnames <- sub("-mean", "_Mean", cnames, fixed = TRUE)
cnames <- sub("-std", "_Std", cnames, fixed = TRUE)
cnames <- sub("-X", "_X_Axis", cnames, fixed = TRUE)
cnames <- sub("-Y", "_Y_Axis", cnames, fixed = TRUE)
cnames <- sub("-Z", "_Z_Axis", cnames, fixed = TRUE)

#Include the extra columns to have a complete data set for test and train datasets.

colnames(x_train) <- cnames
colnames(x_test) <- cnames
colnames(y_train) <- "activity"
colnames(y_test) <- "activity"
colnames(subject_test) <- "subject"
colnames(subject_train) <- "subject"
colnames(activities) <- c("id", "activity")

# and create another column indicating which the data type (test or train)
test_data <- cbind(y_test, subject_test, "data_type" = rep("test", times=nrow(x_test)), x_test)
train_data  <- cbind(y_train, subject_train, "data_type" = rep("train", times=nrow(x_train)), x_train)


#Combine the 2 datasets including another column
test_and_train <- rbind(test_data,train_data)
test_and_train$data_type <- as.character(test_and_train$data_type)

# Remove 'duplicated' columns (fBodyGyro-bandsEnergy()-1,8.1, fBodyGyro-bandsEnergy()-9,16.1) as it was interfering with the dplyr package and duplicated columns were not required 
test_and_train <- test_and_train[,!duplicated(names(test_and_train))]

#Create new data set to only contain mean and std columns, along with descriptive detail of the record (activity, subject, data type)
tt_ms <- select(test_and_train, activity, subject, data_type, contains("Mean_"), contains("Std_") )

#Rename the activity id by adjusting the factor levels of the activity column 
tt_ms$activity <- factor(tt_ms$activity)
levels(tt_ms$activity) <- activities[,2]


#Ready the data set for use with dplyr package
tt_ms <- tbl_df(tt_ms)

#group the data set by activity and subject.
summarised_data <- group_by(tt_ms, activity, subject)

#summarise each of the remaining columns to show the average of each variable for each activity and each subject. 
summarised_data <- summarise_each(summarised_data, funs(mean),-matches("data_type"))

#write new data set to a file
write.table(summarised_data, file="./getdata-ass1/UCI HAR Dataset/step_5_output.txt", row.name=FALSE)








