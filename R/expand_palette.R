#' Expand Palette
#'
#' @param colours hex codes
#' @param n number of colours
#'
#' @export
expand_palette <- function(colours, n){
  interpolator <- grDevices::colorRamp(colours, space = "Lab", interpolate = "spline")
  colour_map <- interpolator(seq(0, 1, length.out = n)) / 255
  grDevices::rgb(colour_map[, 1], colour_map[, 2], colour_map[, 3], alpha = 1)
}
