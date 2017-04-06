library(party)

?ctree

myFormula <- Species ~ SepalLength + SepalWidth + PetalLength + PetalWidth
iris_ctree <- ctree(myFormula, data=trainData)

# check the prediction
table(predict(iris_ctree), trainData$Species)

print(iris_ctree)

plot(iris_ctree)

plot(iris_ctree, type="simple")

# predict on test data
testPred <- predict(iris_ctree, newdata = testData)
table(testPred, testData$Species)
library(caret)
confusionMatrix(pred, test$response)
probs <- treeresponse(model_ctree, newdata=test)
pred <- do.call(rbind, pred)
summary(pred)

library(ROCR)
roc_pred <- prediction(testPred, testData$Species)
plot(performance(roc_pred, measure="tpr", x.measure="fpr"), colorize=TRUE)