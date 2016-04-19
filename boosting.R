library(adabag)


iris.adaboost <- boosting(Species~., data=traindata, boost=TRUE, mfinal=5)
iris.adaboost