require(rbenchmark)
benchmark(rw(10^5),
          rw_rcpp(10^5),
          rw_rcpp_arma(10^5))

require(dplyr)
require(purrr)
data <- 1:100 %>%
  map_dfc(rnorm, n = 10^4) %>%
  bind_cols(y = rnorm(10^4))

lm_coef <- function(formula, data) coef(lm(formula, data))

benchmark(lm_rcpp_arma(y ~ ., data),
              lm_Rbase(y ~ ., data),
               lm_coef(y ~ ., data)
)
