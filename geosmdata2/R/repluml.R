
repluml <- function(x){
  x <- gsub("ö","Ã¶",x)
  x <- gsub("ä","Ã¤",x)
  x <- gsub("ü","Ã¼",x)
  x <- gsub("ß","ÃŸ",x)
  return(x)
}
