#' Generate Divergent Palette
#'
#' @param colours hex codes
#' @param n number of colours
#' @export
generate_divergent_palette <- function(colours, n = 3){
  grDevices::colorRampPalette(colours)(n)
}
