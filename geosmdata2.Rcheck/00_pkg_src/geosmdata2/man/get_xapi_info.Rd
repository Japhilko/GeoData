\name{get_xapi_info}
\alias{get_xapi_info}
\title{function get_xapi_info}
\usage{
get_xapi_info(xapi_obj)
}
\arguments{
\item{xapi_obj}{an XML object with xapi information}
}
\value{
an instance of \code{request_xapi}.
}
\description{
Returns info from \url{http://open.mapquestapi.com/xapi/}
}
\author{
Jan-Philipp Kolb \email{Jan-Philipp_Kolb@gmx.net}
}
\examples{
bbox_x1 <- "8.461786,49.4320257,8.5514127,49.4984071"
object_x="amenity=pub"

# MA_pub <- xmlParse(paste("http://open.mapquestapi.com/xapi/api/0.6/node%5B",object_x,"%5D%5Bbbox=",bbox_x1,"%5D",sep=""))

}
