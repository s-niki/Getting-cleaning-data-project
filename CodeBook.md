## Getting and Cleaning Data Course Project
Author: Sergii Nikiforov

### Description
**CodeBook.md** contains additional information about the variables, data and transformations used in the course project for the Johns Hopkins Getting and Cleaning Data course.

### Data
Data and full description can be found here [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### About dataset
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### About run_analysis.R script

The script with R code **run_analysis.R** performs main steps:

0. Preparatory works.

	0.1 Downloads the data.
	
	0.2 Extracts the data.
	
	0.3 Reads data files.
	
	0.4 Assigns column names to raw data.
	
1. Merges the training and the test sets to create one data set.   
2. Extracts only the measurements on the mean and standard deviation for each measurement   
3. Assigns descriptive activity names to name the activities in the data set   
4. Labels the data set with descriptive variable names   
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject

## About variables
* `x_test`, `y_test`, `x_train`, `y_train`, `subject_test` and `subject_train` contain the data from the downloaded files
* `main_table` contains merged training and test sets in one data set
* `mean_table` and `std_table` are subsest of full data table, containing only means and standard deviations for each measurement respectively
