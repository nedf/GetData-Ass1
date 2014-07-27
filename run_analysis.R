
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt", colClasses="numeric")
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt", colClasses="numeric")
xtest <- read.table("UCI HAR Dataset/test/X_test.txt", colClasses="numeric")
ytest <- read.table("UCI HAR Dataset/test/y_test.txt", colClasses="numeric")
features <- read.table("UCI HAR Dataset/features.txt")
actlabels <- read.table("UCI HAR Dataset/activity_labels.txt")
subtest <- read.table("UCI HAR Dataset/test/subject_test.txt")
subtrain <- read.table("UCI HAR Dataset/train/subject_train.txt")

colnames(xtest) <- features$V2
colnames(xtrain) <- features$V2
colnames(actlabels) <- c("act_id", "activity_label")
colnames(subtest) <- "subject"
colnames(subtrain) <- "subject"

xall <- rbind(xtest, xtrain)
yall <- rbind(ytest, ytrain)
suball <- rbind(subtest, subtrain)
colnames(yall) <- c("activity")

f <- features[grepl("mean\\(", features$V2),]$V2
g <- features[grepl("std\\(", features$V2),]$V2

tidy <- xall[ ,colnames(xall) %in% f]
tidy2 <- xall[ ,colnames(xall) %in% g]

tidy <- cbind(tidy, tidy2, yall, suball)

tidy3 <- merge(x=tidy, y=actlabels, by.x="activity", by.y="act_id")

tidy4 <- tidy3[,1:68]
tidy5 <- aggregate(x=tidy4, by=list(tidy4$subject, tidy4$activity), mean)
write.table(x=tidy5,file="tidy.txt")

tidy5

