
repluml <- function(x){
  x <- gsub("Ã¶","ö",x)
  x <- gsub("Ã¤","ä",x)
  return(x)
}
