####################################################################################################
##### Getting and Cleaning Data - Course Project.
####################################################################################################

# Set libraries and working directories.
## Libraries.
library(reshape2)
## Directories.
main_dir <- "ENTER DIRECTORY CONTAINING TEST AND TRAINING FOLDERS HERE"
test_dir <- "ENTER TEST DATA FOLDER DIRECTORY ADDRESS HERE"
train_dir <- "ENTER TRAINING DATA FOLDER DIRECTORY ADDRESS HERE"

# Pull up training and test sets.
setwd(test_dir)
subject_test <- read.table("subject_test.txt")
X_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
setwd(train_dir)
subject_train <- read.table("subject_train.txt")
X_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")

# Add column names to observations.
setwd(main_dir)
features <- read.table("features.txt")
colnames(X_test) <- features$V2
colnames(X_train) <- features$V2
colnames(y_test) <- "activity"
colnames(y_train) <- "activity"
colnames(subject_test) <- "subject"
colnames(subject_train) <- "subject"

# Merge training and test sets to create one data set.
## Combine test columns.
test_data <- cbind(subject_test,y_test,X_test)
## Combine training columns.
train_data <- cbind(subject_train,y_train,X_train)
## Merge test and training data.
all_data <- rbind(test_data,train_data)

# Extract only measurements on the mean and standard deviation for each measurement.
all_data_subset <- all_data[c(1:8,43:48,83:88,123:128,163:168,203:204,216:217,229:230,242:243,255:256,268:273,
                              347:352,426:431,505:506,518:519,531:532,544:545)]

# Uses descriptive activity names to name the activities in the data set.
activity_labels <- read.table("activity_labels.txt")
all_data_subset$activity <- factor(all_data_subset$activity, levels = activity_labels$V1,
                                   labels = activity_labels$V2)

# Label data set with descriptive activity names.
colnames(all_data_subset) <- c("subject","activity","tBodyAccMeanX","tBodyAccMeanY","tBodyAccMeanZ",
                               "tBodyAccStdX","tBodyAccStdY","tBodyAccStdZ","tGravityAccMeanX",
                               "tGravityAccMeanY","tGravityAccMeanZ","tGravityAccStdX","tGravityAccStdY",
                               "tGravityAccStdZ","tBodyAccJerkMeanX","tBodyAccJerkMeanY","tBodyAccJerkMeanZ",
                               "tBodyAccJerkStdX","tBodyAccJerkStdY","tBodyAccJerkStdZ","tBodyGyroMeanX",
                               "tBodyGyroMeanY","tBodyGyroMeanZ","tBodyGyroStdX","tBodyGyroStdY",
                               "tBodyGyroStdZ","tBodyGyroJerkMeanX","tBodyGyroJerkMeanY","tBodyGyroJerkMeanZ",
                               "tBodyGyroJerkStdX","tBodyGyroJerkStdY","tBodyGyroJerkStdZ","tBodyAccMagMean",
                               "tBodyAccMagStd","tGravityAccMagMean","tGravityAccMagStd","tBodyAccJerkMagMean",
                               "tBodyAccJerkMagStd","tBodyGyroMagMean","tBodyGyroMagStd","tBodyGyroJerkMagMean",
                               "tBodyGyroJerkMagStd","fBodyAccMeanX","fBodyAccMeanY","jBodyAccMeanZ",
                               "fBodyAccStdX","fBodyAccStdY","fBodyAccStdZ","fBodyAccJerkMeanX",
                               "fBodyAccJerkMeanY","fBodyAccJerkMeanZ","fBodyAccJerkStdX","fBodyAccJerkStdY",
                               "fBodyAccJerkStdZ","fBodyGyroMeanX","fBodyGyroMeanY","fBodyGyroMeanZ",
                               "fBodyGyroStdX","fBodyGyroStdY","fBodyGyroStdZ","fBodyAccMagMean",
                               "fBodyAccMagStd","fBodyBodyAccJerkMagMean","fBodyBodyAccJerkMagStd",
                               "fBodyBodyGyroMagMean","fBodyBodyGyroMagStd","fBodyBodyGyroJerkMagMean",
                               "fBodyBodyGyroJerkMagStd")

# Create a second, independent tidy data set with the average of each variable for each activity and each subject.
## Melt dataset.
data_melt <- melt(all_data_subset, id=c("subject","activity"))
final_data <- dcast(data_melt, subject + activity ~ variable,mean)

# Save final dataset.
write.table(final_data, "GettingCleaningDataProjectFinalDataset.txt", row.names=FALSE)

####################################################################################################
##### END OF FILE.
####################################################################################################