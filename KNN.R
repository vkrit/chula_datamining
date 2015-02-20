library(class)

?knn

train_input <- as.matrix(iristrain[,-5])
train_output <- as.vector(iristrain[,5])
test_input <- as.matrix(iristest[,-5])
prediction <- knn(train_input, test_input, 
                    train_output, k=5)
table(prediction, iristest$Species)
