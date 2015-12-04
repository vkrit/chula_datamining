Needed <- c("tm", "SnowballCC", "RColorBrewer", "ggplot2", "wordcloud", "biclust", "cluster", "igraph", "fpc")   

install.packages(Needed, dependencies=TRUE)  
install.packages("Rcampdf", repos = "http://datacube.wu.ac.at/", type = "source")    

# Load Text file
cname <- file.path("~", "Downloads", "text")   
cname  

dir(cname)

library(tm)   
docs <- Corpus(DirSource(cname))   

summary(docs)  
docs
# Remove Punctuation
docs <- tm_map(docs, removePunctuation)  

for(j in seq(docs))   
{   
    docs[[j]] <- gsub("/", " ", docs[[j]])   
    docs[[j]] <- gsub("@", " ", docs[[j]])   
    docs[[j]] <- gsub("\\|", " ", docs[[j]])   
}   
#remove Number
docs <- tm_map(docs, removeNumbers)

docs <- tm_map(docs, tolower)

# remove stop words
docs <- tm_map(docs, removeWords, stopwords("english"))

# remove ing s, es
library(SnowballC)   
docs <- tm_map(docs, stemDocument)

docs <- tm_map(docs, stripWhitespace) 
# tells R to treat your preprocessed documents as text documents.
docs <- tm_map(docs, PlainTextDocument)  

# Create Document Term Matrix
dtm <- DocumentTermMatrix(docs)   
dtm 

# Crate Term Document Matrix
tdm <- TermDocumentMatrix(docs)   
tdm 

# Explore Data
freq <- colSums(as.matrix(dtm))   
length(freq) 
ord <- order(freq)

#  Start by removing sparse terms:   
dtms <- removeSparseTerms(dtm, 0.1) # This makes a matrix that is 10% empty space, maximum.   
inspect(dtms) 

freq[head(ord)]   
freq[tail(ord)]  

head(table(freq), 20) 

# we can view a table of the terms we selected when we removed sparse terms
freq <- colSums(as.matrix(dtms)) 
freq <- sort(colSums(as.matrix(dtm)), decreasing=TRUE)
head(freq, 14) 

findFreqTerms(dtm, lowfreq=500)

wf <- data.frame(word=names(freq), freq=freq)   
head(wf)

library(ggplot2)   
p <- ggplot(subset(wf, freq>500), aes(word, freq))    
p <- p + geom_bar(stat="identity")   
p <- p + theme(axis.text.x=element_text(angle=45, hjust=1))   
p   

#findAssocs(dtm, c("movie" , "restaurant"), corlimit=0.98)

library(wordcloud)
set.seed(142)   
wordcloud(names(freq), freq, min.freq=100)

# add some color
set.seed(142)   
wordcloud(names(freq), freq, min.freq=500, scale=c(5, .1), colors=brewer.pal(6, "Dark2")) 


dtmss <- removeSparseTerms(dtm, 0.15) # This makes a matrix that is only 15% empty space, maximum.   
inspect(dtmss)

# Hierarchical Clustering
#library(cluster)   
#d <- dist(t(dtmss), method="euclidian")   
#fit <- hclust(d=d, method="ward.D2")   
#fit   
#plot.new()
#plot(fit, hang=-1)
#groups <- cutree(fit, k=5)   # "k=" defines the number of clusters you are using   
#rect.hclust(fit, k=5, border="red") # draw dendogram with red borders around the 5 clusters     

# KMean Clustering
#library(fpc)   
#d <- dist(t(dtmss), method="euclidian")  
#d
#kfit <- kmeans(d, 2)   
#clusplot(as.matrix(d), kfit$cluster, color=T, shade=T, labels=2, lines=0)   
