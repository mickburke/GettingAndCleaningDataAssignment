library(dplyr)
library(readr)

#Merge the training and the test sets to create one data set.
featuresFile <- "UCI HAR Dataset\\features.txt"
testSetReadingsFile <- "UCI HAR Dataset\\test\\X_test.txt"
testSetActivitiesFile <- "UCI HAR Dataset\\test\\Y_test.txt"
testSetSubjectsFile <- "UCI HAR Dataset\\test\\subject_test.txt"
trainingSetReadingsFile <- "UCI HAR Dataset\\train\\X_train.txt"
trainingSetActivitiesFile <- "UCI HAR Dataset\\train\\Y_train.txt"
trainingSetSubjectsFile <- "UCI HAR Dataset\\train\\subject_train.txt"
activityLabelsFile <- "UCI HAR Dataset\\activity_labels.txt"

features <- read_table2(featuresFile, 
                        col_names = c("index", "name"),
                        col_types = cols(col_number(), col_character()))
features = features[,2]

testSetReadings <- read_table2(testSetReadingsFile, col_names = FALSE)
testSetSubjects <- read_table2(testSetSubjectsFile, col_names = FALSE)
testSetActivities <- read_table2(testSetActivitiesFile, col_names = FALSE)

trainingSetReadings <- read_table2(trainingSetReadingsFile, col_names = FALSE)
trainingSetSubjects <- read_table2(trainingSetSubjectsFile, col_names = FALSE)
trainingSetActivities <- read_table2(trainingSetActivitiesFile, col_names = FALSE)

activityLabels <- read_table2(activityLabelsFile, col_names = FALSE)

readings <- bind_rows(testSetReadings, trainingSetReadings)
subjects <- bind_rows(testSetSubjects, trainingSetSubjects)
activities <- bind_rows(testSetActivities, trainingSetActivities)
data <- bind_cols(subjects, activities, readings)

colnames(data) <- c("SubjectId", "Activity", features$name)

#Extract only the measurements on the mean and standard deviation for each measurement.
pattern <- "SubjectId|Activity|std()|mean()"
meanStdData <- subset(data, select = grep(pattern, names(data)))

#Use descriptive activity names to name the activities in the data set
meanStdData <- 
  meanStdData %>% mutate(Activity = factor(recode(Activity,
                                                  "1" = "WALKING", 
                                                  "2" = "WALKING_UPSTAIRS", 
                                                  "3" = "WALKING_DOWNSTAIRS", 
                                                  "4" = "SITTING", 
                                                  "5" = "STANDING", 
                                                  "6" = "LAYING")))

#Appropriately label the data set with descriptive variable names.
names <- names(meanStdData)
names <- gsub("[(][)]", "", names)
names <- gsub("-", "_", names)
names <- gsub("^t", "Time_", names)
names <- gsub("^f", "Frequency_", names)
names <- gsub("Acc", "_Accelerometer", names)
names <- gsub("Gyro", "_Gyroscope", names)
names <- gsub("Mag", "_Magnitude", names)
names <- gsub("Jerk", "_Jerk", names)
names <- gsub("_mean", "_Mean", names)
names <- gsub("_MeanFreq", "_MeanFrequency", names)
names <- gsub("_std", "_StandardDeviation", names)
names <- gsub("_X$", "_X_axis", names)
names <- gsub("_Y$", "_Y_axis", names)
names <- gsub("_Z$", "_Z_axis", names)
names <- gsub("BodyBody", "Body", names)
names(meanStdData) <- names

#From this data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject.
tidySubjectActivityMeans <- melt(meanStdData, id = c("SubjectId", "Activity"))
tidySubjectActivityMeans <- dcast(tidySubjectActivityMeans, SubjectId + Activity ~ variable, mean)
write.table(tidySubjectActivityMeans, "tidy.txt", row.names=FALSE)