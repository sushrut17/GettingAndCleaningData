#part 1
we read the training and test set data in train_set and test_set respectively. They are row binded such that test set data is below training set data.
This is the merged_data as required in part 1. We read the features and give the column names to this merged data.

#part 2
The features read are then filtered such that only mean measurements are taken into consideration.
Again, The features read are then filtered such that only standard deviation measurements are taken into consideration.
They are coupled (row binded), and the indices corresponding to them are stored in the 'inidices'.
Based on these indices, only the columns containing mean and standarad deviation measurements are filtered in.

#part 3
We read the training and test label data and row bind them. Then, we convert the type into character. 
Then, we read the activities and their labels.
Then, we match the activity labels by their labels in the data set and column bind then.
The resulting data set contains the measurements and the label of the activity that was being performed when the measurement was made.

#part 4
we read the subject data, and column bind it to the data set obtained in part 3.
The resulting data contains the measurements and the subject on whom the measurement was being made and the activity he was performing

#part 5
we use the 'aggregate' function to find the average of the measurements grouped by the subject and the activity he/she was performing.
This is the final tidy dataset.