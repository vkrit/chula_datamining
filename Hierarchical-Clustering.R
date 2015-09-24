set.seed(101)
?sampl
sampleiris <- iris[sample(1:150, 40),] # get samples from iris dataset
# each observation has 4 variables, ie, they are interpreted as 4-D points
distance   <- dist(sampleiris[,-5], method="euclidean") 
cluster    <- hclust(distance, method="average")
plot(cluster, hang=-1, label=sampleiris$Species)

?par

par(mfrow=c(1,2))
group.3 <- cutree(cluster, k = 3)  # prune the tree by 3 clusters
table(group.3, sampleiris$Species) # compare with known classes

plot(sampleiris[,c(1,2)], col=group.3, pch=19, cex=2.5, main="3 clusters")
points(sampleiris[,c(1,2)], col=group.3, pch=19, cex=1)
plot(sampleiris[,c(1,2)], col=sampleiris$Species, pch=19, cex=2.5, main="3 clusters")
points(sampleiris[,c(1,2)], col=sampleiris$Species, pch=19, cex=1)