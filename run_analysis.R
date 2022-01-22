## PART 1: MERGE TEST AND TRAINING DATA INTO ONE DATASET

## Seeing if files exist then downloading and unzipping
file_name <- "Getting and Cleaning Data Course Project.zip"
if(!file.exists(file_name)) {
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url, file_name, method = "curl")
}
if (!file.exists("UCI HAR Dataset")) {
  unzip(file_name)
}

## Assigning .txt files 

feature_names <-  read.table("UCI HAR Dataset/features.txt")
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

## Creating the 3 main variable rows

subject <- rbind(subject_test, subject_train)
activity <- rbind(y_test, y_train)
features <- rbind(x_test, x_train)

## Creating column names

names(subject) <- c("subject")
names(activity) <- c("activity")
names(features) <- feature_names$V2

## Putting them all together
data <- cbind(subject, activity, features)
head(data)


## PART 2: EXTRACT ONLY MEASUREMENTS ON THE MEAN AND STD DEV FOR EACH MEASUREMENT

## Need to make sure not to include the meanFreq() columns
means <- c(grep("mean\\(\\)\\-", feature_names$V2))
std <- c(grep("std()", feature_names$V2))
mean_std <- c(means, std)
mean_std <- mean_std + 2
mean_std
extracted <- data[ , c(1, 2, mean_std)]
names(extracted)

## PART 3: USE DESCRIPTIVE ACTIVITY NAMES IN DATASET 

labels <- read.table("UCI HAR Dataset/activity_labels.txt")

## Change activity numbers to be 
labels[ , 1] <- as.character(labels[ , 1])
## Change activity column to be characters
extracted[ ,2] <- as.character(extracted[ ,2])
## Sub activity numbers to names
for (act in 1:6){
  extracted$activity[extracted$activity == act] <- labels[act, 2]
}
## Turn into factor
extracted$activity <- as.factor(extracted$activity)

## PART 4: APPROPRIATELY LABEL THE DATASET WITH DESCRIPTIVE VARIABLE NAMES

names(extracted) <- gsub("^t", "time", names(extracted))
names(extracted) <- gsub("^f", "frequency", names(extracted))
names(extracted) <- gsub("Acc", "Accelerometer", names(extracted))
names(extracted) <- gsub("Gyro", "Gyroscope", names(extracted))
names(extracted) <- gsub("Mag", "Magnitude", names(extracted))
names(extracted) <- gsub("BodyBody", "Body", names(extracted))

names(extracted)


## PART 5: FROM THE DATASET IN PART 4, CREATE A SECOND, INDEPENDENT TIDY DATASET 
#  WITH THE AVERAGE OF EACH VAR FOR EACH ACTIVITY AND EACH SUBJECT
library(plyr)
library(dplyr)
library(reshape2)

## Convert subject to a factor for melting
extracted$subject <- as.factor(extracted$subject)
## Melt to make subject and activity variables
tidy <- melt(extracted, id = c("subject", "activity"))
## Rename columns
tidy <- rename(tidy, feature = variable, mean = value)
head(tidy)

write.table(tidy, file = "tidy.txt", row.names = FALSE)



