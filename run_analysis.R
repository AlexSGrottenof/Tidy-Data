run_analysis <- function() {
  ##Read 8 text files into 8 R oobjects
train_act<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
train_subj<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
train_values<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
test_values<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
test_act<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
test_subj<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
activity_labels<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
measurement_labels<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")
  ##Combine the 3 Train files into one containing the Subject ids, Activity codes
  ##and the Measurments
Bind_train_set<-cbind(train_subj, train_act, train_values)
  ##Combine the 3 Test files into one containing the Subject ids, Activity codes
  ##and the Measurments
Bind_test_set<-cbind(test_subj, test_act, test_values)
  ##Combine the Train and Test subsets into one longer dataset
Combo_train_test<-rbind(Bind_train_set, Bind_test_set)
    ##Apply the descriptive labels from the remainding two files
    ##to the Activities and Measurements
label_vector<-as.character(measurement_labels[,2])
names(Combo_train_test)<-c("Subject", "Act_Code",label_vector)
names(activity_labels)<-c("Act_Code", "Activity")
Complete_set<-merge(activity_labels, Combo_train_test)
  ##Select only the variables of interest
i <- grep(pattern="-std()",x=names(Complete_set), fixed=TRUE)
j <- grep(pattern="-mean()",x=names(Complete_set), fixed=TRUE)
k<-c(i,j)
chosen<-sort(k)
Trimmed_Dataset<-Complete_set[,c(2,3,chosen)]
    ## Create the Tidy summary dataset group by Subject and Activity
Avg_Trim<-aggregate(x=Trimmed_Dataset[,3:68],by=Trimmed_Dataset[,1:2],mean)
Avg_Trim<-Avg_Trim[,c(2,1,3:68)]
  ##Export the Tidy dataset into a text file and provide an example code
  ## to read the txt file back into R
write.table(Avg_Trim, file="TidyData.txt", row.names=FALSE)
##test<-read.table("TidyData.txt", header=TRUE)
}