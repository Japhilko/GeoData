library(rvest)
flights <- read_html('https://en.wikipedia.org/wiki/Non-stop_flight') %>% 
  html_nodes('.wikitable') %>% 
  .[[1]] %>% 
  html_table(fill = TRUE)

