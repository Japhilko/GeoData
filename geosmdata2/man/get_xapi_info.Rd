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
data("MA_pg")
get_xapi_info(MA_pg)
}
