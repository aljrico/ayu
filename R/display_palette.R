#' Display Palette
#'
#'
#' @param pal Array of colours in hex code
#' @param xlab Label in the x axis
#' @param ylab Label in the y axis
#' @importFrom graphics image
#' @export
display_palette <- function(pal, xlab = "", ylab = "") {
  n <- length(pal)
  image(
    1:n,
    1,
    as.matrix(1:n),
    col = pal,
    xlab = xlab,
    ylab = ylab,
    xaxt = "n",
    yaxt = "n",
    bty = "n"
  )
}
