\name{CountNodes}
\alias{CountNodes}
\title{function to count nodes in an osm xml object}
\usage{
CountNodes(object2)
}
\arguments{
\item{object2}{a xml object}
}
\description{
function to count nodes
}
\author{
Jan-Philipp Kolb \email{Jan-Philipp_Kolb@gmx.net}
}
\examples{
ambulance_station <- get_osm_nodes(object2="ambulance_station",place="Berlin")
CountNodes(ambulance_station)
}
