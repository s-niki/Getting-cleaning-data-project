# Getting and Cleaning Data Course Project
======
Author: Sergii Nikiforov

In this GitHub repository you will find R script and descriptive documentation files that are a Coursera's "Getting and Cleaning Data" Course project.

### Project description

_The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected._

_One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:_

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

_Here are the data for the project:_

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

_You should create one R script called run_analysis.R that does the following._

_1. Merges the training and the test sets to create one data set._
_2. Extracts only the measurements on the mean and standard deviation for each measurement._
_3. Uses descriptive activity names to name the activities in the data set._
_4. Appropriately labels the data set with descriptive variable names._
_5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject._

## Files decription (steps to reproduce the project)

**run_analysis.R**  - a script that performs data analysis, tidies data and creates a file, which contains a tidy dataset.

**CodeBook.md** - a description of the variables, the data, and operations to clean up and tidy the data

The output of the run_analysis.R script is a file TidyTable.txt, which is uploaded to the submittion form.

