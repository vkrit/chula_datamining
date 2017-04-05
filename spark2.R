library(MASS)
library(SparkR, lib.loc = c(file.path(Sys.getenv("SPARK_HOME"), "R", "lib")))

sparkR.session(master = "local[*]", sparkConfig = list(spark.driver.memory = "2g"))
df <- as.DataFrame(Cars93)
head(df)

survey <- read.df("./Downloads/R-Programming/slides/github/survey_data.csv", "csv", header = "true", inferSchema = "true", na.strings = "NA")
head(survey)

head(summarize(groupBy(df, df$Make), count = n(df$Make)))

install.packages("sparklyr")
library(sparklyr)
spark_available_versions()
spark_install(version = "2.0.1")
sc <- spark_connect(master = "local")
