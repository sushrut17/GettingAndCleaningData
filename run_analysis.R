#part 1
train_set <- read.table("G:/Data Science Specialization/Getting and Cleaning Data/Assignment/UCI HAR Dataset/train/X_train.txt")
test_set <- read.table("G:/Data Science Specialization/Getting and Cleaning Data/Assignment/UCI HAR Dataset/test/X_test.txt")
merged_data <- rbind(train_set, test_set)
features <- read.table("G:/Data Science Specialization/Getting and Cleaning Data/Assignment/UCI HAR Dataset/features.txt", sep = " ")
colnames(merged_data) <- features[,2]

#part 2
features_mean <- features[grep("mean", features[,2]),]
features_std <- features[grep("std", features[,2]),]
features_mean_std <- rbind(features_mean, features_std)
features_mean_std_sorted <- features_mean_std[order(features_mean_std[,1]),]
indices <- features_mean_std_sorted[,1]
merged_data_mean_std <- merged_data[, indices]

#part 3
train_label <- read.table("G:/Data Science Specialization/Getting and Cleaning Data/Assignment/UCI HAR Dataset/train/y_train.txt")
test_label <- read.table("G:/Data Science Specialization/Getting and Cleaning Data/Assignment/UCI HAR Dataset/test/y_test.txt")
label <- rbind(train_label, test_label)
label[,1] <- as.character(label[,1])
activity_labels <- read.table("G:/Data Science Specialization/Getting and Cleaning Data/Assignment/UCI HAR Dataset/activity_labels.txt", sep=" ")
activity_labels[,2] <- as.character(activity_labels[,2])
activity_labels[,1] <- as.character(activity_labels[,1])
activity <- activity_labels[,2][match(label[,1],activity_labels[,1])]
activity <- as.data.frame(activity)
activity_merged_data_mean_std <- cbind(activity, merged_data_mean_std)

#part 4
subject_train <- read.table("G:/Data Science Specialization/Getting and Cleaning Data/Assignment/UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("G:/Data Science Specialization/Getting and Cleaning Data/Assignment/UCI HAR Dataset/test/subject_test.txt")
subject <- rbind(subject_train, subject_test)
subject_activity_merged_data_mean_std <- cbind(subject, activity_merged_data_mean_std)
colnames(subject_activity_merged_data_mean_std)[1] <- "subject"

#part 5
avg_subject_activity <- aggregate(x=subject_activity_merged_data_mean_std[,3:ncol(subject_activity_merged_data_mean_std)], by=list(subject_activity_merged_data_mean_std$subject,subject_activity_merged_data_mean_std$activity),FUN=mean)
colnames(avg_subject_activity)[1] <- "subject"
colnames(avg_subject_activity)[2] <- "activity"