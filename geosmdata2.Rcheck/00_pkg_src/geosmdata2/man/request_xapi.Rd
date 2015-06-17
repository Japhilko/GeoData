\name{request_xapi}
\alias{request_xapi}
\title{function request_xapi}
\usage{
request_xapi(bb_x,object_x)
}
\arguments{
\item{bb_x}{the bounding box for elements.}
\item{object_x}{which type of element.}

}
\value{
an instance of \code{bbox}.
}
\description{
Returns info from \url{http://open.mapquestapi.com/xapi/}
}
\author{
Jan-Philipp Kolb \email{Jan-Philipp_Kolb@gmx.net}
}
\examples{
dat <- c(8.417813,8.59396,49.410141,49.58984)
bb_x1 <- array(dat,c(2,2))

MA_bakery <-  request_xapi(bb_x=bb_x1,object_x="shop=bakery")

}
