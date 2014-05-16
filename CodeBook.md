## Read raw data

* Read data from X_test.txt and X_train.txt file as data frame
* Read all the supporting files subject_test.txt, subject_train.txt, y_test.txt, y_train.txt and features.txt as data frame


## Parse the data

* Add Subject id and Activity name colunm in test and train data frame 
* Activity id is convert in Activity name from a function using pplay 
* Merge new test and train data frame using rbind

## Analyse the data

* Calculate the mean and standard deviation for each measurement using sapply on merged data frame.
* Use melt and dcast function to reshape the data to independent tidy data set with the average of each variable for each activity and each subject.
* Write the tidy data frame into tidy.txt file with tab delimiter
