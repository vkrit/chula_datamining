library(stats)
library(ggplot2)
set.seed(101)
km <- kmeans(iris[,1:4], 3)
plot(iris[,1], iris[,2], col=km$cluster)
points(km$centers[,c(1,2)], col=1:3, pch=19, cex=2)

table(km$cluster, iris$Species)

# Another round:
set.seed(900)
km <- kmeans(iris[,1:4], 3)
plot(iris[,1], iris[,2], col=km$cluster)
points(km$centers[,c(1,2)], col=1:3, pch=19, cex=2)
table(km$cluster, iris$Species)

iris.plot <- ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width, colour = Petal.Length ))
iris.plot + geom_point()
