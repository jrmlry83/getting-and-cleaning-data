codebook-md
=========================

#Getting and Cleaning Data Course Project Codebook

##Background

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

The data was normalised from [-1,1] and all values are thus unitless, but it is not stated how the data was normalised.

##Table Variables

1. Subject: Each test subject was labelled with a different label
	* 1-30

2. Activity: The 6 activities that each subject was asked to perform, with self-explanatory labels
	* WALKING
	* WALKING_UPSTAIRS
	* WALKING_DOWNSTAIRS
	* SITTING
	* STANDING
	* LAYING

3. Domain: The domain in which the signals are being evaluated
	* t - time domain signals
	* f - frequency domain signals, after an FFT was applied to the time domain signals

4. Component: The accelerometer signals were attributed to either body movements or gravity
	* Body - signals attributed to body movement
	* Gravity - signals attributed to gravity


5. Signal: States the kind of signal being measured. There are 4 different types.
	* Acc - directly from accelerometer data
	* AccJerk - body linear acceleration was derived in time to produce accelerometer jerk signals
	* Gyro - directly from gyroscope data
	* GyroJerk - angular velocity was derived in time to produce gyroscope jerk signals

6. Direction: The accelerometer and gyroscope data were collected in three axes, and the magnitude was also calculated
	* X - X-axis
	* Y - Y-axis
	* Z - Z-axis
	* Mag - Magnitude of the signal, i.e. sqrt(x^2 + y^2 + z^2)

##Table Values

The Mean value and the Standard deviation for the signals were collected for each set of observations

7. average Mean: states the average of all Mean values obtained for each set of variables
8. average Std: states the average of all Std values obtained for each set of variables



