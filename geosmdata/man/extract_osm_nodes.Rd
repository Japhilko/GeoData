\name{extract_osm_nodes}
\alias{extract_osm_nodes}
\title{function extract_osm_nodes}
\usage{
extract_osm_nodes(OSM.Data,value)
}
\arguments{
\item{OSM.Data}{an osm object.}
\item{value}{a map feature.}

}
\value{.
}
\description{
Extract information from OpenStreetMap object
}
\author{
Jan-Philipp Kolb \email{Jan-Philipp_Kolb@gmx.net}
}
\examples{

schools <- get_osm_nodes(object="amenity=school",place="Mannheim")
info <- extract_osm_nodes(OSM.Data=schools,value="school")

}
