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
