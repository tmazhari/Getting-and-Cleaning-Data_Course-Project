# CodeBook

## Variables Definition 
 
* projDataPath: Stores the location of collected data files after they are extracted in working directory

* trainActivity: Stores the activity values corresponding to training data 
* trainSubject: Stores the subject values corresponding to training data
* trainFeatures: Stores the features values corresponding to training data

* testActivity: Stores the features values corresponding to test data
* testSubject: Stores the features values corresponding to test data
* testFeatures: Stores the features values corresponding to test data

* trainData: Stores combined activity, subject and features values of training data
* testData: Stores combined activity, subject and features values of test data

* data: Stores all the collected data which is the combined from all training data and test data. This is the first tidy and clean data from STEP 1 

* features: Stores the names of all 561 feature
* featuresNeeded: Stores the names of those features that only measure mean and standard deviation 
* columnsNeeded: Stores the columns of the data data frame that has been asked in STEP 2. These columns are activity plus subject plus featuresNeeded
* activityLabels: Stores the names of all 6 activities that research has been done on

* data_second: A subset of data dataframe that stores average of each variable for each activity and each subject 


## STEPS Explanation

* STEP 0: If the data folder does not exist in working directory it is created. The research data is downloaded to working directory. Then gets extracted in data folder
* STEP 1: The data which is about training, is stored in three files: "y_tran.txt, subject_train.txt and X_train.txt". All these data is turned into R objects and then combined together using cbind command to constitute training data. The same process is done for test data. Now that we have training data and test data, we combine them to have all collected data in a tidy and clean data frame and we name it data.   
* STEP 2: In this step, The features that have mean or std in their names are identified. Then, these features alongside activity and subject are stored in columnsNeeded variable
* STEP 3: Activity labels are extracted and assigned to the first column of the data data frame  
* STEP 4: Approriate labels are assigned to all column names of the data data frame  
* STEP 5: The second tidy and clean data is subset from the data with the average of each variable for each activity and each subject using the ddply function from plyr package

