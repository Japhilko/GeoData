request_xapi <- function(bb_x,object_x){
  bbox_x <- paste(bb_x[1,1],bb_x[2,1],bb_x[1,2],bb_x[2,2],sep=",")
  xapi_x <- xmlParse(paste("http://open.mapquestapi.com/xapi/api/0.6/node%5B",object_x,"%5D%5Bbbox=",bbox_x,"%5D",sep=""))
}

