\name{plotbui}
\alias{plotbui}
\title{function plotbui}
\usage{
plotbui(ua)
}
\arguments{
\item{ua}{the osmar file which the polygons are to be read from.}
}
\value{
an instance of \code{get_osm}.
}
\description{
Converts osmar object in polygons
}
\author{
Jan-Philipp Kolb \email{Jan-Philipp_Kolb@gmx.net}
}
\examples{
data(uaBerlin)
pol_Berlin <- plotbui(uaBerlin)
}
