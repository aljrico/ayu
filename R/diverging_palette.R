#'
#' @param name name of the palette
#' @param n length of the palette
#'
#' @export
diverging_palette <- function(name, n = 6){
  get(name)() |>
    expand_palette(n)
}
