library(data.table)
library(dplyr)

## START "Step 1: Merges the training and the test sets to create one data set."

archive <- "UCI HAR Dataset.zip"

# Read raw data files

activity_labels <- read.table(unz(archive, "UCI HAR Dataset/activity_labels.txt"))
       features <- read.table(unz(archive, "UCI HAR Dataset/features.txt"))
   subject_test <- read.table(unz(archive, "UCI HAR Dataset/test/subject_test.txt"))
  activity_test <- read.table(unz(archive, "UCI HAR Dataset/test/y_test.txt"))
   feature_test <- read.table(unz(archive, "UCI HAR Dataset/test/X_test.txt"))
  subject_train <- read.table(unz(archive, "UCI HAR Dataset/train/subject_train.txt"))
 activity_train <- read.table(unz(archive, "UCI HAR Dataset/train/y_train.txt"))
  feature_train <- read.table(unz(archive, "UCI HAR Dataset/train/X_train.txt"))

# Add subject and activity identifiers to form training and testing data tables.
trainDT <- data.table(subject_train$V1, activity_train$V1, feature_train)
 testDT <- data.table(subject_test$V1, activity_test$V1, feature_test)                      
 fullDT <- rbind(trainDT, testDT)

# Provide subject identifier, activity identifier, and feature names as preliminary variable names.
names(fullDT) <- c("subjectID", "activityID", as.character(features$V2))

## COMPLETES Step 1.
## Note that the "test/train" status has been dropped from the dataset.

## START "Step 2: Extracts only the measurements on the mean and standard deviation 
#                 for each measurement."

# Find column indices for variable names with "mean()" or "std()" substrings.
var_columns <- grep("mean\\(\\)|std\\(\\)", names(fullDT))

# Extract relevant columns form complte datat table.
step4DT <- data.table(select(fullDT, c(1, 2, var_columns)))

## COMPLETES Step 2.

## START "Step 3: Uses descriptive activity names to name the activities in the data set."

# Translate activity IDs (1..6) to descriptive names.
# Cast activity_labels as data.table.
activity_labels <- data.table(activity_labels)

# Name columns for activity_labels.
names(activity_labels) <- c("activityID", "activity")

# Set keys to prepare for merging.
setkey(activity_labels, activityID)
setkey(step4DT, activityID)

# Merge activity labels into main data table.
step4DT <- merge(activity_labels, step4DT)

# Drop unused column
step4DT[, activityID:=NULL]

## COMPLETES Step 3. Note that step4tDT rows have been sorted.

## START "Step 4: Appropriately labels the data set with descriptive variable names."
## Note that columns for activity and subject labelled in earlier steps.

# Drop parens and dashes from variable names.
names(step4DT) <- gsub("\\(\\)|-", "", names(step4DT))

# Morph variable endings to facilitate visual identification.
names(step4DT) <- sub("mean$", "_mean", names(step4DT))
names(step4DT) <- sub("std$", "_sd", names(step4DT))
names(step4DT) <- sub("meanX", "X_mean", names(step4DT))
names(step4DT) <- sub("meanY", "Y_mean", names(step4DT))
names(step4DT) <- sub("meanZ", "Z_mean", names(step4DT))
names(step4DT) <- sub("stdX", "X_sd", names(step4DT))
names(step4DT) <- sub("stdY", "Y_sd", names(step4DT))
names(step4DT) <- sub("stdZ", "Z_sd", names(step4DT))

## Note that several labels provided in the original data set contained errors.
#  Specifically, several variables in the frequency domain start with substring
#  "fBodyBody" which should be contracted to just "fBody"
names(step4DT) <- sub("^fBodyBody", "fBody", names(step4DT))

## COMPLETES Step 4.

## START "Step 5: From the data set in step 4, creates a second, independent tidy data set
#         with the average of each variable for each activity and each subject."

# Reshape to structure final data table.
molten <- melt(step4DT, id.vars = c("activity", "subjectID"), variable.name = "variable")
finalDT <- dcast(molten, activity + subjectID ~ variable, mean)

# Write the result to textfile. Use space to separate values and UNIX-style end-of-line \n.
write.table(finalDT, file = "Averages of Selected UCI HAR Dataset Variables.txt", sep = " ", eol = "\n", row.names = FALSE)

## COMPLETES Step 5.