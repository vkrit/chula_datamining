install.packages("randomForest")
library(randomForest)

?randomForest
# Train 500 trees, random selected attributes
model  <- randomForest(Species~., data=trainData, nTree=500)

prediction <- predict(model, newdata=testData, type='class')

table(prediction, testData$Species)
