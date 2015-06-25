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
Extract information from OpenStreetMap object
}
\author{
Jan-Philipp Kolb \email{Jan-Philipp_Kolb@gmx.net}
}
\examples{

schools <- get_osm_nodes(object2="school",place="Montpellier")
info <- extract_info_op(OSM.Data=schools,value="school")

}
