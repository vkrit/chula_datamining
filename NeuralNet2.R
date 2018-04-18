library(nnet)
library(NeuralNetTools)

# Create Neural Network Model
nn <- nnet(Species~., data=trainData, size=3, maxit=500)
  
# summarize the fit
summary(nn)
library(devtools)
source_url('https://goo.gl/qB3rHg')

plot.nnet(nn, pid=F)
