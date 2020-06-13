# If you want to access a single column in the dataframe use $ after the dataframe
# The disaster was famous for saving "women and children first", 
# so let's take a look at the Sex

summary(train$Sex)

# let's expand the proportion table command to do a two-way comparison 
# on the number of males and females that survived

prop.table(table(train$Sex, train$Survived))

prop.table(table(train$Sex, train$Survived),1)

prop.table(table(train$Sex, train$Survived),1) * 100

# Visual representation of passengers in train dataset

barplot(table(train$Sex), xlab="Passenger", ylab="People", main="Train Data Passenger")

# What we want to see is the row-wise proportion, as separate groups,
# We need to use command to give us proportions 
# in the 1st dimension which stands for the rows

prop.table(table(train$Sex, train$Survived),1)

# Considering all male died in test dataset, let's make second prediction
# We then alter that same column with 1's for the subset of passengers
# where the variable "Sex" is equal to "female"

test$Survived <- 0
test$Survived[test$Sex == 'female'] <- 1

# We need to submit a csv file with the PassengerId and Survived predictions to Kaggle
# write.csv fuction writes the prediction dataframe out to a CSV file, excluding the row numbers

prediction2 <- data.frame(PassengerId = test$PassengerId, Survived = test$Survived)
write.csv(prediction2, file = "2ndprediction.csv", row.names = FALSE)
