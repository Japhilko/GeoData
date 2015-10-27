\name{get_osm_relation}
\alias{get_osm_relation}
\title{function get_osm_relation}
\usage{
get_osm_relation(object2,place)
}
\arguments{
\item{object2}{Value for map feature you are searching for}
\item{place}{Place for the map features}
}
\description{
Returns info on nodes from \url{http://www.overpass-api.de/api/}
}
\author{
Jan-Philipp Kolb \email{Jan-Philipp_Kolb@gmx.net}
}
\examples{
bike_routes <- get_osm_relation(object2="bicycle",place="Mannheim")
}
