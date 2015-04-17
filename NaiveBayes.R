library(e1071)
# Can handle both categorical and numeric input, 
# but output must be categorical

?naiveBayes

model <- naiveBayes(Species~., data=trainData)
prediction <- predict(model, testData[,-5])
table(prediction, testData[,5])
