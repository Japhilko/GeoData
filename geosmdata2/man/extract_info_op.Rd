\name{extract_info_op}
\alias{extract_info_op}
\title{function extract_info_op}
\usage{
extract_info_op(OSM.Data,value)
}
\arguments{
\item{OSM.Data}{an osm object.}
\item{value}{a map feature.}

}
\value{.
}
\description{

}
\author{
Jan-Philipp Kolb \email{Jan-Philipp_Kolb@gmx.net}
}
\examples{
library(XML)
object_x <- "amenity=school"
bbox_x <- "8.4178134,49.41014103,8.59395996,49.58984376"
# schools_MA <- xmlParse(paste("http://www.overpass-api.de/api/xapi?way[bbox=",bbox_x,"][",object_x,"]",
#               sep=""))

# info <- extract_info_op(OSM.Data=schools_MA,value="school")

}
