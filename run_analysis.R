########## Getting project data and unzipping it ##########
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/projData.zip")
unzip(zipfile="./data/projData.zip",exdir="./data")
projDataPath <- "./data/UCI HAR Dataset"


# STEP 1
########## Reading data files into R objects ##########
trainActivity <- read.table(paste(projDataPath,"/train/y_train.txt", sep = ''),header = FALSE)
trainSubject <- read.table(paste(projDataPath,"/train/subject_train.txt", sep = ''),header = FALSE)
trainFeatures <- read.table(paste(projDataPath,"/train/X_train.txt", sep = ''),header = FALSE)

testActivity <- read.table(paste(projDataPath,"/test/y_test.txt", sep = ''),header = FALSE)
testSubject <- read.table(paste(projDataPath,"/test/subject_test.txt", sep = ''),header = FALSE)
testFeatures <- read.table(paste(projDataPath,"/test/X_test.txt", sep = ''),header = FALSE)

# Combining all training data into one dataframe
trainData <- cbind(trainActivity, trainSubject)
trainData <- cbind(trainData, trainFeatures)

# Combining all test data into one dataframe
testData <- cbind(testActivity, testSubject)
testData <- cbind(testData, testFeatures)

# Merging training data and test data into one dataframe
data <- rbind(trainData, testData) 


# STEP 2
########## Extracting only the measurements on the mean and standard deviation for each measurement ##########
features <- read.table(paste(projDataPath,"/features.txt", sep = ''),header = FALSE)
featuresNeeded <- grep("-(mean|std)\\(\\)", features[, 2])

# since in the data dataframe the first column is activity and the second column is subject, we increase all the values of featuresNeeded by 2. 
columnsNeeded <- c(1, 2, featuresNeeded + 2)
data <- data[columnsNeeded]


# STEP 3
########## Using descriptive activity names to name the activities in the data set ##########
activityLabels <- read.table(paste(projDataPath,"/activity_labels.txt", sep = ''),header = FALSE)
data[, 1] <- activityLabels[data[, 1], 2]


# STEP 4
########## Appropriately labels the data set with descriptive variable names ##########
names(data) <- c("activity", "subject", as.character(features[featuresNeeded,2]))


# STEP 5
########## Createing the second independent tidy data set from STEP 4 with the average of each variable for each activity and each subject ##########
library(plyr)
data_second <- ddply(data, .(activity, subject), function(x) colMeans(data[,3:68]))
write.table(data_second, file = "second_tidydata.txt", row.name=FALSE)
