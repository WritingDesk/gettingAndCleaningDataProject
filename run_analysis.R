
################################################################
##     #######   Section 1 reads in the data from the UCI HAR 
##  1  #######   data set assuming that the UCI HAR data file 
##     #######   is in the working directory.
##     #######   The files can be obtained here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
##############################################################


## These will be used be both of the data sets, test and train.
variable.names <- read.table("UCI HAR Dataset/features.txt")
activity.labels <- read.table("UCI HAR Dataset/activity_labels.txt")

#############Input and creation of TESTING data.frame#####
test.data <- read.table("UCI HAR Dataset/test/X_test.txt")
subject.test <- read.table("UCI HAR Dataset/test/subject_test.txt")
activity.test <- read.table("UCI HAR Dataset/test/y_test.txt")

test.data <- cbind(subject.test, activity.test, test.data)


## rename 
## 1) rename first col which has id numbers of subjects
## 2) rename 2nd col which codes the activity that was performed
## 3) rename the rest of the col based on the variable names 
##    provided in the feautres.txt file 
names(test.data)[1] <- "id.number.of.subject.being.measured"
names(test.data)[2] <- 
  "activity.done.by.subject.during.measurement"
names(test.data)[3:ncol(test.data)] <- t(variable.names[2])

# Inserting a col to indicate if the record is from the testing
# data set, or the training data set.
test.data <- cbind("data.source"="testing", test.data)

#############Input and creation of TRAINING data.frame#####

training.data <- read.table("UCI HAR Dataset/train/X_train.txt")
subject.training <- read.table("UCI HAR Dataset/train/subject_train.txt")
activity.training <- read.table("UCI HAR Dataset/train/y_train.txt")

training.data <- cbind(subject.training, activity.training,
                       training.data)


## rename 
## 1) rename first col which has id numbers of subjects
## 2) rename 2nd col which codes the activity that was performed
## 3) rename the rest of the col based on the variable names 
##    provided in the feautres.txt file 
names(training.data)[1] <- "id.number.of.subject.being.measured"
names(training.data)[2] <- 
  "activity.done.by.subject.during.measurement"
names(training.data)[3:ncol(training.data)] <- t(variable.names[2])

# Inserting a col to indicate if the record is from the testing
# data set, or the training data set.
training.data <- cbind("data.source"="training", training.data)

##########---Merge training data and testing data-----##########

full.data <- rbind(training.data, test.data)

################################################################
##     #######   Extracts only the measurements on the mean and 
##  2  #######   standard deviation for each measurement. 
##     #######
##############################################################

## this regular expression allows for the variables that are means
## and standard deviations to be selected. The "meanfreq" expression is needed to
## ensure that the average frequency data is also collected.
## Angular data that includes a mean value as one of the vectors
## have been excluded on purpose, because the reported angular values
## are not means.
measured.variables.to.include <- 
  as.character(variable.names[grep("mean\\(|std\\(|meanfreq",
                                  t(variable.names[2]), 
                                  ignore.case=TRUE)
                              , 2]
               )

### reduce data frame to include only those column variables that 
### are means or stdev of measurements taken during the measurement
### window.

full.data.means.stdev <- 
  full.data[,c("data.source",
               "id.number.of.subject.being.measured",
               "activity.done.by.subject.during.measurement",
                measured.variables.to.include)
            ]


################################################################
##     ####   In this seciton, the numerical representation of
##  3  ####   the activity performed during the measurement
##     ####   is replaced by a meaningful name for all 6 activities
################################################################

full.data.means.stdev[,3] <-
  as.data.frame(sub("1", "walking.during.measurement",
                    as.character(full.data.means.stdev[,3])
                    )
                )

full.data.means.stdev[,3] <-
  as.data.frame(sub("2", "walking.upstairs.during.measurement",
                    as.character(full.data.means.stdev[,3])
                    )
                )

full.data.means.stdev[,3] <-
  as.data.frame(sub("3", "walking.downstairs.during.measurement",
                    as.character(full.data.means.stdev[,3])
                    )
                )

full.data.means.stdev[,3] <-
  as.data.frame(sub("4", "sitting.during.measurement",
                    as.character(full.data.means.stdev[,3])
                    )
                )

full.data.means.stdev[,3] <-
  as.data.frame(sub("5", "standing.during.measurement",
                    as.character(full.data.means.stdev[,3])
                    )
                )

full.data.means.stdev[,3] <-
  as.data.frame(sub("6", "laying.during.measurement",
                    as.character(full.data.means.stdev[,3])
                    )
                )

################################################################
##     ####   In this section, the variable names originally
##  4  ####   given in features.txt, are replaced with variable
##     ####   names that match this R style guide from Google:
##     ####   https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml#identifiers
################################################################


measured.variables.to.include <- 
  sub("^t", "time.domain.", measured.variables.to.include)

measured.variables.to.include <-
  sub("Acc", "acceleration.", measured.variables.to.include)

measured.variables.to.include <-
  sub("BodyBody", "body.", measured.variables.to.include)

