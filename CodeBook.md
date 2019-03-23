# Course project - Getting and Cleaning Data week 4
This is the code book for the course project for the course Getting and Cleaning Data week 4.

# The data set

## Raw data
The source of the raw data is UCI Machine Learning Repository. The raw data was collected from the accelerometers from the Samsung Galaxy S smartphone. Data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Information about the data set
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Data files
The raw dataset included the following main files:
* ‘README.txt‘: Information about the experiment and the files in the data set
* ‘activity_labels.txt‘: Information about activities performed (code and name for each activity)
* ‘features.txt‘: Labels for the variables of the feature vector
* ‘features_info.txt‘: Information about the features (which comes from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ)
* ‘train/y_train.txt‘: Training labels
* ‘train/X_train.txt‘: Training set
* ‘test/y_test.txt‘: Test labels
* ‘test/X_test.txt‘: Test set.

The following files are available for the train and test data. Their descriptions are equivalent.

* ‘train/subject_train.txt‘: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* ‘train/Inertial Signals/total_acc_x_train.txt‘: The acceleration signal from the smartphone accelerometer X axis in standard gravity units ‘g’. Every row shows a 128 element vector. The same description applies for the ‘total_acc_x_train.txt’ and ‘total_acc_z_train.txt‘ files for the Y and Z axis.
‘train/Inertial Signals/body_acc_x_train.txt‘: The body acceleration signal obtained by subtracting the gravity from the total acceleration.
‘train/Inertial Signals/body_gyro_x_train.txt’: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

# Data transformation
The raw dataset is transformed by running the [run_analysis.R](./run_analysis.R) script. The transformation steps are broadly described below. For more information see comments in the script file.

* Assigning data frames - load relevant data from the raw data set into data tables and name columns appropriately
* 1: Merge the training and the test sets to create one data set - Merge the data from the step above into one data table: mergedData
* 2: Extract only the measurements on the mean and standard deviation for each measurement - select the specific columns which are are relevant from the mergedData data table
* 3: Use descriptive activity names to name the activities in the data set - Replace the codes in TidyData with the names of the activities which corresponds to the related codes
* 4: Use descriptive variable names to appropriately label the data set - replace shortened column names with more descriptive names
* 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject - the independent tidy data set is after adding average of each variable for each activity and each subject, written to the tidy data file [tidydata.txt](./tidydata.txt)

# Variables
Here are the variabels in the tidy data file:

* TimeBodyAccelerometermeanX
* TimeBodyAccelerometermeanY
* TimeBodyAccelerometermeanZ
* TimeGravityAccelerometermeanX
* TimeGravityAccelerometermeanY
* TimeGravityAccelerometermeanZ
* TimeBodyAccelerometerJerkmeanX
* TimeBodyAccelerometerJerkmeanY
* TimeBodyAccelerometerJerkmeanZ
* TimeBodyGyroscopemeanX
* TimeBodyGyroscopemeanY
* TimeBodyGyroscopemeanZ
* TimeBodyGyroscopeJerkmeanX
* TimeBodyGyroscopeJerkmeanY
* TimeBodyGyroscopeJerkmeanZ
* TimeBodyAccelerometerMagnitudemean
* TimeGravityAccelerometerMagnitudemean
* TimeBodyAccelerometerJerkMagnitudemean
* TimeBodyGyroscopeMagnitudemean
* TimeBodyGyroscopeJerkMagnitudemean
* FrequencyBodyAccelerometermeanX
* FrequencyBodyAccelerometermeanY
* FrequencyBodyAccelerometermeanZ
* FrequencyBodyAccelerometermeanFreqX
* FrequencyBodyAccelerometermeanFreqY
* FrequencyBodyAccelerometermeanFreqZ
* FrequencyBodyAccelerometerJerkmeanX
* FrequencyBodyAccelerometerJerkmeanY
* FrequencyBodyAccelerometerJerkmeanZ
* FrequencyBodyAccelerometerJerkmeanFreqX
* FrequencyBodyAccelerometerJerkmeanFreqY
* FrequencyBodyAccelerometerJerkmeanFreqZ
* FrequencyBodyGyroscopemeanX
* FrequencyBodyGyroscopemeanY
* FrequencyBodyGyroscopemeanZ
* FrequencyBodyGyroscopemeanFreqX
* FrequencyBodyGyroscopemeanFreqY
* FrequencyBodyGyroscopemeanFreqZ
* FrequencyBodyAccelerometerMagnitudemean
* FrequencyBodyAccelerometerMagnitudemeanFreq
* FrequencyBodyAccelerometerJerkMagnitudemean
* FrequencyBodyAccelerometerJerkMagnitudemeanFreq
* FrequencyBodyGyroscopeMagnitudemean
* FrequencyBodyGyroscopeMagnitudemeanFreq
* FrequencyBodyGyroscopeJerkMagnitudemean
* FrequencyBodyGyroscopeJerkMagnitudemeanFreq
* AngleTimeBodyAccelerometerMeanGravity
* AngleTimeBodyAccelerometerJerkMeanGravityMean
* AngleTimeBodyGyroscopeMeanGravityMean
* AngleTimeBodyGyroscopeJerkMeanGravityMean
* AngleXGravityMean
* AngleYGravityMean
* AngleZGravityMean
* TimeBodyAccelerometerstdX
* TimeBodyAccelerometerstdY
* TimeBodyAccelerometerstdZ
* TimeGravityAccelerometerstdX
* TimeGravityAccelerometerstdY
* TimeGravityAccelerometerstdZ
* TimeBodyAccelerometerJerkstdX
* TimeBodyAccelerometerJerkstdY
* TimeBodyAccelerometerJerkstdZ
* TimeBodyGyroscopestdX
* TimeBodyGyroscopestdY
* TimeBodyGyroscopestdZ
* TimeBodyGyroscopeJerkstdX
* TimeBodyGyroscopeJerkstdY
* TimeBodyGyroscopeJerkstdZ
* TimeBodyAccelerometerMagnitudestd
* TimeGravityAccelerometerMagnitudestd
* TimeBodyAccelerometerJerkMagnitudestd
* TimeBodyGyroscopeMagnitudestd
* TimeBodyGyroscopeJerkMagnitudestd
* FrequencyBodyAccelerometerstdX
* FrequencyBodyAccelerometerstdY
* FrequencyBodyAccelerometerstdZ
* FrequencyBodyAccelerometerJerkstdX
* FrequencyBodyAccelerometerJerkstdY
* FrequencyBodyAccelerometerJerkstdZ
* FrequencyBodyGyroscopestdX
* FrequencyBodyGyroscopestdY
* FrequencyBodyGyroscopestdZ
* FrequencyBodyAccelerometerMagnitudestd
* FrequencyBodyAccelerometerJerkMagnitudestd
* FrequencyBodyGyroscopeMagnitudestd
* FrequencyBodyGyroscopeJerkMagnitudestd

# Tidy data
The tidy data is available in the tidy data file [tidydata.txt](./tidydata.txt)