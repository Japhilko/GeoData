# Jan-Philipp Kolb
# Working with spark
# spark_install("2.3")

library(sparklyr)
library(DBI)
library(dplyr)

# https://therinspark.com/starting.html
# spark_install("2.3")

sc <- spark_connect(master = "local", version = "2.3")
cars <- copy_to(sc, mtcars)


# spark_web(sc)


dbGetQuery(sc, "SELECT count(*) FROM mtcars")



?spark_apply



# Streaming

dir.create("input")
write.csv(mtcars, "input/cars_1.csv", row.names = F)