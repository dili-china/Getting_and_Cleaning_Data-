Getting_and_Cleaning_Data-
==========================

Week 3

Run_analysis.R

1. read features.txt

2. read X_test.txt, y_test.txt, subject_test.txt and combine them into one data: testfull

3. read X_train.txt, y_train.txt, subject_train.txt and combine them into one data: trainfull

4. combine testfull and trainfull into datafull, use names from features.txt as column names

5. extract Subject and Activity columns from datafull into ex1, extract columns which names contain "mean() or std into ex2, then combine ex1 and ex2 into one data set: exdata

6. read activity_labels.txt. Replace the numbers in exdata "Activity" column with the discriptive labels. 

7. write this tidy data set into a file: newdata.txt

8. melt and decast exdata, calculate the mean of each variable for each subject and each activity.

9. write the second data set into file: tidydata.txt
