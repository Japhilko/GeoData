\name{get_osm_nodes}
\alias{get_osm_nodes}
\title{function get_osm_nodes}
\usage{
get_osm_nodes(bb_x,object_x)
}
\arguments{
\item{object2}{Value for map feature you are searching for}
\item{place}{Place for the map features}

}
\value{

}
\description{
Returns info from \url{http://www.overpass-api.de/api/}
}
\author{
Jan-Philipp Kolb \email{Jan-Philipp_Kolb@gmx.net}
}
\examples{
  cafes <- get_osm_nodes("cafe",place="Sandhofen")


}
