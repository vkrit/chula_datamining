install.packages("ggmap")
library(ggmap)
geocode("Bangkok")
qmap("69/46 Lum Luk Ka Road, Lum Luk Ka, Pathum Thani, 12150, Thailand", zoom=15)

set.seed(100) 
df <- round(data.frame( x = jitter(rep(100.5018, 20), 
                                   amount = .3), 
                        y = jitter(rep( 13.75633, 20), 
                                   amount = .3) ), digits = 2) 
map <- get_googlemap("Bangkok", markers = df, path = df, scale = 2) 
ggmap(map, extent = 'device')
