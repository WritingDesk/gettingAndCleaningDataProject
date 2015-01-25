---
title: "README"
author: "ML"
date: "Sunday, January 25, 2015"
output: html_document
---

This file provides an explanation of the run_analysis.R script and the code book, which are both  included in this GitHub repo. 

In conjunction with this README document, these files fulfil the requirements of the Course Project assigned during the Jan. 5, 2015 sessions of Getting and Cleaning Data, taught by Jeff Leek, through Coursera.

Original assignment
-------------------------
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 You should create one R script called run_analysis.R that does the following. 
 
1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


Explanation of run_analysis.R
-----------------

The script run_analysis.R has 5 distinct sections which accomplish the 5 requirements above. In addition to the general overview of the script below, you can find detailed comments within the script code.

**Requirements to run:**

-The script will install the data.table package

-The file folder nameed, "UCI HAR Dataset" must be in the working directory.

**1 - Merging testing and training**

After unzipping the file found here, https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip , into the working directory, the script finds all of the required data sets and reads them into the Global Environment. It then proceeds to name the col names. 

The data is categorized as either testing data, or training data, e.g. the experimental group wanted to know if with the training data, they could use the variables measured to identify the signature of each type of activity, and they would test the activity identificaiton algorithms on the testing data.

For our purposes, we woudld like to create a data file that has erged the testing and training data. This is done by adding the testing data as new rows below the training data, while making sure the column names are aligned. 

*Files used include:*

* UCI HAR Dataset/features.txt 
  (variable names for measurements taken)
  
* UCI HAR Dataset/activity_labels.txt 
  (identifies activities of subject during measurement)

*training files were also included, just replace test with training, below*

* UCI HAR Dataset/test/X_test.txt
  (records contains normalized data for the measured variables)
  
* UCI HAR Dataset/test/subject_test.txt
  (contains subject id data that allows us to identify who was being measured for each record in X_test.txt)
  
* UCI HAR Dataset/test/y_test.txt
  (contains activity type data tht allows us to identify which activity was being performed for each record in X_test.txt)
  
**2 - Purge all variables that are not calculated means or standard deviations**

According to the assignment, we are to drop all variable columns that are not either a calculated mean or a calculated standard deviation. The script uses a regular expression to keep all of the variables that had "mean("" or "std("" in them as well as "meanfreq", but excluded all angular variables. Angular data that includes a mean value as one of the vectors have been excluded on purpose, because the reported angular values are not means.

**3 - Renaming activity variables**

In order to create a tidy data set, the activity labels need to be changed to be more descriptive and styled to match the google style guide for R. https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml

1 -> walking.during.measurement

2 -> walking.upstairs.during.measurement

3 -> walking.downstairs.during.measurement

4 -> sitting.during.measurement

5 -> standing.during.measurement

6 -> laying.during.measurement  

**4 - Renaming measured variable names**

In this section, the variable names originally given in features.txt, are replaced with variable names that match this R style guide from Google: https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml#identifiers

I used the sub() function to go through and create more meaningful variable names to remove ambiguity, and create consistancy. You can find more info about the variables in the code book.

**5 - Means grouped by id and activity - file output**

In this section, the values from the full data table are averaged across groups. The groups are by subject id, and subject activity type. Finally, a file is written that contains these averages in a tidy data file named, "meansForEachVariable_GroupedByIdAndActivity.txt".

It was easier to use the data.table package in this section, as it allowed for easier averaging of grouped data.

I decided to produce a long file, where records are the measured variables (which have already, in step 2 been wittled down to be only the variables that are the mean and std of the raw data), and the column variable names describe the calculation done on these measured variable across a particular group, e.g. "mean.of.variables.for.id.17", "mean.of.variables.for.standing.during.measurement.group".

This means that in the column with title, "mean.of.variables.for.standing.during.measurement.group", each row corresponds to an average of the row variable (listed in column 1) for all instances of a subject standing while that variable was calculated.

Code book
------------
For a detailed explanation of each variable name used in this script, please refer to the code book included in this GitHub repo.



