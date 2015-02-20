library(e1071)
# Can handle both categorical and numeric input, 
# but output must be categorical

?naiveBayes

model <- naiveBayes(Species~., data=iristrain)
prediction <- predict(model, iristest[,-5])
table(prediction, iristest[,5])
