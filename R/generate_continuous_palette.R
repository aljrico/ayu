#' Generate Continuous Palette
#'
#' @param colour hex code
#' @param contrast number from 0 to 1
#' @param n number of colours
#' @export
generate_continuous_palette <- function(colour, contrast = 0.3, n = 7){
  granularity <- 100
  normalised_contrast <- round(tanh(contrast) * granularity)
  pale <- function(colour) grDevices::colorRampPalette(c(colour, '#fafafa'))(granularity)[[normalised_contrast]]
  darken <- function(colour) grDevices::colorRampPalette(c(colour, '#1f2430'))(granularity)[[normalised_contrast]]
  grDevices::colorRampPalette(c(darken(colour), colour, pale(colour)))(n)
}
