##Read required data from files.

features <- read.table("UCI HAR Dataset//features.txt")
labels <- read.table("UCI HAR Dataset//activity_labels.txt")
train.set <- read.table("UCI HAR Dataset//train//X_train.txt")
test.set <- read.table("UCI HAR Dataset//test//X_test.txt")
train.activities <- read.table("UCI HAR Dataset//train//y_train.txt")
test.activities <- read.table("UCI HAR Dataset//test//y_test.txt")
train.subjects <- read.table("UCI HAR Dataset//train//subject_train.txt")
test.subjects <- read.table("UCI HAR Dataset//test//subject_test.txt")

##Merge train and test data.

set <- rbind(train.set, test.set)
activities <- rbind(train.activities, test.activities)
subjects <- rbind(train.subjects, test.subjects)
rm(train.set, test.set, train.activities,
   test.activities, train.subjects, test.subjects)

##Set appropriate viriable names.

names(set) <- features[, 2]
rm(features)

##Extract the measurements of mean (not meanFreq) and standard deviation only.

set <- set[, grep(".*-(mean|std)\\(\\).*", names(set))]

##Use descriptive activity names for activities.

activities[[1]] <- as.character(labels[activities[[1]], 2])
rm(labels)

##Merge activities and subjects with set.

names(activities) <- "Activity"
names(subjects) <- "Subject"
set <- cbind(set, activities, subjects)
rm(subjects)
rm(activities)

##Creat independent tidy data set with the average of each variable
##for each activity and each subject

averages <- set %>% group_by(Activity, Subject) %>% summarise_all(mean)