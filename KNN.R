<<<<<<< HEAD
library(class)

?knn

train_input <- as.matrix(traindata[,-5])
train_output <- as.vector(traindata[,5])
test_input <- as.matrix(testdata[,-5])
prediction <- knn(train_input, test_input, 
                    train_output, k=5)
table(prediction, testdata$Species)
confusionMatrix(prediction, testdata$Species)
=======
library(class)

?knn

train_input <- as.matrix(trainData[,-5])
train_output <- as.vector(trainData[,5])
test_input <- as.matrix(testData[,-5])
prediction <- knn(train_input, test_input, 
                    train_output, k=5)
table(prediction, testData$Species)
>>>>>>> 0dc063d26dd6533029c726c4c7dd851ef93710f5
