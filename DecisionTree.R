<<<<<<< HEAD
install.packages("party")
library(party)

?ctree
head(trainData)
myFormula <- Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width
iris_ctree <- ctree(myFormula, data=trainData)

iris.cf <- cforest(Species ~ ., data = trainData, 
                            control = cforest_unbiased(mtry = 2, ntree = 50))
barplot(sort(varimp(iris.cf), decreasing = TRUE))

# check the prediction
table(predict(iris_ctree), traindata$Species)

print(iris_ctree)

plot(iris_ctree)

plot(iris_ctree, type="simple")

# predict on test data
predict(iris_ctree, newdata = testData)
test.pred <- predict(iris.ctree, newdata = testData)
table(testPred, testData$Species)

print(cf$byClass)

install.packages("caret")
library(caret)
cf <- confusionMatrix(testPred, testData$Species)
?treeresponse
probs <- treeresponse(iris.ctree, newdata=testData)
pred <- do.call(rbind, probs)
summary(pred)

install.packages("ROCR")
library(ROCR)
roc_pred <- predict(iris.ctree, testData$Species)
plot(performance(roc_pred, measure="tpr", x.measure="fpr"), colorize=TRUE)
?predict
=======
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
>>>>>>> 0dc063d26dd6533029c726c4c7dd851ef93710f5
