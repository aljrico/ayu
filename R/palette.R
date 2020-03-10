#' Ayu Colour Map.
#'
#' This function creates a vector of \code{n} equally spaced colors along the Ayu colour map of your selection.
#'
#' @param n The number of colors (\eqn{\ge 1}) to be in the palette.
#'
#' @param alpha	The alpha transparency, a number in [0,1], see argument alpha in
#' \code{\link[grDevices]{hsv}}.
#'
#' @param begin The (corrected) hue in [0,1] at which the ayu colormap begins.
#'
#' @param end The (corrected) hue in [0,1] at which the ayu colormap ends.
#'
#' @param direction Sets the order of colors in the scale. If 1, the default, colors
#' are ordered from darkest to lightest. If -1, the order of colors is reversed.
#'
#' @param option A character string indicating the colourmap from a option to use.
#'
#' @return \code{ayu} returns a character vector, \code{cv}, of color hex
#' codes. This can be used either to create a user-defined color palette for
#' subsequent graphics by \code{palette(cv)}, a \code{col =} specification in
#' graphics functions or in \code{par}.
#'
#' @author Alejandro Jiménez Rico \email{aljrico@@gmail.com}, \href{https://aljrico.github.io}{Personal Blog}
#'
#' @details
#'
#' Semi-transparent colors (\eqn{0 < alpha < 1}) are supported only on some
#' devices: see \code{\link[grDevices]{rgb}}.
#'
#' @examples
#' library(ggplot2)
#' library(hexbin)
#'
#' dat <- data.frame(x = rnorm(1e4), y = rnorm(1e4))
#' ggplot(dat, aes(x = x, y = y)) +
#'   geom_hex() +
#'   coord_fixed() +
#'   scale_fill_gradientn(colours = ayu(128, option = 'sequential1'))
#'
#' pal <- ayu(256, option = "qualitative1")
#' image(volcano, col = pal)
#'
#' @rdname ayu
#' @export
#'
ayu <- function(n, alpha = 1, begin = 0, end = 1, direction = 1, option = 'sequential1') {
  
  option <- tolower(option)
  option <- gsub(" ", "", option, fixed = TRUE)
  option <- gsub("\\_", "", option, fixed = FALSE)
  
  if (begin < 0 | begin > 1 | end < 0 | end > 1) {
    stop("begin and end must be in [0,1]")
  }
  
  if (abs(direction) != 1) {
    stop("direction must be 1 or -1")
  }
  
  if (direction == -1) {
    tmp <- begin
    begin <- end
    end <- tmp
  }
  
  colnames(ayu.map) <- c("R", "G", "B", "option")
  
  map <- ayu.map[ayu.map$option == option, ]
  
  map_cols <- grDevices::rgb(map$R, map$G, map$B, maxColorValue = 255)
  fn_cols <- grDevices::colorRamp(map_cols, space = "Lab", interpolate = "spline")
  cols <- fn_cols(seq(begin, end, length.out = n)) / 255
  grDevices::rgb(cols[, 1], cols[, 2], cols[, 3], alpha = alpha)
}



#' @rdname ayu
#'
#' @export
ayu_pal <- function(alpha = 1, begin = 0, end = 1, direction = 1, option = 'sequential1') {

  option <- tolower(option)
  option <- gsub(" ", "", option, fixed = TRUE)
  option <- gsub("\\_", "", option, fixed = FALSE)
  
  function(n) {
    ayu(n, alpha, begin, end, direction, option)
  }
}


#' @rdname scale_ayu
#'
#' @importFrom ggplot2 scale_fill_gradientn scale_color_gradientn discrete_scale
#'
#' @export
scale_color_ayu <- function(option = 'sequential1', ..., alpha = 1, begin = 0, end = 1, direction = 1,
                           discrete = FALSE) {

  option <- tolower(option)
  option <- gsub(" ", "", option, fixed = TRUE)
  option <- gsub("\\_", "", option, fixed = FALSE)
  
  if (discrete) {
    discrete_scale("colour", "ayu", ayu_pal(alpha, begin, end, direction, option), ...)
  } else {
    scale_color_gradientn(colours = ayu(256, alpha, begin, end, direction, option), ...)
  }
}

