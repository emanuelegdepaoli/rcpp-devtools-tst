#' Passeggiata casuale con R
#' @description
#' Simula il valore al tempo t di una passeggiata casuale
#' @param t numero di simulazioni
#' @return `int`
#' @export

rw <- function(t) cumsum(sample(c(-1, 1), size = t, replace = T))
