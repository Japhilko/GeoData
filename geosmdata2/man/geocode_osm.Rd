\name{geocode_osm}
\alias{geocode_osm}
\title{function geocode_osm}
\usage{
geocode_osm(place)
}
\arguments{
\item{place}{Place which should be geocoded}
}
\description{
Returns info from \url{http://nominatim.openstreetmap.org/}
}
\author{
Jan-Philipp Kolb \email{Jan-Philipp_Kolb@gmx.net}
}
\references{
\url{https://github.com/malexan/nominatim/blob/master/geocode.r}
}
\examples{
geocode_osm(place="Mannheim B2,1")
}



