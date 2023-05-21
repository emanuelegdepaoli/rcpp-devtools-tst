#' Calcola coef modello lineare con RcppArmadillo
#' @description
#' Calcola la soluzione OLS di un modello lineare con funzione di perdita data
#' dalla somma dei residui al quadrato
#' @param formula un oggetto della classe formula
#' @param data dataset contenente le variabili
#' @return `vector`
#' @export
lm_rcpp_arma <- function(formula, data){

  X <- model.matrix(formula, data)
  y <- data[[ all.vars(formula)[1] ]]

  beta <- as.vector(.Call(`_rcpptst_calc_ols`, X, y))
  names(beta) <- colnames(X)

  return(beta)
}
