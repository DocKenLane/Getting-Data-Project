---
title: 'Code Book: '
author: "Dr. Ken Lane, Husson University"
date: "January 31, 2016"
output: html_document
---

## Study Design

Dataset and script were developed to meet the requirements for
_Coursera Assignment: Getting and Cleaning Data Course Project_.
The **Human Activity Recognition Using Smartphones Data Set**
used as input for this project was created at the [_Center for Machine Learning and Intelligent Systems_](http://cml.ics.uci.edu/),
_University of California, Irvine_.
The zipfile is directly available at the [_UCI Machine Learning Repository_](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#)
by clicking [here.](http://archive.ics.uci.edu/ml/machine-learning-databases/00240/ "UCI HAR Dataset")
Per _Project Instructions_, the input data file was downloaded from
[here](<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> "getdata-projectfiles-UCI HAR Dataset.zip"),
and renamed **"UCI HAR Dataset.zip"**.

The _Project_ requirements include  
1. Merge the training and the test sets to create one data set.  
2. Extract only the measurements on the mean and standard deviation for each measurement.  
3. Use descriptive activity names to name the activities in the data set.  
4. Appropriately label the data set with descriptive variable names.  
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.  

### UCI HAR Dataset

From [_UCI Machine Learning Repository_](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#):
 
> "The experiments (were) carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data." 

> "The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."

> Each record in the dataset provides:  

  * Total triaxial acceleration from the accelerometer (3 components, 128 values/component). 
  * Estimated triaxial body acceleration (3 components, 128 values/component).  
  * Triaxial angular velocity from the gyroscope. (3 components, 128 values/component).  
  * A 561-feature vector with time and frequency domain variables.  
  * An activity label (created by video tape review).  
  * An identifier of the subject who generated the record.  

> The feature vector is derived from 20 time domain variables (*prefix "t"*) and 13 frequency domain variables (*prefix "f"*).

  * tGravityAccX, tGravityAccY, tGravityAccZ, tGravityAccMag  
  * tBodyAccX, tBodyAccY, tBodyAccZ, tBodyAccMag   
  * tBodyAccJerkX, tBodyAccJerkY, tBodyAccJerkZ, tBodyAccJerkMag  
  * fBodyAccX, fBodyAccY, fBodyAccZ, fBodyAccMag  
  * fBodyAccJerkX, fBodyAccJerkY, fBodyAccJerkZ, fBodyAccJerkMag  
  * tBodyGyroX, tBodyGyroY, tBodyGyroZ, tBodyGyroMag  
  * tBodyGyroJerkX, tBodyGyroJerkY, tBodyGyroJerkZ, tBodyGyroJerkMag  
  * fBodyGyroX, fBodyGyroY, fBodyGyroZ, fBodyGyroMag  
  * fBodyGyroJerkMag
  
> For each of the 33 variables, 17 statistics are computed to constitute the 561-feature
vector, including

  * mean(): Mean value  
  * std(): Standard deviation  
  * mad(): Median absolute deviation   
  * max(): Largest value in array  
  * min(): Smallest value in array  
  * sma(): Signal magnitude area  
  * energy(): Energy measure. Sum of the squares divided by the number of values.     
  * iqr(): Interquartile range   
  * entropy(): Signal entropy  
  * arCoeff(): Autorregresion coefficients with Burg order equal to 4  
  * correlation(): correlation coefficient between two signals  
  * maxInds(): index of the frequency component with largest magnitude  
  * meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
  * skewness(): skewness of the frequency domain signal   
  * kurtosis(): kurtosis of the frequency domain signal   
  * bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window  
  * angle(): Angle between to vectors  

# Data Dictionary
There are 180 records in the **Selected Averages Dataset**,
one for each combination of 30 subjects and 6 activities.
Each records has 68 fields, including two identification variables
and 66 feature averages.

## Identification Variables
| Variable | Values |
| --- | --- |
| activity | LAYING, SITTING, STANDING, WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS |
| subjectID | 1 - 30 |

## Feature Variables 
The 66 feature variables are computed from mean and standard deviation features from the 33
variables of the UCI HAR Dataset, for each of the 180 combinations of activities and subjects.
Accelerometer-derived accelerations are given in gravitational units (9.8 meters per second squared).
Accelerometer jerks are thought to be in g's per second.
Gyro-derived velocities are in radians per second. Gyro-derived jerk is thought to be in radians
per second cubed.

| Data | UCI HAR Dataset Label | geDomain | Object | Sensor | Variable | Statistic | Units |
| --- | --- | --- | --- | --- | --- | --- |
| tBodyAccX_mean | tBodyAcc-mean()-X | Time | Body | Accelerometer | X acceleration | Mean |
| tBodyAccY_mean | tBodyAcc-mean()-Y | Time | Body | Accelerometer | Y acceleration | Mean |
| tBodyAccZ_mean | tBodyAcc-mean()-Z | Time | Body | Accelerometer | Z acceleration | Mean |
| tBodyAccX_sd | tBodyAcc-std()-X | Time | Body | Accelerometer | X acceleration | Standard deviation |  
| tBodyAccY_sd | tBodyAcc-std()-Y | Time | Body | Accelerometer | Y acceleration | Standard deviation |  
| tBodyAccZ_sd | tBodyAcc-std()-Z | Time | Body | Accelerometer | Z acceleration | Standard deviation | 
| tGravityAccX_mean | tGravityAcc-mean()-X | Time | Gravity | Accelerometer | X acceleration | Mean |
| tGravityAccY_mean | tGravityAcc-mean()-Y | Time | Gravity | Accelerometer | Y acceleration | Mean | 
| tGravityAccZ_mean | tGravityAcc-mean()-Z | Time | Gravity | Accelerometer | Z acceleration | Mean |  
| tGravityAccX_sd | tGravityAcc-std()-X | Time | Gravity | Accelerometer | X acceleration | Standard deviation |  
| tGravityAccX_sd | tGravityAcc-std()-X | Time | Gravity | Accelerometer | Y acceleration | Standard deviation |
| tGravityAccX_sd | tGravityAcc-std()-X | Time | Gravity | Accelerometer | Z acceleration | Standard deviation | 
| tBodyAccJerkX_mean | tBodyAccJerk-mean()-X | Time | Body | Accelerometer | X jerk | Mean |
| tBodyAccJerkY_mean | tBodyAccJerk-mean()-Y | Time | Body | Accelerometer | Y jerk | Mean |
| tBodyAccJerkZ_mean | tBodyAccJerk-mean()-Z | Time | Body | Accelerometer | Z jerk | Mean |
| tBodyAccJerkX_sd | tBodyAccJerk-std()-X | Time | Body | Accelerometer | X jerk | Standard deviation |
| tBodyAccJerkY_sd | tBodyAccJerk-std()-Y | Time | Body | Accelerometer | Y jerk | Standard deviation |
| tBodyAccJerkZ_sd | tBodyAccJerk-std()-Z | Time | Body | Accelerometer | Z jerk | Standard deviation | 
| tBodyGyroX_mean | tBodyGyro-mean()-X | Time | Body | Gyro | X angular velocity | Mean |
| tBodyGyroY_mean | tBodyGyro-mean()-Y | Time | Body | Gyro | Y angular velocity | Mean |
| tBodyGyroZ_mean | tBodyGyro-mean()-Z | Time | Body | Gyro | Z angular velocity | Mean | 
| tBodyGyroX_sd | tBodyGyro-std()-X | Time | Body | Gyro | X angular velocity | Standard deviation | 
| tBodyGyroY_sd | tBodyGyro-std()-Y | Time | Body | Gyro | Y angular velocity | Standard deviation | 
| tBodyGyroZ_sd | tBodyGyro-std()-Z | Time | Body | Gyro | Z angular velocity | Standard deviation | 
| tBodyGyroJerkX_mean | tBodyGyroJerk-mean()-X | Time | Body | Gyro | X angular jerk| Mean |
| tBodyGyroJerkY_mean | tBodyGyroJerk-mean()-Y | Time | Body | Gyro | Y angular jerk| Mean |
| tBodyGyroJerkZ_mean | tBodyGyroJerk-mean()-Z | Time | Body | Gyro | Z angular jerk| Mean |  
| tBodyGyroJerkX_sd | tBodyGyroJerk-std()-X | Time | Body | Gyro | X angular jerk| Standard deviation |
| tBodyGyroJerkX_sd | tBodyGyroJerk-std()-X | Time | Body | Gyro | Y angular jerk| Standard deviation |
| tBodyGyroJerkX_sd | tBodyGyroJerk-std()-X | Time | Body | Gyro | Z angular jerk| Standard deviation |  
| tBodyAccMag_mean | tBodyAccMag-mean() | Time | Body | Accelerometer | Acceleration magnitude | Mean |
| tBodyAccMag_sd | tBodyAccMag-std() | Time | Body | Accelerometer | Acceleration magnitude | Standard deviation |
| tGravityAccMag_mean | tGravityAccMag-mean() | Time | Gravity | Accelerometer | Acceleration magnitude | Mean | 
| tGravityAccMag_sd | tGravityAccMag-std() | Time | Gravityy | Accelerometer | Acceleration magnitude | Standard deviation | 
| tBodyAccJerkMag_mean | tBodyAccJerkMag-mean() | Time | Body | Accelerometer | Jerk magnitude | Mean | 
| tBodyAccJerkMag_sd | tBodyAccJerkMag-std() | Time | Body | Accelerometer | Jerk magnitude | Standard deviation |
| tBodyGyroMag_mean | tBodyGyroMag-mean() | Time | Body | Gyro | Angular velocity magnitude | Mean |
| tBodyGyroMag_sd | tBodyGyroMag-std() | Time | Body | Gyro | Angular velocity magnitude | Standard deviation |
| tBodyGyroJerkMag_mean | tBodyGyroJerkMag-mean() | Time | Body | Gyro | Angular jerk magnitude | Mean |
| tBodyGyroJerkMag_sd | tBodyGyroJerkMag-std() | Time | Body | Gyro | Angular jerk magnitude | Standard deviation |
| fBodyAccX_mean | fBodyAcc-mean()-X | Frequency | Body | Accelerometer | X acceleration | Mean |
| fBodyAccY_mean | fBodyAcc-mean()-Y | Frequency | Body | Accelerometer | Y acceleration | Mean |
| fBodyAccZ_mean | fBodyAcc-mean()-Z | Frequency | Body | Accelerometer | Z acceleration | Mean |
| fBodyAccX_sd | fBodyAcc-std()-X | Frequency | Body | Accelerometer | X acceleration | Standard deviation |
| fBodyAccY_sd | fBodyAcc-std()-Y | Frequency | Body | Accelerometer | Y acceleration | Standard deviation |
| fBodyAccZ_sd | fBodyAcc-std()-Z | Frequency | Body | Accelerometer | Z acceleration | Standard deviation |
| fBodyAccJerkX_mean | fBodyAccJerk-mean()-X | Frequency | Body | Accelerometer | X jerk | Mean |
| fBodyAccJerkY_mean | fBodyAccJerk-mean()-Y | Frequency | Body | Accelerometer | Y jerk | Mean |
| fBodyAccJerkZ_mean | fBodyAccJerk-mean()-Z | Frequency | Body | Accelerometer | Z jerk | Mean |
| fBodyAccJerkX_sd | fBodyAccJerk-std()-X | Frequency | Body | Accelerometer | X jerk | Standard deviation |
| fBodyAccJerkY_sd | fBodyAccJerk-std()-Y | Frequency | Body | Accelerometer | Y jerk | Standard deviation |
| fBodyAccJerkZ_sd | fBodyAccJerk-std()-Z | Frequency | Body | Accelerometer | Z jerk | Standard deviation |
| fBodyGyroX_mean | fBodyGyro-mean()-X | Frequency | Body | Gyro | X angular velocity | Mean |
| fBodyGyroY_mean | fBodyGyro-mean()-Y | Frequency | Body | Gyro | Y angular velocity | Mean |
| fBodyGyroZ_mean | fBodyGyro-mean()-Z | Frequency | Body | Gyro | Z angular velocity | Mean |
| fBodyGyroX_sd | fBodyGyro-std()-X | Frequency | Body | Gyro | X angular velocity | Standard deviation |
| fBodyGyroY_sd | fBodyGyro-std()-Y | Frequency | Body | Gyro | Y angular velocity | Standard deviation |
| fBodyGyroZ_sd | fBodyGyro-std()-Z | Frequency | Body | Gyro | Z angular velocity | Standard deviation |
| fBodyAccMag_mean | fBodyAccMag-mean() | Frequency | Body | Accelerometer | Acceleration magnitude | Mean |
| fBodyAccMag_sd | fBodyAccMag-std() | Frequency | Body | Accelerometer | Acceleration magnitude | Standard deviation |
| fBodyAccJerkMag_mean | fBodyAccJerkMag-mean() | Frequency | Body | Accelerometer | Jerk magnitude | Mean |
| fBodyAccJerkMag_sd | fBodyAccJerkMag-std() | Frequency | Body | Accelerometer | Jerk magnitude | Standard deviation |
| fBodyGyroMag_mean | fBodyGyroMag-mean() | Frequency | Body | Gyro | Angular velocity magnitude | Mean |
| fBodyGyroMag_sd | fBodyGyroMag-std | Frequency | Body | Gyro | Angular velocity magnitude | Standard deviation |
| fBodyGyroJerkMag_mean | fBodyGyroJerkMag-mean() | Frequency | Body | Gyro | Angular jerk magnitude | Mean |
| fBodyGyroJerkMag_sd | fBodyGyroJerkMag-std() | Frequency | Body | Gyro | Angular jerk magnitude | Standard deviation |