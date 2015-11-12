library(randomForest)

model<- randomForest(Species~., data=trainData, nTree=500)

prediction <- predict(model, newdata=testData, type='class')
table(prediction, testData$Species)
importance(model)
