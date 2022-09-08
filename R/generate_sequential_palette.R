pale <- function(colour, granularity, normalised_contrast) grDevices::colorRampPalette(c(colour, '#fafafa'))(granularity)[[normalised_contrast]]
darken <- function(colour, granularity, normalised_contrast) grDevices::colorRampPalette(c(colour, '#1f2430'))(granularity)[[normalised_contrast]]

#' Generate Continuous Palette
#'
#' @param colour hex code
#' @param contrast number from 0 to 1
#' @param n number of colours
#' @export
generate_sequential_palette <- function(colour, contrast = 0.3, n = 7){
  granularity <- 100
  normalised_contrast <- round(tanh(contrast) * granularity)
  grDevices::colorRampPalette(
    c(
      darken(colour, granularity, normalised_contrast),
      colour,
      pale(colour, granularity, normalised_contrast)
      )
    )(n)
}
