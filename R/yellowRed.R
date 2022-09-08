#' Yellow - Red
#'
#' @export
yellowRed <- function(){
  c(
    get_main_colours()$mirage$yellow,
    get_main_colours()$mirage$red |> darken(100, 25)
  )
}
