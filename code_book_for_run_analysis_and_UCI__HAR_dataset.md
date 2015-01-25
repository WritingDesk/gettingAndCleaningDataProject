---
title: "Code_Book"
author: "ML"
date: "Sunday, January 25, 2015"
output: html_document
---

This code book is a modified version of the original which can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
--------------------------------
*Human Activity Recognition Using Smartphones Dataset modified to fulfill the requirement of coursera's Jan 5, 2015 "Getting and Clearning data"" course project. Version 1.01*

**Original data collection and analysis by:**
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

**Original description**
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

**Additional processsing in version 1.01**
--------------------------------------
Further processing, performed as a requirement of the Getting and Clearning data course, was applied to produce, the file, "meansForEachVariable_GroupedByIdAndActivity.txt".
This processing can be repeated by using the run_analysis.R script.

Each record in this file corresponds to one of 79 sensor signals (either a calculated mean or stdev of the raw sensor data), all non mean or non stdev sensor signals were excluded.

**For each records the columns provided in the data set are:**

- Its particular sensor signal label

- Mean of all instances of the particular sensor signal values measured for each individual subject

- Mean of all instances of the particular sensor signal values measured for any subject performing a particular activity.

In other words, each record corespond to one of 79 sensor signals included in the original data set, and each column is either the identifying label for the sensor signal, or a mean of that sensor signal calculated across certain groups of the data. Those groups are made up for individual subjects, and multiple subjects performing the same activity during measurement, e.g. walking, sitting, or standing.

Variable (column) names and meaning:
----------
Each column is a mean calcualted for a particular group, and each record corresponds to a different sensor signal identified in the column, "variables.measured".

Each record for any variable starting with "mean.or.variables.for" is a normalized value between -1 and 1, **and therefore is unitless**.

When a variable (column) name ends in "id.x", it means that the sensor signals have been averaged across all instances recorded for subject x, no matter what activity that subject was participating in when the original data was recorded.


           "mean.of.variables.for.id.1"

           "mean.of.variables.for.id.3"
           
           "mean.of.variables.for.id.5" 
           
           "mean.of.variables.for.id.6" 
           
           "mean.of.variables.for.id.7" 
           
           "mean.of.variables.for.id.8" 
           
           "mean.of.variables.for.id.11" 
           
           "mean.of.variables.for.id.14"
           
           "mean.of.variables.for.id.15" 
           
           "mean.of.variables.for.id.16" 
           
           "mean.of.variables.for.id.17" 
           
           "mean.of.variables.for.id.19" 
           
           "mean.of.variables.for.id.21" 
           
           "mean.of.variables.for.id.22" 
           
           "mean.of.variables.for.id.23" 
           
           "mean.of.variables.for.id.25" 
           
           "mean.of.variables.for.id.26" 
           
           "mean.of.variables.for.id.27" 
           
           "mean.of.variables.for.id.28" 
           
           "mean.of.variables.for.id.29" 
           
           "mean.of.variables.for.id.30" 
           
           "mean.of.variables.for.id.2"
           
           "mean.of.variables.for.id.4" 
           
           "mean.of.variables.for.id.9" 
           
           "mean.of.variables.for.id.10" 
           
           "mean.of.variables.for.id.12" 
           
           "mean.of.variables.for.id.13" 
           
           "mean.of.variables.for.id.18" 
           
           "mean.of.variables.for.id.20" 
           
           "mean.of.variables.for.id.24" 

When a variable (column) name contains "mean.of.variables.for.**x**.during.meassurement.group" it means that the sensor signals have been averaged across all instances recorded by any subject that was participating in activity **x**.

This activity, **x**, indicates what the subjects were doing while the sensor signals were recorded originally.

           "mean.of.variables.for.standing.during.measurement.group"
           
           "mean.of.variables.for.sitting.during.measurement.group" 
           
           "mean.of.variables.for.laying.during.measurement.group" 
           
           "mean.of.variables.for.walking.during.measurement.group" 
           
           "mean.of.variables.for.walking.downstairs.during.measurement.group"
           
           "mean.of.variables.for.walking.upstairs.during.measurement.group"
           
Included sensor signals
-----------------------
**components of the sensor signal names**

Each variable is made up of 5 parts, those parts are defined below and allow for each label to be understood.

**A.B.C.D.E**
--------

**part A**

* *time.domain* - indicates that the data was taken in the time domain rather than the frequency domain.
* *frequency.domain* - a Fast Fourier Transform (FFT) was applied to these sensor signals.

**Part B**

* *body.acceleration* - indicates that the sensor signal is recording the linear acceleration of the the subjects phones due only to body movement and not gravity.
* *gravityacceleration* - indicates that the sensor signal is measuring linear accelration due to gravity, and not due to a change in the motion of the phone.
* *body.gyro* - the angular acceleration of the phone (no need to distinguish between body and gravity for this variable since there is not an angular component to the gravitational force)

**Part B modifier**

* *jerk* - indicates a the time derivative was taken to obtain the rate of change of the measured acceleration 

**Part C**

* *mag.mean* -  indicates that the variable being averaged is a magnitude, obtained from the sqroot of the sum of squares of the x, y, and z components of the vector quantity measured during original data collection.

* *mag.std* -  indicates that the value is the standard deviation of magnitude data that was calculated from raw data that was recorded during a measurement window during the original data collection.

