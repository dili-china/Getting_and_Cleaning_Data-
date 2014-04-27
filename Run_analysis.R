library(reshape2)
            
                 
feature <- read.csv(".//UCI HAR Dataset//features.txt", header = F, sep = "")  


test <- read.csv(".//UCI HAR Dataset//test//X_test.txt", header = F, sep = "" )
testLabel <- read.csv(".//UCI HAR Dataset//test//y_test.txt", header = F)
testSubject <- read.csv(".//UCI HAR Dataset//test//subject_test.txt", header = F)

testfull <- cbind(testSubject, testLabel, test)


train <- read.csv(".//UCI HAR Dataset//train//X_train.txt", header = F, sep = "")
trainLabel <- read.csv(".//UCI HAR Dataset//train//y_train.txt", header = F)
trainSubject <- read.csv(".//UCI HAR Dataset//train//subject_train.txt", header = F)

trainfull <- cbind(trainSubject, trainLabel, train)


datafull <- rbind.data.frame(testfull, trainfull)
colnames(datafull) <- c("Subject", "Activity", as.character(feature$V2))


ex1 <- datafull[,1:2]
ex2<- datafull[, grepl("mean\\(\\)", colnames(datafull)) | grepl("std", colnames(datafull))]


ActivityLabels <- read.csv(".//UCI HAR Dataset//activity_labels.txt", header = F, sep = "")
exdata$Activity <- factor(exdata$Activity, labels = ActivityLabels$V2)

write.table(exdata, file="./newdata.txt", sep="\t")


meltdata<- melt(exdata, id=c("Subject", "Activity"), measure.vars = colnames(exdata)[3:ncol(exdata)])
tidydata <- dcast(meltdata, interaction(Subject, Activity) ~ variable, mean)

write.table(tidydata, file="./tidydata.txt", sep="\t")
