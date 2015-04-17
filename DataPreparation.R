# Getting Data
iris <- read.csv("iris.data.csv", header=TRUE)

# Visualization of the Data
head(iris)

table(iris$Species)

# Plot the histogram
hist(iris$Sepal.Length, breaks=10, prob=T)

# Plot the density curve
lines(density(iris$Sepal.Length))

categories <- table(iris$Species)
barplot(categories, col=c('red', 'green', 'blue'))

boxplot(Sepal.Length~Species, data=iris)

# Scatter plot for all pairs
pairs(iris[,c(1,2,3,4)])

# Compute the correlation matrix
cor(iris[,c(1,2,3,4)])

# select 10 records out from iris with replacement
index <- sample(1:nrow(iris), 10, replace=T)
index
irissample <- iris[index,]
irissample

# impute data
# Create some missing data
irissample[10, 1] <- NA
irissample

# load e1071 library
library(e1071)

> fixIris1 <- impute(irissample[,1:4], what='mean')
> fixIris1

fixIris2 <- impute(irissample[,1:4], what='median')
fixIris2

# Scaling 
# scale the columns
# x-mean(x)/standard deviation
scaleiris <- scale(iris[, 1:4])
head(scaleiris)

# add attributes
iris2 <- transform(iris, ratio=round(Sepal.Length/Sepal.Width, 2))
head(iris2)

# Discritize
# Equal width cuts
segments <- 10
maxL <- max(iris$Petal.Length)
minL <- min(iris$Petal.Length)
theBreaks <- seq(minL, maxL, by=(maxL-minL)/segments)
cutPetalLength <- cut(iris$Petal.Length, breaks=theBreaks, include.lowest=T)
newdata <- data.frame(orig.Petal.Len=iris$Petal.Length,  cut.Petal.Len=cutPetalLength)
head(newdata)

# Constant frequency / height
myBreaks <- quantile(iris$Petal.Length, probs=seq(0,1,1/segments))
cutPetalLength2 <- cut(iris$Petal.Length, breaks=myBreaks, include.lowest=T)
newdata2 <- data.frame(orig.Petal.Len=iris$Petal.Length, cut.Petal.Len=cutPetalLength2)
head(newdata2)

# binarize
cat <- levels(iris$Species)
cat

# Prepare iris
set.seed(567)
ind <- sample(2, nrow(iris), replace=TRUE, prob=c(0.7, 0.3))
trainData <- iris[ind==1,]
testData <- iris[ind==2,]


