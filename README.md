## Getting and cleaning data

R version used - 3.4.2
OS - Windows 8.1x64
Required loading the dplyr library.

Description of the R script work.
1. Reading the data given in the text files using read.table function.
2. Merging the test and the train data using rbind function.
3. Setting the data frame names using the data read from the features.txt file.
4. Filtering mean and standard deviasion measurements using grep function with regular expression.
5. Setting descriptive activity names for activities read from the labels.txt file.
6. Adding activities and subjects variables to the data gotten in step 4 using cbind function.
7. Getting data frame of mean values of all variables for each activity.
	1. Grouping data gotten in step 6 by activities using group_by function.
	2. Selecting all columns except for subjects.
	3. Getting mean values of all variables grouped by activities using summarise_all function.
	4. Renaming activity column in Averaged_by.
8. Getting data frame of mean values of all variables for each subject.
	1. Grouping data gotten in step 6 by subjects using group_by function.
	2. Selecting all columns except for activities.
	3. Getting mean values of all variables grouped by subjects using summarise_all function.
	4. Renaming subject column in Averaged_by.
9. Merging datas gotten in steps 8 and 9 using bind_rows function.