#' @rdname scale_ayu
#' @aliases scale_color_ayu
#' @importFrom ggplot2 discrete_scale
#' @export
scale_colour_ayu <- scale_color_ayu

#' @rdname scale_ayu
#' @aliases scale_color_ayu
#' @export
scale_colour_ayu_d <- function(option = 'sequential1', ..., alpha = 1, begin = 0, end = 1,
                              direction = 1) {
  discrete_scale("colour", "ayu", ayu_pal(alpha, begin, end, direction, option), ...)
}

#' @rdname scale_ayu
#' @aliases scale_color_ayu
#' @export
scale_color_ayu_d <- scale_colour_ayu_d


#' @rdname scale_ayu
#' @aliases scale_fill_ayu
#' @importFrom ggplot2 discrete_scale
#' @export
scale_fill_ayu_d <- function(option = 'sequential1', ..., alpha = 1, begin = 0, end = 1,
                            direction = 1) {
  discrete_scale("fill", "ayu", ayu_pal(alpha, begin, end, direction, option), ...)
}


#' Ayu colour scales
#'
#' Uses the Ayu  color scheme
#'
#' For \code{discrete == FALSE} (the default) all other arguments are as to
#' \link[ggplot2]{scale_fill_gradientn} or \link[ggplot2]{scale_color_gradientn}.
#' Otherwise the function will return a \code{discrete_scale} with the plot-computed
#' number of colors.
#'
#'
#' @param ... parameters to \code{discrete_scale} or \code{scale_fill_gradientn}
#'
#' @param alpha pass through parameter to \code{ayu}
#'
#' @param begin The (corrected) hue in [0,1] at which the ayu colormap begins.
#'
#' @param end The (corrected) hue in [0,1] at which the ayu colormap ends.
#'
#' @param direction Sets the order of colors in the scale. If 1, the default, colors
#' are as output by \code{ayu_pal}. If -1, the order of colors is reversed.
#'
#' @param discrete generate a discrete palette? (default: \code{FALSE} - generate continuous palette)
#'
#' @param option A character string indicating the colourmap  to use.
#'
#' @rdname scale_ayu
#'
#' @author Alejandro Jiménez Rico \email{aljrico@@gmail.com}
#'
#' @importFrom ggplot2 scale_fill_gradientn scale_color_gradientn discrete_scale
#'
#' @importFrom gridExtra grid.arrange
#'
#' @examples
#' library(ggplot2)
#'
#'
#'
#' ggplot(mtcars, aes(factor(cyl), fill=factor(vs))) +
#' geom_bar() +
#' scale_fill_ayu(discrete = TRUE, option = "qualitative2")
#'
#' ggplot(mtcars, aes(factor(gear), fill=factor(carb))) +
#' geom_bar() +
#' scale_fill_ayu(discrete = TRUE, option = "sequential2")
#'
#' ggplot(mtcars, aes(x = mpg, y = disp, colour = hp)) +
#' geom_point(size = 2) +
#' scale_colour_ayu(option = "qualitative3")
#'
#'
#'
#'
#' @export
scale_fill_ayu <- function(option = 'sequential1', ..., alpha = 1, begin = 0, end = 1, direction = 1,
                          discrete = FALSE) {
  
  option <- tolower(option)
  option <- gsub(" ", "", option, fixed = TRUE)
  option <- gsub("\\_", "", option, fixed = FALSE)
  
  if (discrete) {
    discrete_scale("fill", "ayu", ayu_pal(alpha, begin, end, direction, option), ...)
  } else {
    scale_fill_gradientn(colours = ayu(256, alpha, begin, end, direction, option), ...)
  }
}
