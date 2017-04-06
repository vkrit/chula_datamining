# Hadoop with R
# Install neccessary packages
install.packages( c('rJava','RJSONIO', 'itertools', 'digest','Rcpp','httr','functional','devtools', 'plyr','reshape2'))


Sys.setenv("HADOOP_CMD"="/usr/local/Cellar/hadoop/2.7.1/bin/hadoop")
Sys.setenv("HADOOP_STREAMING"="/usr/local/Cellar/hadoop/2.7.1/libexec/share/hadoop/tools/lib/hadoop-streaming-2.7.1.jar")
Sys.getenv("HADOOP_CMD")
Sys.setenv("HADOOP_HOME"="/usr/local/Cellar/hadoop/2.7.1")
Sys.setenv("RSCRIPT"="/usr/local/bin/Rscript")

library(rmr2)
library(rhdfs)
romeojulius <- NA
romeojulius <- read.csv("~/Downloads/6961313.txt")
romeojulius <- gdp[,1:4]
gdp$GDP <- as.double(gsub(",","",gdp$GDP))
head(romeojulius)

hdfs.init()
gdp.values <- to.dfs(gdp)

aaplRevenue = 181890

gdp.map.fn <- function(k,v) {
    key <- ifelse(v[4] < aaplRevenue, "less", "greater")
    keyval(key, 1)
}

count.reduce.fn <- function(k,v) {
    keyval(k, length(v))
}

count <- mapreduce(input=gdp.values, map = gdp.map.fn, reduce = count.reduce.fn)

from.dfs(count)
