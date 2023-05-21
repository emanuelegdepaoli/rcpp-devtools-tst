# R package - Rcpp
- create pkg: `devtools::create()`
- set pkg to use Rcpp: `usethis::use_rcpp()`
- follow the help message and add the code to `R/<pkg-name>-package.R`
- write your Rcpp code in `src/`:
  - document functions with roxygen as usual but begin statements with `//'` 
  - to export functions, include before functions declaration:
    ```
    //' @export
    // [[Rcpp::export]]
    ```
   
# RcppArmadillo
- add at the beginning of `.cpp` files:
   ```
   // [[Rcpp::depends(RcppArmadillo)]]
   #include <RcppArmadillo.h>
   ```
- update `DESCRIPTION`: `usethis::use_package("RcppArmadillo", "LinkingTo")`

- add `Makevars` to `src/`:
  ```
  CXX_STD = CXX11

  PKG_CXXFLAGS = $(SHLIB_OPENMP_CXXFLAGS)
  PKG_LIBS = $(SHLIB_OPENMP_CXXFLAGS) $(LAPACK_LIBS) $(BLAS_LIBS) $(FLIBS)
  ```
