#' Myridis
#'
#' @export
myridis <- function(){
  c(
    get_main_colours()$mirage$red |> darken(granularity = 100, 96),
    get_main_colours()$mirage$darkblue |> darken(granularity = 100, 75),
    get_main_colours()$synthetic$bluesea |> darken(100, 60),
    get_main_colours()$mirage$green |> darken(100, 30),
    get_main_colours()$mirage$yellow |> pale(100, 20)
  )
}
