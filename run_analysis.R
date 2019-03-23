### Run the analysis in the course project - Getting and Cleaning Data week 4.

library(dplyr) # Load dplyr package used to work with data tables in R

## Prepare the data for analysis

## Download and unzip data 
fileName <- "dataset.zip"

if (!file.exists(fileName)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileURL, fileName, method="curl")
}  

if (!file.exists("UCI HAR Dataset")) { 
        unzip(fileName) 
}

## Assigning data frames

# Load activity labels into a data frame and name columns appropriately
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

# Load features into a data frame
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))

# Load test data into data frames and name columns appropriately
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
xTest <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions) # Use function names from features table
yTest <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")

# Load training data into data frames and name columns appropriately
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions) # Use function names from features table
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")


## 1: Merge the training and the test sets to create one data set
X <- rbind(xTrain, xTest) # Use rbind to add (row bind) the rows of x_test after the rows in x_train
Y <- rbind(yTrain, yTest) # Similar as above
subject <- rbind(subjectTrain, subjectTest) # Similar as above
mergedData <- cbind(subject, Y, X) # Use cbind to add (column bind) the columns of the Subject, Y and X to create a data frame 
                                        # with one data set from all the data we need: Merged_Data

## 2. Extract only the measurements on the mean and standard deviation for each measurement
## From the Merged_Data data frame, select the specific columns which are are relevant (including all the columns which 
## contains mean and standard deviations data)
selectedData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))

## 3. Use descriptive activity names to name the activities in the data set
## Replace the codes in TidyData with the names of the activities which corresponds to the
## codes (from "UCI HAR Dataset/activity_labels.txt" )
selectedData$code <- activities[selectedData$code, 2]

## 4. Use descriptive variable names to appropriately label the data set
## Shortened column names or part of names are replaced with longer, more descriptive names
names(selectedData)[2] = "activity"
names(selectedData)<-gsub("Acc", "Accelerometer", names(selectedData))
names(selectedData)<-gsub("Gyro", "Gyroscope", names(selectedData))
names(selectedData)<-gsub("BodyBody", "Body", names(selectedData))
names(selectedData)<-gsub("Mag", "Magnitude", names(selectedData))
names(selectedData)<-gsub("^t", "Time", names(selectedData))
names(selectedData)<-gsub("^f", "Frequency", names(selectedData))
names(selectedData)<-gsub("tBody", "TimeBody", names(selectedData))
names(selectedData)<-gsub("-mean()", "Mean", names(selectedData), ignore.case = T)
names(selectedData)<-gsub("-std()", "STD", names(selectedData), ignore.case = T)
names(selectedData)<-gsub("-freq()", "Frequency", names(selectedData), ignore.case = T)
names(selectedData)<-gsub("angle", "Angle", names(selectedData))
names(selectedData)<-gsub("gravity", "Gravity", names(selectedData))

names(selectedData) <- gsub("\\.", "", names(selectedData)) # Remove dots from names 

## 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject, 
## from the data set in step 4
tidyData <- selectedData %>% 
        group_by(subject, activity) %>% # Group by subject and activity to be able to analyse them independently
        summarise_all(funs(mean)) # Create a single row for each subject and activity with the means of each variable in 
                                  # one column

write.table(tidyData, "tidydata.txt", row.name=F) # Write the content of tidyData to the file tidydata.txt