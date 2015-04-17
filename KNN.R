library(class)

?knn

train_input <- as.matrix(trainData[,-5])
train_output <- as.vector(trainData[,5])
test_input <- as.matrix(testData[,-5])
prediction <- knn(train_input, test_input, 
                    train_output, k=5)
table(prediction, testData$Species)
