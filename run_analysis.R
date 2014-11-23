#Part 0

library(dplyr)

#load the data. This file is placed in the main directory of the data set.

xtrain <- read.table("train/X_train.txt",nrows=7352) 
xtest <- read.table("test/X_test.txt",nrows=7352)
ytrain <- read.table("train/Y_train.txt")
ytest <- read.table("test/Y_test.txt")
strain <- read.table("train/subject_train.txt")
stest <- read.table("test/subject_test.txt")
features <- read.table("features.txt")
labels <- read.table("activity_labels.txt")

#provide column names

names(xtest) <- features$V2
names(xtrain) <- features$V2
names(ytest) <- "Activity"
names(ytrain) <- "Activity"
names(stest) <- "Subject"
names(strain) <- "Subject"

#Part 1

#merge the data

trainset <- cbind (strain,ytrain,xtrain)
testset <- cbind (stest,ytest,xtest)
fullset <- rbind(testset,trainset)


#Part 2

#Select only the columns with means and stds

names(fullset) <- make.names(names(fullset),unique=TRUE)
selectset <- select(fullset,matches("Subject"),matches("Activity"),contains("mean.."),contains("std")) %>% select(-contains("angle"))

? se#Part 3

#change to factors, then relabel factors

selectset$Activity <- factor(selectset$Activity)
levels(selectset$Activity) <- labels$V2

#Part 4

#names are already descriptive, this cleans it up a bit
names(selectset) <- gsub("mean","Mean",names(selectset),fixed=TRUE)
names(selectset) <- gsub("std","Std",names(selectset),fixed=TRUE)
names(selectset) <- gsub("BodyBody","Body",names(selectset),fixed=TRUE)
names(selectset) <- gsub("..","",names(selectset),fixed=TRUE)
names(selectset) <- gsub(".","_",names(selectset),fixed=TRUE)
names(selectset) <- gsub("Mag_Mean","_Mean_Mag",names(selectset),fixed=TRUE)
names(selectset) <- gsub("Mag_Std","_Std_Mag",names(selectset),fixed=TRUE)
names(selectset) <- gsub("tBody","t_Body_",names(selectset),fixed=TRUE)
names(selectset) <- gsub("tGravity","t_Gravity_",names(selectset),fixed=TRUE)
names(selectset) <- gsub("fBody","f_Body_",names(selectset),fixed=TRUE)

#Part5

longset <- melt(selectset,c("Subject","Activity"),variable.name="Signal")
longset <- group_by(longset,Subject,Activity,Signal)
averageset <- ungroup(summarise(longset,average=mean(value)))
separateset <- separate(averageset,Signal, into = c("Domain","Component","Signal","Statistic","Direction"))
tidyset <- spread(separateset,Statistic,average)
names(tidyset)[7] <- "average Mean"
names(tidyset)[8] <- "average Std"
write.table(tidyset,file="tidydataset.txt",row.names = FALSE)
