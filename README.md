# R package - Rcpp
- creare pacchetto con `devtools::create()`
- predisporre pkg all'uso di rcpp con `usethis::use_rcpp()`
- inserire come da messaggio stampato il codice nessario in <pkg-name>-package.R
- modificare il codice rcpp in `src`:
  - documentare le funzioni normalmente con roxygen, ma iniziando i commenti per
    `//'` al posto di `#'`
  - per esportare le funzioni, includere:
    ```
    //' @export
    // [[Rcpp::export]]
    ```
    prima della funzione

# RcppArmadillo
- inserire prima del codice .cpp anche:
   ```
   // [[Rcpp::depends(RcppArmadillo)]]
   #include <RcppArmadillo.h>
   ```
- aggiornare DESCRIPTION
  `usethis::use_package("RcppArmadillo", "LinkingTo")`

- aggiungere file `Makevars` sotto `src/`:
  ```
  CXX_STD = CXX11

  PKG_CXXFLAGS = $(SHLIB_OPENMP_CXXFLAGS)
  PKG_LIBS = $(SHLIB_OPENMP_CXXFLAGS) $(LAPACK_LIBS) $(BLAS_LIBS) $(FLIBS)
  ```
