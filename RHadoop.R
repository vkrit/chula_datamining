<<<<<<< HEAD
setwd("~/dev/R/Chula/Intro to R/github/")
# Hadoop with R
# Install neccessary packages
#install.packages( c('rJava','RJSONIO', 'itertools', 'digest',
#                    'Rcpp','httr','functional','devtools', 'plyr','reshape2'))


Sys.setenv("HADOOP_CMD"="/usr/local/Cellar/hadoop/2.7.3/bin/hadoop")
Sys.setenv("HADOOP_STREAMING"="/usr/local/Cellar/hadoop/2.7.3/libexec/share/hadoop/tools/lib/hadoop-streaming-2.7.3.jar")
Sys.getenv("HADOOP_CMD")
Sys.setenv("HADOOP_HOME"="/usr/local/Cellar/hadoop/2.7.3")
Sys.setenv("RSCRIPT"="/usr/local/bin/Rscript")

library(rmr2)
library(rhdfs)
gdp <- NA
gdp <- read.csv("~/dev/R/Chula/Intro\ to\ R/github/GDP.csv")
gdp <- gdp[,1:4]
head(gdp)
str(gdp)
gdp$GDP <- as.double(gsub(",","",gdp$GDP))
head(gdp)

hdfs.init()
gdp.values <- to.dfs(gdp)

aaplRevenue = 181890

gdp.map.fn <- function(k,v) {
    key <- ifelse(v[2] < aaplRevenue, "less", "greater")
    keyval(key, 1)
}

count.reduce.fn <- function(k,v) {
    keyval(k, length(v))
}

count <- mapreduce(input=gdp.values, map = gdp.map.fn, reduce = count.reduce.fn)

from.dfs(count)
=======
# Hadoop with R
# Install neccessary packages
install.packages( c('rJava','RJSONIO', 'itertools', 'digest','Rcpp','httr','functional','devtools', 'plyr','reshape2'))


Sys.setenv("HADOOP_CMD"="/usr/local/Cellar/hadoop/2.7.2/bin/hadoop")
Sys.setenv("HADOOP_STREAMING"="/usr/local/Cellar/hadoop/2.7.2/libexec/share/hadoop/tools/lib/hadoop-streaming-2.7.2.jar")
Sys.getenv("HADOOP_CMD")
Sys.setenv("HADOOP_HOME"="/usr/local/Cellar/hadoop/2.7.2")
Sys.setenv("RSCRIPT"="/usr/local/bin/Rscript")

library(rmr2)
library(rhdfs)
gdp <- NA
gdp <- read.csv("~/dev/R/Chula/Intro\ to\ R/github/GDP.csv")
gdp <- gdp[,1:4]
gdp$GDP <- as.double(gsub(",","",gdp$GDP))
head(gdp)

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
>>>>>>> 0dc063d26dd6533029c726c4c7dd851ef93710f5
