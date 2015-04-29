#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
NumericVector sety(NumericVector x, int y){
  NumericVector x(x>0)=y
}