\name{get_osm_nodes}
\alias{get_osm_nodes}
\title{function get_osm_nodes}
\usage{
get_osm_nodes(object2,place)
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
\seealso{
\url{http://www.r-project.org}
}
\examples{
  # cafes <- get_osm_nodes("cafe",place="Emeryville")
  # brewery <- get_osm_nodes("brewery",place="Ingolstadt")
}
