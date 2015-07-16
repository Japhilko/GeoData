#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
NumericVector sumC(NumericVector x, NumericVector y) {
  NumericVector r = sqrt(x);
  return r;
}



