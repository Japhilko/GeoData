\name{CircSearch}
\alias{CircSearch}
\title{function CircSearch}
\usage{
CircSearch(what,lat,lon,radius)
}
\arguments{
\item{what}{Map feature}
\item{lat}{Latitude}
\item{lon}{Longitude}
\item{radius}{Radius}
}
\description{
Performs circum search
}
\author{
Jan-Philipp Kolb \email{Jan-Philipp_Kolb@gmx.net}
}
\references{
\url{http://wiki.openstreetmap.org/wiki/Overpass_API#Around}
}
\examples{
gc <- geocode_osm(place="Venice beach",output="all")
cafes_venice <- CircSearch(what="cafe",lat=gc$lat,lon=gc$lon,radius=10000)
}



