install.packages('seriation')
install.packages('arules')
install.packages('arulesViz')
install.packages('iplots')

# Load the libraries
library(arules)
library(arulesViz)
library(datasets)
library(iplots)

# Load the data set
data(Groceries)
# Create an item frequency plot for the top 20 items
itemFrequencyPlot(Groceries,topN=20,type="absolute")
# Get the rules
?apriori
rules <- apriori(Groceries, parameter = list(supp = 0.001, conf = 0.8))

# Show the top 5 rules, but only 2 digits
options(digits=2)
inspect(rules[1:5])
summary(rules)

inspect(head(sort(rules, by="lift"),10));

plot(rules);
plot(rules, method="grouped")

#sort rules
rules<-sort(rules, by="confidence", decreasing=TRUE)
inspect(rules[1:5])
<<<<<<< HEAD
?is.subset
=======

>>>>>>> 0dc063d26dd6533029c726c4c7dd851ef93710f5
# Rules pruned
subset.matrix <- is.subset(rules, rules)
subset.matrix[lower.tri(subset.matrix, diag=T)] <- NA
redundant <- colSums(subset.matrix, na.rm=T) >= 1
rules.pruned <- rules[!redundant]
rules<-rules.pruned
summary(rules)
plot(rules)

# change to have maximum of 3
rules <- apriori(Groceries, parameter = list(supp = 0.001, conf = 0.8,maxlen=3))
inspect(rules[1:5])
summary(rules)
?plot
plot(rules, method="graph")
plot(rules, method="paracoord")


# What are customers likely to buy after buying whole milk?
rules<-apriori(data=Groceries, parameter=list(supp=0.001,conf = 0.08), 
               appearance = list(default="lhs",rhs="whole milk"),
               control = list(verbose=F))
rules<-sort(rules, decreasing=TRUE,by="confidence")
inspect(rules[1:5])

# whole milk and its antecedent
rules<-apriori(data=Groceries, parameter=list(supp=0.001,conf = 0.15,minlen=2), 
               appearance = list(default="rhs",lhs="whole milk"),
               control = list(verbose=F))
rules<-sort(rules, decreasing=TRUE,by="confidence")
inspect(rules[1:5])

# Graph
library(arulesViz)
plot(rules)
plot(rules,method="graph",interactive=TRUE,shading=NA)
