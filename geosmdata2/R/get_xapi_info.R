
get_xapi_info <- function(xapi_obj){
  xapi_list <- xmlToList(xapi_obj)
  xList<- lapply(xapi_list,unlist)

  abc <- lapply(xList,function(x)x[which(x=="name")+1])
}
