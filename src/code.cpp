// [[Rcpp::depends(RcppArmadillo)]]
#include <RcppArmadillo.h>
#include <Rcpp.h>
using namespace Rcpp;

//' Passeggiata casuale con Rcpp
//' @description Simula il valore al tempo t di una passeggiata casuale
//' @param t numero di simulazioni
//' @return `int`
//' @export
// [[Rcpp::export]]
double rw_rcpp(int t){
 int sum = 0;
 NumericVector v = {-1, 1};
 for(int i = 0; i < t; i++){
   sum += Rcpp::sample(v, 1)[0];
 }
 return sum;
}

//' Passeggiata casuale con RcppArmadillo
//' @description Simula il valore al tempo t di una passeggiata casuale
//' @param t numero di simulazioni
//' @return `int`
//' @export
// [[Rcpp::export]]
double rw_rcpp_arma(int t){
 int sum = 0;
 for(int i = 0; i < t; i++){
   double x_n = arma::randu();
   Rcout << x_n ;
   if (x_n < 0.5){
     sum += -1;
   } else {
     sum += 1;
   }
 }
 return sum;
}

// internal function that will not be exported in R
// omitting //' @export
// [[Rcpp::export(.calc_ols)]]
arma::mat calc_ols(arma::mat X, arma::vec y){
  arma::colvec beta = arma::inv( X.t() * X) * X.t() * y;
  return beta;
}
