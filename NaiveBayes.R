<<<<<<< HEAD
library(e1071)
# Can handle both categorical and numeric input, 
# but output must be categorical

?naiveBayes

model <- naiveBayes(Species~., data=traindata)
prediction <- predict(model, testdata[,-5])
table(prediction, testdata[,5])
confusionMatrix(prediction, testdata$Species)
=======
library(e1071)
# Can handle both categorical and numeric input, 
# but output must be categorical

?naiveBayes

model <- naiveBayes(Species~., data=trainData)
prediction <- predict(model, testData[,-5])
table(prediction, testData[,5])
>>>>>>> 0dc063d26dd6533029c726c4c7dd851ef93710f5
