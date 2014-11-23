getting-and-cleaning-data
=========================

Getting and Cleaning Data Course Project

The run_analysis.R file in this directory was created for the Getting and Cleaning Data Course Project. Instructions on how the file can be run and how it meets the project requirements are detailed in this readMe.

To run the script:
1. Download the data from the following link
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. Unzip the file

3. Run the run_analysis.R file from the main directory of the data set (by default called UCI HAR Dataset, in whichever directory you unzipped it to)

The script loads the relevant data from the dataset into the workspace and provides appropriate column names for the data. The matching was done in accordance with the documentation from the original UCI HAR Dataset.


The project requirements are discussed below:

1. Merges the training and the test sets to create one data set.

The script first uses cbind the combine the individual components of the test and the train sets respectively, before using rbind to merge the test and train sets as required.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

As stated in the original documentation, 33 different signals were measured or derived, and for each of these signals, a set of variables was extracted. Two of these variables, mean and standard deviation were extracted as required in the assignment, through identification of the appropriate labels.

Note that the variable "meanFreq" was disregarded, as it is a separate variable derived from some of the same signals. Additionally, while some additional vectors were calculated using means, these were not deemed relevant as well, as they were actually measuring angles instead of means or stds.

3. Uses descriptive activity names to name the activities in the data set

The activity labels from the original dataset were extracted and replaced their numeric representations in the working data set

4. Appropriately labels the data set with descriptive variable names.

The dataset was labelled before Part 1, to facilitate the merging of the data sets. In this part, the labels are cleaned up (errors existed originally) and split into 5 different parts, separated by underscores. The format of each label is as follows (a_b_c_d_e).

a: Domain (as per Domain in Codebook.md)
b: Component (as per Component in Codebook.md)
c: Signal (as per Signal in Codebook.md)
d: Statistic (either the Mean or the Standard Deviation (Std), used to calculate the average subsequently)
e: Direction (as per Direction in Codebook.md)

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Through use of the tidyr package, the data set is tidied in accordance with the requirements outlined in "Tidy Data" by Hadley Wickham (available at http://vita.had.co.nz/papers/tidy-data.pdf). 

The text file produced at the end of the script, as required for the project can be read again with the following commands in R

data <- read.table("tidydataset.txt", header = TRUE)
View(data)

END