#' Spectral
#'
#' @export
spectral <- function(){
  c(
    get_main_colours()$mirage$red |> darken(100, 5),
    get_main_colours()$mirage$yellow |> darken(100, 5),
    get_main_colours()$mirage$green |> darken(100, 5),
    get_main_colours()$mirage$blue |> darken(100, 5),
    get_main_colours()$mirage$purple |> darken(100, 5)
  )
}
