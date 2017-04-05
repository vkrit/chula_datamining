install.packages("adabag")
library(adabag)

iris.adaboost <- boosting(Species~., data=traindata, boost=TRUE, mfinal=5)
iris.adaboost
iris.adaboost$class
table(iris.adaboost$class, traindata$Species)
prediction <- predict(iris.adaboost, newdata=testdata)
table(prediction$class, testdata$Species)
confusionMatrix(prediction$class, testdata$Species)
