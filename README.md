GetData-Ass1
============
The script run_analysis.R executes the following steps :

* reads in the train and test data
* combines the two data sets into one
* reads the features and labels for the dataset
* gives the column names meaningful values
* subsets only the columns that have the strings "mean(" or "std(" in the name
* merges the activity column with the actual names of the activities
* uses the agregate function to produce a summary of the means of all the columns
* writes the output to a file called tidy.txt
