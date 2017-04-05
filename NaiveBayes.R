library(e1071)
# Can handle both categorical and numeric input, 
# but output must be categorical

?naiveBayes

model <- naiveBayes(Species~., data=traindata)
prediction <- predict(model, testdata[,-5])
table(prediction, testdata[,5])
confusionMatrix(prediction, testdata$Species)
