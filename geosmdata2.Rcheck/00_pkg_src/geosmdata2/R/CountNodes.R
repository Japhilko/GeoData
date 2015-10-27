
CountNodes <- function(object2){
  root <- xmlRoot(object2)
  infoAttrs <- xmlSApply(root, xmlAttrs)
  num_objects <- sum(names(infoAttrs)=="node")
  return(num_objects)
}
