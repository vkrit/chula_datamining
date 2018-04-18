<<<<<<< HEAD
install.packages("randomForest")
library(randomForest)

?randomForest
# Train 500 trees, random selected attributes
model  <- randomForest(Species~., data=traindata, nTree=500)

prediction <- predict(model, newdata=testdata, type='class')

table(prediction, testdata$Species)
confusionMatrix(prediction, testdata$Species)
=======
install.packages("randomForest")
library(randomForest)

?randomForest
# Train 500 trees, random selected attributes
model  <- randomForest(Species~., data=trainData, nTree=500)

prediction <- predict(model, newdata=testData, type='class')

table(prediction, testData$Species)
>>>>>>> 0dc063d26dd6533029c726c4c7dd851ef93710f5
