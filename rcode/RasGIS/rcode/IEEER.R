
install.packages("devtools")

library(devtools)

install_github("ropensci/IEEER")

library(IEEER)

z <- IEEE_search(query = list(au="Rabiner, L"), limit=20)
nrow(z)
z[,c("authors", "title")]

z1 <- IEEE_search(query = list(title="geocoding"), limit=20)
