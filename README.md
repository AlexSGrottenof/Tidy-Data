# Tidy-Data
Repo for Coursera Getting and Cleaning Data Course

Type run_analysis() at the R prompt to run the program.
The output will be a text file (TidyData.txt) located in your
current working directory.
Type
test<-read.table("TidyData.txt", header=TRUE)
to read the data into R. Alternatively MS Excel or Notepad++ (not Notepad)
can be used on Windows machines.

##More Details on the Program
*Eight(8) text files are read into 8 R objects (The location of the test files
is relative to the Working Directory)
*The 3 "Train" files containing the Subject ids, Activity codes and the
*Measurements  are comibined into one object (Bind_train_set)
*The 3 "Test" files containing the Subject ids, Activity codes and the
*Measurements  are comibined into one object (Bind_test_set)
*The Train and Test subsets are then combined into one dataset(Combo_train_test)
* Descriptive labels from the remainding two files are  applied to the activities and measurements then saved as Complete_set
*From the Complete_set, the variable containing std() and/or mean() were
selected to make the Trimmed_Dataset
*Finally the Tidy summary dataset is created using grouping by Subject
and Activity
*The Tidy dataset is subsequently exported into text file TidyData.txt

##Compliance Info
*The data set meets the tidy data principles of week 1 (Each variable you measure should be in one column, Each different observation of that variable should be in a different row)
*A Github repo with the required scripts was submitted
*The code book submitted to GitHub described the variable names and other relevant
information
## Note
Descriptive names here means applying to the dataset the labels provided in
the original features.txt and activity_labels.txt files.
