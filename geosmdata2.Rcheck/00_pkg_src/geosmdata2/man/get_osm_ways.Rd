\name{get_osm_ways}
\alias{get_osm_ways}
\title{function get_osm_ways}
\usage{
get_osm_nodes(object2,place)
}
\arguments{
\item{object2}{Value for map feature you are searching for}
\item{place}{Place for the map features}

}
\value{

}
\description{
Returns info on ways from \url{http://www.overpass-api.de/api/}
}
\author{
Jan-Philipp Kolb \email{Jan-Philipp_Kolb@gmx.net}
}
\examples{
#  roads <- get_osm_ways(object2="secondary",place="Sandhofen")
  bike_routes <- get_osm_ways(object2="cycleway",place="Berkeley")

}
