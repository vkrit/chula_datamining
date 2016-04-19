library(randomforest)

# Train 500 trees, random selected attributes
model  <- randomForest(Species~., data=traindata, nTree=500)

prediction <- predict(model, newdata=testdata, type=‘class')

table(prediction, testdata$Species)