install.packages('neuralnet')
    
library(neuralnet)

?neuralnet

iris <- read.csv("iris.data.csv", header=TRUE)
# Prepare iris
set.seed(567)
ind <- sample(2, nrow(iris), replace=TRUE, prob=c(0.7, 0.3))
trainData <- iris[ind==1,]
testData <- iris[ind==2,]

nnet_iristrain <- trainData

#Binarize the categorical output
nnet_iristrain <- cbind(nnet_iristrain, trainData$Species == 'setosa')
nnet_iristrain <- cbind(nnet_iristrain, trainData$Species == 'versicolor')
nnet_iristrain <- cbind(nnet_iristrain, trainData$Species == 'virginica')
names(nnet_iristrain)[6] <- 'setosa'
names(nnet_iristrain)[7] <- 'versicolor'
names(nnet_iristrain)[8] <- 'virginica'

nn <- neuralnet(setosa+versicolor+virginica ~ SepalLength+SepalWidth+PetalLength+PetalWidth, 
                data=nnet_iristrain, hidden=c(3))

plot(nn)
mypredict <- compute(nn, testData[-5])$net.result

# Put multiple binary output to categorical output
maxidx <- function(arr) {
  return(which(arr == max(arr)))
}
idx <- apply(mypredict, c(1), maxidx)
prediction <- c('setosa', 'versicolor', 'virginica')[idx]
table(prediction, testData$Species)