* *mean* -  indicates that the value is an average of the raw data that was recorded during a measurement window during the original data collection.

* *std* -  indicates that the value is the standard deviation calculated from raw data that was recorded during a measurement window during the original data collection.

* *mean.freq* -  Weighted average of the frequency components to obtain a mean frequency

**Part D**

* *x* -  indicates that the variable was recorded for the x axis of the phone.

* *y* -  indicates that the variable was recorded for the y axis of the phone

* *z* -  indicates that the variable was recorded for the z axis of the phone

Sensor signal labels
------------
Labels based on the A.B.C.D.E key given above.

* time.domain.body.acceleration.mean.x
* time.domain.body.acceleration.mean.y
* time.domain.body.acceleration.mean.z
* time.domain.body.acceleration.std.x
* time.domain.body.acceleration.std.y
* time.domain.body.acceleration.std.z
* time.domain.gravityacceleration.mean.x
* time.domain.gravityacceleration.mean.y
* time.domain.gravityacceleration.mean.z
* time.domain.gravityacceleration.std.x
* time.domain.gravityacceleration.std.y
* time.domain.gravityacceleration.std.z
* time.domain.body.acceleration.jerk.mean.x
* time.domain.body.acceleration.jerk.mean.y
* time.domain.body.acceleration.jerk.mean.z
* time.domain.body.acceleration.jerk.std.x
* time.domain.body.acceleration.jerk.std.y
* time.domain.body.acceleration.jerk.std.z
* time.domain.body.gyro.mean.x
* time.domain.body.gyro.mean.y
* time.domain.body.gyro.mean.z
* time.domain.body.gyro.std.x
* time.domain.body.gyro.std.y
* time.domain.body.gyro.std.z
* time.domain.body.gyro.jerk.mean.x
* time.domain.body.gyro.jerk.mean.y
* time.domain.body.gyro.jerk.mean.z
* time.domain.body.gyro.jerk.std.x
* time.domain.body.gyro.jerk.std.y
* time.domain.body.gyro.jerk.std.z
* time.domain.body.acceleration.mag.mean
* time.domain.body.acceleration.mag.std
* time.domain.gravityacceleration.mag.mean
* time.domain.gravityacceleration.mag.std
* time.domain.body.acceleration.jerk.mag.mean
* time.domain.body.acceleration.jerk.mag.std
* time.domain.body.gyro.mag.mean
* time.domain.body.gyro.mag.std
* time.domain.body.gyro.jerk.mag.mean
* time.domain.body.gyro.jerk.mag.std
* frequency.domain.body.acceleration.mean.x
* frequency.domain.body.acceleration.mean.y
* frequency.domain.body.acceleration.mean.z
* frequency.domain.body.acceleration.std.x
* frequency.domain.body.acceleration.std.y
* frequency.domain.body.acceleration.std.z
* frequency.domain.body.acceleration.mean.freq.x
* frequency.domain.body.acceleration.mean.freq.y
* frequency.domain.body.acceleration.mean.freq.z
* frequency.domain.body.acceleration.jerk.mean.x
* frequency.domain.body.acceleration.jerk.mean.y
* frequency.domain.body.acceleration.jerk.mean.z
* frequency.domain.body.acceleration.jerk.std.x
* frequency.domain.body.acceleration.jerk.std.y
* frequency.domain.body.acceleration.jerk.std.z
* frequency.domain.body.acceleration.jerk.mean.freq.x
* frequency.domain.body.acceleration.jerk.mean.freq.y
* frequency.domain.body.acceleration.jerk.mean.freq.z
* frequency.domain.body.gyro.mean.x
* frequency.domain.body.gyro.mean.y
* frequency.domain.body.gyro.mean.z
* frequency.domain.body.gyro.std.x
* frequency.domain.body.gyro.std.y
* frequency.domain.body.gyro.std.z
* frequency.domain.body.gyro.mean.freq.x
* frequency.domain.body.gyro.mean.freq.y
* frequency.domain.body.gyro.mean.freq.z
* frequency.domain.body.acceleration.mag.mean
* frequency.domain.body.acceleration.mag.std
* frequency.domain.body.acceleration.mag.mean.freq
* frequency.domain.body.acceleration.jerk.mag.mean
* frequency.domain.body.acceleration.jerk.mag.std
* frequency.domain.body.acceleration.jerk.mag.mean.freq
* frequency.domain.body.gyro.mag.mean
* frequency.domain.body.gyro.mag.std
* frequency.domain.body.gyro.mag.mean.freq
* frequency.domain.body.gyro.jerk.mag.mean
* frequency.domain.body.gyro.jerk.mag.std
* frequency.domain.body.gyro.jerk.mag.mean.freq

Files included
----------------------
- run_analysis.R - provides a reproducible way in which to reconstruct the present data set from the original data set.
- README.md - provides a clear description of the puspose for the creation of the current data set, and the methods used to obtain it.
- code\_book_for_run_analysis_and_UCI__HAR_dataset.md
- meansForEachVariable\_GroupedByIdAndActivity.txt - the data set obtained from applying run_analysis.R, which consists of means for 79 sensor signals averaged across individual subjects and multiple subjects performing the same activity.

Original Data Set Information
===============================

For each record it is provided:
--------------------

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
-------------------------

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
-------------
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
------------
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.