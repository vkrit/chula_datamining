install.packages("party")
library(party)

?ctree
head(trainData)
myFormula <- Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width
iris_ctree <- ctree(myFormula, data=traindata)

iris.cf <- cforest(Species ~ ., data = trainData, 
                            control = cforest_unbiased(mtry = 2, ntree = 50))
barplot(sort(varimp(iris.cf), decreasing = TRUE))

# check the prediction
table(predict(iris_ctree), trainData$Species)

print(iris_ctree)

plot(iris_ctree)

plot(iris_ctree, type="simple")

# predict on test data
testPred <- predict(iris_ctree, newdata = testdata)
table(testPred, testdata$Species)

install.packages("caret")
library(caret)
confusionMatrix(testPred, testdata$Species)

probs <- treeresponse(iris_ctree, newdata=testdata)
pred <- do.call(rbind, probs)
summary(pred)

install.packages("ROCR")
library(ROCR)
roc_pred <- predict(testPred, testdata$Species)
plot(performance(roc_pred, measure="tpr", x.measure="fpr"), colorize=TRUE)