measured.variables.to.include <-
  sub("Body", "body.", measured.variables.to.include)

measured.variables.to.include <-
  sub("-X", ".x", measured.variables.to.include)

measured.variables.to.include <-
  sub("-Y", ".y", measured.variables.to.include)

measured.variables.to.include <-
  sub("-Z", ".z", measured.variables.to.include)

measured.variables.to.include <-
  sub("-", "", measured.variables.to.include)

measured.variables.to.include <-
  sub("\\(\\)", "", measured.variables.to.include)

measured.variables.to.include <-
  sub("Jerk", "jerk.", measured.variables.to.include)

measured.variables.to.include <-
  sub("Mag", "mag.", measured.variables.to.include)

measured.variables.to.include <-
  sub("Gyro", "gyro.", measured.variables.to.include)

measured.variables.to.include <-
  sub("Freq", ".freq", measured.variables.to.include)

measured.variables.to.include <-
  sub("^f", "frequency.domain.", measured.variables.to.include)

measured.variables.to.include <-
  sub("G", "g", measured.variables.to.include)

## once the measured.variable.to.include list has all of the correct names
## it can be used to rename the cols in the full data frame that
## includes only measures of means and stdevs.

names(full.data.means.stdev)[4:ncol(full.data.means.stdev)] <-
  measured.variables.to.include

################################################################
##     ####   In this section, the values from the full data table
##  5  ####   are averaged across groups. The groups are by subject
##     ####   id, and subject activity type. Finally, a file is written
##     ####   the contains these averages in a tidy data file.
################################################################
## the following packages will be installed when running this script.
install.packages("data.table")
library(data.table)

## convert the data frame to a data table to make grouping easier.
dt.full <- data.table(full.data.means.stdev)

##calculate the mean for all variables, grouping by activity
measured.variable.means.by.activity <-
  dt.full[, lapply(.SD,mean), 
          by=activity.done.by.subject.during.measurement]
##calculate the mean for all variables, grouping by subject id
measured.variable.means.by.id <-
  dt.full[, lapply(.SD,mean), by=id.number.of.subject.being.measured]

##merge the data.tables together
measured.variable.means.by.id.and.activity <-
  cbind(t(measured.variable.means.by.id), 
        t(measured.variable.means.by.activity))
##convert back to data table
measured.variable.means.by.id.and.activity <-
  (data.table(measured.variable.means.by.id.and.activity))
##select the set of means for the numerical variables, and exclude,
## means that don't make sense, e.g. mean of activity of subject.
measured.variable.means.by.id.and.activity <-
  (t(measured.variable.means.by.id.and.activity)[,4:82])

measured.variable.means.by.id.and.activity <-
  data.table(t(measured.variable.means.by.id.and.activity))

## create new tidy variable names for the new data
setnames(measured.variable.means.by.id.and.activity, 
         c("mean.of.variables.for.id.1", 
           "mean.of.variables.for.id.3", 
           "mean.of.variables.for.id.5", 
           "mean.of.variables.for.id.6", 
           "mean.of.variables.for.id.7", 
           "mean.of.variables.for.id.8", 
           "mean.of.variables.for.id.11", 
           "mean.of.variables.for.id.14",
           "mean.of.variables.for.id.15", 
           "mean.of.variables.for.id.16", 
           "mean.of.variables.for.id.17", 
           "mean.of.variables.for.id.19", 
           "mean.of.variables.for.id.21", 
           "mean.of.variables.for.id.22", 
           "mean.of.variables.for.id.23", 
           "mean.of.variables.for.id.25", 
           "mean.of.variables.for.id.26", 
           "mean.of.variables.for.id.27", 
           "mean.of.variables.for.id.28", 
           "mean.of.variables.for.id.29", 
           "mean.of.variables.for.id.30", 
           "mean.of.variables.for.id.2", 
           "mean.of.variables.for.id.4", 
           "mean.of.variables.for.id.9", 
           "mean.of.variables.for.id.10", 
           "mean.of.variables.for.id.12", 
           "mean.of.variables.for.id.13", 
           "mean.of.variables.for.id.18", 
           "mean.of.variables.for.id.20", 
           "mean.of.variables.for.id.24", 
           "mean.of.variables.for.standing.during.measurement.group", 
           "mean.of.variables.for.sitting.during.measurement.group", 
           "mean.of.variables.for.laying.during.measurement.group", 
           "mean.of.variables.for.walking.during.measurement.group", 
           "mean.of.variables.for.walking.downstairs.during.measurement.group", 
           "mean.of.variables.for.walking.upstairs.during.measurement.group"))
## add in a col so that we know which variable is being averaged for each group.
measured.variable.means.by.id.and.activity <- 
  cbind("variables.measured" = measured.variables.to.include, 
        measured.variable.means.by.id.and.activity)
##write a file that saves the output as a tidy data file.
write.table(measured.variable.means.by.id.and.activity, 
            file="meansForEachVariable_GroupedByIdAndActivity.txt",
            row.name=FALSE)

## END FILE########