---
title: "Code Book"
output: html_notebook
---

### **Getting and Cleaning Data Project**
### Author: Fernando A. 

This course project uses data from the "Human Activity Recognition Using Smartphones Data Set"


### *Data Set Information:*

This dataset contains data for *30 SUBJECTS* that provided their wearable data. Subjects age ranges between 19 and 48 years. 

For each subject, 6 different activities were collected. The *"Activity"* field can contain 6 values, each with an index number:
1 - WALKING
2 - WALKING_UPSTAIRS
3 - WALKING_DOWNSTAIRS
4 - SITTING
5 - STANDING
6 - LAYING

According to the original documentation provided alongside this dataset:
_Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data._

_The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain._

### *Attribute Information:*

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

The focus of this Coursera project was to obtain the means for any field containing the mean and standard deviation values for each subject and activity type:
- mean(): Mean value
- std(): Standard deviation

More information about this dataset can be found here: [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

