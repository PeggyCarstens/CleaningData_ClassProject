# Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

Smartlab - Non Linear Complex Systems Laboratory

DITEN - Università degli Studi di Genova.

Via Opera Pia 11A, I-16145, Genoa, Italy.

activityrecognition@smartlab.ws

www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

A description of the experiments can be found at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

For each record of the original tests it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

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
- 'train/Inertial Signals/total\_acc\_x\_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total\_acc\_x\_train.txt' and 'total\_acc\_z\_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body\_acc\_x\_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body\_gyro\_x\_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


### run_analysis.R program \(high-level processing steps\)

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. This includes measurements for "meanFreq".
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

These above files should be in your current working directory before running run_analysis.R. 
 
They can be downloaded at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


## Data Dictionary - Mean\_by\_Activity_Subject.txt

For more information on the variables refer to the features_info.txt file in the original data.

All measurements have been normalised between -1 and +1.

 
| Variable name / Description                         | Type/Size    | Values              |
| --------------------------------------------------- | ------------ | ------------------- |
| activity                                            | Character 10 | LAYING              |         	
| /  Activity Name                                      |              | SITTING             |
|                                                     |              | STANDING            |
|                                                     |              | WALKING             |
|                                                     |              | WALKING\_DOWNSTAIRS |
|                                                     |              | WALKING\_UPSTAIRS   |
| subject_id                                          | Integer      |                     |
| /  ID of the subject who performed the activity       |              |                     |
| mean.tBodyAcc.mean.X                                | Numeric      |                     |
| /  Mean of tBodyAcc-mean\(\)-X                        |              |                     |
| mean.tBodyAcc.mean.Y                                | Numeric      |                     |
| /  Mean of tBodyAcc-mean\(\)-Y                        |              |                     |
| mean.tBodyAcc.mean.Z                                | Numeric      |                     |
| /  Mean of tBodyAcc-mean\(\)-Z                        |              |                     |
| mean.tGravityAcc.mean.X                             | Numeric      |                     |
| /  Mean of tGravityAcc-mean\(\)-X                     |              |                     |
| mean.tGravityAcc.mean.Y                             | Numeric      |                     |
| /  Mean of tGravityAcc-mean\(\)-Y                     |              |                     |
| mean.tGravityAcc.mean.Z                             | Numeric      |                     |
| /  Mean of tGravityAcc-mean\(\)-Z                     |              |                     |
| mean.tBodyAccJerk.mean.X                            | Numeric      |                     |
| /  Mean of tBodyAccJerk-mean\(\)-X                    |              |                     |
| mean.tBodyAccJerk.mean.Y                            | Numeric      |                     |
| /  Mean of tBodyAccJerk-mean\(\)-Y                    |              |                     |
| mean.tBodyAccJerk.mean.Z                            | Numeric
| /  Mean of tBodyAccJerk-mean\(\)-Z                    |              |                     |
| mean.tBodyGyro.mean.X                               | Numeric      |                     |
| /  Mean of tBodyGyro-mean\(\)-X                       |              |                     |
| mean.tBodyGyro.mean.Y                               | Numeric      |                     |
| /  Mean of tBodyGyro-mean\(\)-Y                       |              |                     |
| mean.tBodyGyro.mean.Z                               | Numeric      |                     |
| /  Mean of tBodyGyro-mean\(\)-Z                       |              |                     |
| mean.tBodyGyroJerk.mean.X                           | Numeric      |                     |
| /  Mean of tBodyGyroJerk-mean\(\)-X                   |              |                     |
| mean.tBodyGyroJerk.mean.Y                           | Numeric      |                     |
| /  Mean of tBodyGyroJerk-mean\(\)-Y                   |              |                     |
| mean.tBodyGyroJerk.mean.Z                           | Numeric      |                     |
| /  Mean of tBodyGyroJerk-mean\(\)-Z                   |              |                     |
| mean.tBodyAccMag.mean                               | Numeric      |                     |
| /  Mean of tBodyAccMag-mean\(\)                        |              |                     |
| mean.tGravityAccMag.mean                            | Numeric      |                     | 
| /  Mean of tGravityAccMag-mean\(\)                     |              |                     |
| mean.tBodyAccJerkMag.mean                           | Numeric      |                     |
| /  Mean of tBodyAccJerkMag-mean\(\)                    |              |                     |
| mean.tBodyGyroMag.mean                              | Numeric      |                     |
| /  Mean of tBodyGyroMag-mean\(\)                       |              |                     |
| mean.tBodyGyroJerkMag.mean                          | Numeric      |                     |
| /  Mean of tBodyGyroJerkMag-mean\(\)                   |              |                     |
| mean.fBodyAcc-mean.X                                | Numeric      |                     |
| /  Mean of fBodyAcc-mean\(\)-X                         |              |                     |
| mean.fBodyAcc.mean.Y                                | Numeric      |                     | 
| /  Mean of fBodyAcc-mean\(\)-Y                         |              |                     |
| mean.fBodyAcc.mean.Z                                | Numeric      |                     |
| /  Mean of fBodyAcc-mean\(\)-Z                         |              |                     |
| mean.fBodyAcc.meanFreq.X                            | Numeric      |                     |
| /  Mean of fBodyAcc-meanFreq\(\)-X                     |              |                     |
| mean.fBodyAcc.meanFreq.Y                            | Numeric      |                     |
| /  Mean of fBodyAcc-meanFreq\(\)-Y                     |              |                     |
| mean.fBodyAcc.meanFreq.Z                            | Numeric      |                     |
| /  Mean of fBodyAcc-meanFreq\(\)-Z                     |              |                     |
| mean.fBodyAccJerk.mean.X                            | Numeric      |                     |
| /  Mean of fBodyAccJerk-mean\(\)-X                     |              |                     |
| mean.fBodyAccJerk.mean.Y                            | Numeric      |                     |
| /  Mean of fBodyAccJerk-mean\(\)-Y                     |              |                     |
| mean.fBodyAccJerk.mean.Z                            | Numeric      |                     |
| /  Mean of fBodyAccJerk-mean\(\)-Z                     |              |                     |
| mean.fBodyAccJerk.meanFreq.X                        | Numeric      |                     |
| /  Mean of fBodyAccJerk-meanFreq\(\)-X                 |              |                     |
| mean.fBodyAccJerk.meanFreq.Y                        | Numeric      |                     |
| /  Mean of fBodyAccJerk-meanFreq\(\)-Y                 |              |                     |
| mean.fBodyAccJerk.meanFreq.Z                        | Numeric      |                     |
| /  Mean of fBodyAccJerk-meanFreq\(\)-Z                 |              |                     |
| mean.fBodyGyro.mean.X                               | Numeric      |                     |
| /  Mean of fBodyGyro-mean\(\)-X                        |              |                     |
| mean.fBodyGyro.mean.Y                               | Numeric      |                     |
| /  Mean of fBodyGyro-mean\(\)-Y                        |              |                     |
| mean.fBodyGyro.mean.Z                               | Numeric      |                     |
| /  Mean of fBodyGyro-mean\(\)-Z                        |              |                     |
| mean.fBodyGyro.meanFreq.X                           | Numeric      |                     |
| /  Mean of fBodyGyro-meanFreq\(\)-X                    |              |                     |
| mean.fBodyGyro.meanFreq.Y                           | Numeric      |                     |
| /  Mean of fBodyGyro-meanFreq\(\)-Y                    |              |                     |
| mean.fBodyGyro.meanFreq.Z                           | Numeric      |                     |
| /  Mean of fBodyGyro-meanFreq\(\)-Z                    |              |                     |
| mean.fBodyAccMag.mean                               | Numeric      |                     |
| /  Mean of fBodyAccMag-mean\(\)                         |              |                     |
| mean.fBodyAccMag-meanFreq                           | Numeric      |                     |
| /  Mean of fBodyAccMag-meanFreq\(\)                     |              |                     |
| mean.fBodyBodyAccJerkMag.mean                       | Numeric      |                     |
| /  Mean of fBodyBodyAccJerkMag-mean\(\)                 |              |                     |
| mean.fBodyBodyAccJerkMag.meanFreq                   | Numeric      |                     |
| /  Mean of fBodyBodyAccJerkMag-meanFreq\(\)             |              |                     |
| mean.fBodyBodyGyroMag.mean                          | Numeric      |                     |
| /  Mean of fBodyBodyGyroMag-mean\(\)                    |              |                     |
| mean.fBodyBodyGyroMag.meanFreq                      | Numeric      |                     |
| /  Mean of fBodyBodyGyroMag-meanFreq\(\)                |              |                     |
| mean.fBodyBodyGyroJerkMag.mean                      | Numeric      |                     |
| /  Mean of fBodyBodyGyroJerkMag-mean\(\)                |              |                     |
| mean.fBodyBodyGyroJerkMag.meanFreq                  | Numeric      |                     |
| /  Mean of fBodyBodyGyroJerkMag-meanFreq\(\)            |              |                     |
| mean.tBodyAcc.std.X                                 | Numeric      |                     |
| /  Mean of tBodyAcc-std\(\)-X                          |              |                     |
| mean.tBodyAcc.std.Y                                 | Numeric      |                     |
| /  Mean of tBodyAcc-std\(\)-Y                          |              |                     |
| mean.tBodyAcc.std.Z                                 | Numeric      |                     |
| /  Mean of tBodyAcc-std\(\)-Z                          |              |                     |
| mean.tGravityAcc.std.X                              | Numeric      |                     |
| /  Mean of tGravityAcc-std\(\)-X                       |              |                     |
| mean.tGravityAcc.std.Y                              | Numeric      |                     |
| /  Mean of tGravityAcc-std\(\)-Y                       |              |                     |
| mean.tGravityAcc.std.Z                              | Numeric      |                     |
| /  Mean of tGravityAcc-std\(\)-Z                       |              |                     |
| mean.tBodyAccJerk.std.X                             | Numeric      |                     |
| /  Mean of tBodyAccJerk-std\(\)-X                      |              |                     |
| mean.tBodyAccJerk.std.Y                             | Numeric      |                     |
| /  Mean of tBodyAccJerk-std\(\)-Y                      |              |                     |
| mean.tBodyAccJerk.std.Z                             | Numeric      |                     |
| /  Mean of tBodyAccJerk-std\(\)-Z                      |              |                     |
| mean.tBodyGyro.std.X                                | Numeric      |                     |
| /  Mean of tBodyGyro-std\(\)-X                         |              |                     |
| mean.tBodyGyro.std.Y                                | Numeric      |                     |
| /  Mean of tBodyGyro-std\(\)-Y                         |              |                     |
| mean.tBodyGyro.std.Z                                | Numeric      |                     |
| /  Mean of tBodyGyro-std\(\)-Z                         |              |                     |
| mean.tBodyGyroJerk.std.X                            | Numeric      |                     |
| /  Mean of tBodyGyroJerk-std\(\)-X                     |              |                     |
| mean.tBodyGyroJerk.std.Y                            | Numeric      |                     |
| /  Mean of tBodyGyroJerk-std\(\)-Y                     |              |                     |
| mean.tBodyGyroJerk.std.Z                            | Numeric      |                     |
| /  Mean of tBodyGyroJerk-std\(\)-Z                     |              |                     |
| mean.tBodyAccMag.std                                | Numeric      |                     |
| /  Mean of tBodyAccMag-std\(\)                          |              |                     |
| mean.tGravityAccMag.std                             | Numeric      |                     |
| /  Mean of tGravityAccMag-std\(\)                       |              |                     |
| mean.tBodyAccJerkMag.std                            | Numeric      |                     |
| /  Mean of tBodyAccJerkMag-std\(\)                      |              |                     |
| mean.tBodyGyroMag.std                               | Numeric      |                     |
| /  Mean of tBodyGyroMag-std\(\)                         |              |                     |
| mean.tBodyGyroJerkMag.std                           | Numeric      |                     |
| /  Mean of tBodyGyroJerkMag-std\(\)                     |              |                     |
| mean.fBodyAcc.std.X                                 | Numeric      |                     |
| /  Mean of fBodyAcc-std\(\)-X                          |              |                     |
| mean.fBodyAcc.std.Y                                 | Numeric      |                     |
| /  Mean of fBodyAcc-std\(\)-Y                          |              |                     |
| mean.fBodyAcc.std.Z                                 | Numeric      |                     |
| /  Mean of fBodyAcc-std\(\)-Z                          |              |                     |
| mean.fBodyAccJerk.std.X                             | Numeric      |                     |
| /  Mean of fBodyAccJerk-std\(\)-X                      |              |                     |
| mean.fBodyAccJerk.std.Y                             | Numeric      |                     |
| /  Mean of fBodyAccJerk-std\(\)-Y                      |              |                     |
| mean.fBodyAccJerk.std.Z                             | Numeric      |                     |
| /  Mean of fBodyAccJerk-std\(\)-Z                      |              |                     |
| mean.fBodyGyro.std.X                                | Numeric      |                     |
| /  Mean of fBodyGyro-std\(\)-X                         |              |                     |
| mean.fBodyGyro.std.Y                                | Numeric      |                     |
| /  Mean of fBodyGyro-std\(\)-Y                         |              |                     |
| mean.fBodyGyro.std.Z                                | Numeric      |                     |
| /  Mean of fBodyGyro-std\(\)-Z                         |              |                     |
| mean.fBodyAccMag.std                                | Numeric      |                     |
| /  Mean of fBodyAccMag-std\(\)                          |              |                     |
| mean.fBodyBodyAccJerkMag.std                        | Numeric      |                     |
| /  Mean of fBodyBodyAccJerkMag-std\(\)                  |              |                     |
| mean.fBodyBodyGyroMag.std                           | Numeric      |                     |
| /  Mean of fBodyBodyGyroMag-std\(\)                     |              |                     |
| mean.fBodyBodyGyroJerkMag.std                       | Numeric      |                     |
| /  Mean of fBodyBodyGyroJerkMag-std\(\)                 |              |                     |
	

## Relevant Papers:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra, Jorge L. Reyes-Ortiz. Energy Efficient Smartphone-Based Activity Recognition using Fixed-Point Arithmetic. Journal of Universal Computer Science. Special Issue in Ambient Assisted Living: Home Care. Volume 19, Issue 9. May 2013

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 4th International Workshop of Ambient Assited Living, IWAAL 2012, Vitoria-Gasteiz, Spain, December 3-5, 2012. Proceedings. Lecture Notes in Computer Science 2012, pp 216-223.

Jorge Luis Reyes-Ortiz, Alessandro Ghio, Xavier Parra-Llanas, Davide Anguita, Joan Cabestany, Andreu Català. Human Activity and Motion Disorder Recognition: Towards Smarter Interactive Cognitive Environments. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

