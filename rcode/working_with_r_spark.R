# Jan-Philipp Kolb
# Working with spark
# Sun Feb 06 09:40:03 2022
# spark_install("2.3")



# load necessary packages -------------------------------------------------



library(sparklyr)
library(DBI)
library(dplyr)

# some example data
library(nycflights13)

# https://therinspark.com/starting.html
# spark_install("2.3")

sc <- spark_connect(master = "local", version = "2.3")
cars <- copy_to(sc, mtcars)

# spark_web(sc)

?spark_apply

cars <- copy_to(sc, mtcars,overwrite=T)


dbGetQuery(sc, "SELECT count(*) FROM mtcars")

# sql and dplyr can be used


# dplyr and join ----------------------------------------------------------

# https://www.guru99.com/r-dplyr-tutorial.html
# https://spark.rstudio.com/reference/join.tbl_spark.html

# inner join with sql
# https://www.w3schools.com/sql/sql_join.asp


# https://spark.rstudio.com/dplyr/

flights <- copy_to(sc, flights, "flights")
airlines <- copy_to(sc, airlines, "airlines")

ab <- flights %>% left_join(airlines, by = "carrier")


# Streaming

dir.create("input")
write.csv(mtcars, "input/cars_1.csv", row.names = F)



# Links -------------------------------------------------------------------


# https://spark.apache.org/docs/latest/sparkr.html#grouping-aggregation


# Scale R to Big Data with Hadoop & Spark
# https://www.youtube.com/watch?v=z4tiH5dKh84&ab_channel=DataScienceDojo
