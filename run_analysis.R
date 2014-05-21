library(reshape2)
#Convert activity code to proper name

Activity_name <- function(y){
    if (y == 1) {
        "WALKING"
    } else if (y == 2) {
        "WALKING_UPSTAIRS"
    } else if (y == 3) {
        "WALKING_DOWNSTAIRS"
    } else if (y == 4) {
        "SITTING"
    } else if (y == 5) {
        "STANDING"
    } else if (y == 6) {
        "LAYING"
    }
}

#Read features
feature <- read.table("features.txt", sep = " ")

#Read test data and create a new data frame by merging Subject and Activity name in test data

Xtest <- read.table("test/X_test.txt")
test_subject <- read.table('test/subject_test.txt')
test_activityID <- read.table("test/y_test.txt")
Xtest[,'subject'] <- test_subject
Xtest[,'activity'] <- apply(test_activityID,1,Activity_name)
colnames(Xtest) <- c(as.vector(feature[,2]),"subject","activity")

#Read train data and create a new data frame by merging Subject and Activity name in train data

Xtrain <- read.table("train/X_train.txt")
train_subject <- read.table('train/subject_train.txt')
train_activityID <- read.table("train/y_train.txt")
Xtrain[,'subject'] <- train_subject
Xtrain[,'activity'] <- apply(train_activityID,1,Activity_name)
colnames(Xtrain) <- c(as.vector(feature[,2]),"subject","activity")

#Merge test and train data

mergeData <- rbind(Xtest,Xtrain)

#Calculate the mean of activities values
data_mean <- sapply(mergeData,mean)
data_sd <- sapply(mergeData,sd)

#Create an independent tidy data set with the average of each variable for each activity 
# and each subject

melted <- melt(mergeData, id.vars = c("subject","activity"))
tidy <- dcast(melted, subject + activity ~ variable,mean)

write.table(tidy, file = "tidy.txt",sep = "\t")

