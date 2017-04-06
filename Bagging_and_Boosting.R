library(randomForest)

model<- randomForest(Species~., data=trainData, nTree=500)
summary(model)
prediction <- predict(model, newdata=testData, type='class')
table(prediction, testData$Species)
importance(model)

library(adabag)
iris.adaboost <- boosting(Species~., data=iristrain, boost=TRUE, mfinal=5)
iris.adaboost


?boosting
