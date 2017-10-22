# Loading required libraries

library(plyr)
library(data.table)
library(dplyr) 

# Downloading  and unzipping the dataset
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Data.zip")

	unzip(zipfile="./data/Data.zip",exdir="./data")

# Reading files
	
	# Reading testing tables
	x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
    y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
    subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
	
	# Reading trainings tables
	x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
    y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
    subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
	
	# Reading features and activitis labels
	features <- read.table('./data/UCI HAR Dataset/features.txt')
	activity_labels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

# Cleaning initial data

	# Assigning column names
	colnames(x_test) <- t(features[2])
	colnames(x_train) <- t(features[2])
	x_test$activities <- y_test[, 1]
	x_test$participants <- subject_test[, 1]
	x_train$activities <- y_train[, 1]
	x_train$participants <- subject_train[, 1]
	
# 1. Merging the training and the test sets to create one data set

	main_table <- rbind(x_test, x_train)
	duplicated(colnames(main_table))
	main_table <- main_table[, !duplicated(colnames(main_table))]
	
# 2. Extracting only the measurements on the mean and standard deviation for each measurement
	
	# Subsetting to only means
	mean <- grep("mean()", names(main_table), value = FALSE, fixed = TRUE)
	mean <- append(mean, 471:477) # includding additional means
	mean_table <- main_table[mean]
	
	# Subsetting to only standard deviations
	std <- grep("std()", names(main_table), value = FALSE)
	std_table <- main_table[std]
	
# 3. Using descriptive activity names to name the activities in the data set
	
	main_table$activities <- as.character(main_table$activities)
	main_table$activities[main_table$activities == 1] <- "Walking"
	main_table$activities[main_table$activities == 2] <- "Walking Upstairs"
	main_table$activities[main_table$activities == 3] <- "Walking Downstairs"
	main_table$activities[main_table$activities == 4] <- "Sitting"
	main_table$activities[main_table$activities == 5] <- "Standing"
	main_table$activities[main_table$activities == 6] <- "Laying"
	main_table$activities <- as.factor(main_table$activities)
	
# 4. Appropriately labeling the data set with descriptive variable names

	# names(main_table) shows that original variable names contain acronyms and abbreviations
	# Using gsub to replace the names
	names(main_table) <- gsub("Acc", "Accelerator", names(main_table))
	names(main_table) <- gsub("Mag", "Magnitude", names(main_table))
	names(main_table) <- gsub("Gyro", "Gyroscope", names(main_table))
	names(main_table) <- gsub("^t", "time", names(main_table))
	names(main_table) <- gsub("^f", "frequency", names(main_table))
	
	# Changing participants names
	main_table$participants <- as.character(main_table$participants)
	main_table$participants[main_table$participants == 1] <- "Participant 1"
	main_table$participants[main_table$participants == 2] <- "Participant 2"
	main_table$participants[main_table$participants == 3] <- "Participant 3"
	main_table$participants[main_table$participants == 4] <- "Participant 4"
	main_table$participants[main_table$participants == 5] <- "Participant 5"
	main_table$participants[main_table$participants == 6] <- "Participant 6"
	main_table$participants[main_table$participants == 7] <- "Participant 7"
	main_table$participants[main_table$participants == 8] <- "Participant 8"
	main_table$participants[main_table$participants == 9] <- "Participant 9"
	main_table$participants[main_table$participants == 10] <- "Participant 10"
	main_table$participants[main_table$participants == 11] <- "Participant 11"
	main_table$participants[main_table$participants == 12] <- "Participant 12"
	main_table$participants[main_table$participants == 13] <- "Participant 13"
	main_table$participants[main_table$participants == 14] <- "Participant 14"
	main_table$participants[main_table$participants == 15] <- "Participant 15"
	main_table$participants[main_table$participants == 16] <- "Participant 16"
	main_table$participants[main_table$participants == 17] <- "Participant 17"
	main_table$participants[main_table$participants == 18] <- "Participant 18"
	main_table$participants[main_table$participants == 19] <- "Participant 19"
	main_table$participants[main_table$participants == 20] <- "Participant 20"
	main_table$participants[main_table$participants == 21] <- "Participant 21"
	main_table$participants[main_table$participants == 22] <- "Participant 22"
	main_table$participants[main_table$participants == 23] <- "Participant 23"
	main_table$participants[main_table$participants == 24] <- "Participant 24"
	main_table$participants[main_table$participants == 25] <- "Participant 25"
	main_table$participants[main_table$participants == 26] <- "Participant 26"
	main_table$participants[main_table$participants == 27] <- "Participant 27"
	main_table$participants[main_table$participants == 28] <- "Participant 28"
	main_table$participants[main_table$participants == 29] <- "Participant 29"
	main_table$participants[main_table$participants == 30] <- "Participant 30"
	main_table$participants <- as.factor(main_table$participants)
	
# 5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject

	main_table.dt <- data.table(main_table)
	# Takes the mean of every column by participants and activities
	tidy_data <- main_table.dt[, lapply(.SD, mean), by = 'participants,activities']
	write.table(tidy_data, file = "TidyTable.txt", row.names = FALSE)
	
	

	








