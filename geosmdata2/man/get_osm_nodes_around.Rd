\name{get_osm_nodes_around}
\alias{get_osm_nodes_around}
\title{function get_osm_nodes_around}
\usage{
get_osm_nodes_around(place,radius)
}
\arguments{
\item{place}{Point or place}
\item{radius}{radius around point}

}
\description{
Returns info on nodes from \url{http://www.overpass-api.de/api/}
}
\author{
Jan-Philipp Kolb \email{Jan-Philipp_Kolb@gmx.net}
}
\seealso{
\code{\link{get_osm_nodes}}, \url{http://www.r-project.org}
}
\examples{
info <- get_osm_nodes_around("Mannheim",radius=5)
}
