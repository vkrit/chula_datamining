library(class)

?knn

train_input <- as.matrix(traindata[,-5])
train_output <- as.vector(traindata[,5])
test_input <- as.matrix(testdata[,-5])
prediction <- knn(train_input, test_input, 
                    train_output, k=5)
table(prediction, testdata$Species)
confusionMatrix(prediction, testdata$Species)
