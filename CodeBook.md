# Getting and Cleaning Data: Course Project Code Book

## Data sources

Data used in this assignment was originally obtained from:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]

This data contains measurements of movement by volunteer subjects, collected using a Samsung Galaxy S II smartphone.

However, for the purposes of this assignment, the data was downloaded from:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]


## Data transformations

1. Data on subject IDs, activity labels, and movement measurements were combined. This was done for test and training datasets separately.
2. Next, the test and training datasets were combined into a single dataset.
3. The original data files originally contained 561 time and frequency domain variables -- for the purposes of this project, the final dataset was pared down to 66 measurement variables, in addition to a subject ID variable and a variable for the activity label. Only measurements on the mean and standard deviation for each measurement were retained.
4. Finally, the dataset was restructured so that each row was a unique combination of the subject ID and activity label. Each measurement variable was summarized by the mean value.


## Variables in final dataset

The resulting dataset contains the following variables:

* subject: subject ID
* activity: one of six activity labels (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
* The remaining variables are all measurements obtained via an accelerometer and gyroscope, with the following naming conventions:
  * Prefixes of "t" or "f" indicate a measurement from the time or frequency domain, respectively.
  * "X," "Y," and "Z" indicate the respective signal directions for each triaxial acceleration/angular velocity measurement.
  * "Body" and "Gravity" indicate body and gravitational motion components measured by the sensor acceleration signal, respectively.
  * "Acc" indicates measurements obtained from the device accelerometer.
  * "Gyro" indicates measurements obtained from the device gyroscope.
  * "Jerk" indicates jerk signals from the body linear acceleration and angular velocity.
  * "Mag" indicates the magnitude of the three-dimensional signals, calculated using the Euclidan norm.
  * "Mean" and "Std" indicate the data summary type -- mean or standard deviation.