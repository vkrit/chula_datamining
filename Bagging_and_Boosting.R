download.file(url="http://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/breast-cancer-wisconsin.data", destfile="breast-cancer.data")
breastcancer <- read.csv("breast-cancer.data")

str(breastcancer)
breastcancer$ID = NULL

colnames(breastcancer)[1] <- "ID"
colnames(breastcancer)[2] <- "thickness"
colnames(breastcancer)[3] <- "usize"
colnames(breastcancer)[4] <- "ushape"
colnames(breastcancer)[5] <- "adhesion"
colnames(breastcancer)[6] <- "SECS"
colnames(breastcancer)[7] <- "nuclei"
colnames(breastcancer)[8] <- "chrommatin"
colnames(breastcancer)[9] <- "nucleoli"
colnames(breastcancer)[10] <- "mitoses"
colnames(breastcancer)[11] <- "class"
