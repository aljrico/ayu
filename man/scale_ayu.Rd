% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/palette.R
\name{scale_color_ayu}
\alias{scale_color_ayu}
\alias{scale_colour_ayu}
\alias{scale_colour_ayu_d}
\alias{scale_color_ayu_d}
\alias{scale_fill_ayu_d}
\alias{scale_fill_ayu}
\title{Ayu colour scales}
\usage{
scale_color_ayu(
  option = "sequential1",
  ...,
  alpha = 1,
  begin = 0,
  end = 1,
  direction = 1,
  discrete = FALSE
)

scale_colour_ayu(
  option = "sequential1",
  ...,
  alpha = 1,
  begin = 0,
  end = 1,
  direction = 1,
  discrete = FALSE
)

scale_colour_ayu_d(
  option = "sequential1",
  ...,
  alpha = 1,
  begin = 0,
  end = 1,
  direction = 1
)

scale_color_ayu_d(
  option = "sequential1",
  ...,
  alpha = 1,
  begin = 0,
  end = 1,
  direction = 1
)

scale_fill_ayu_d(
  option = "sequential1",
  ...,
  alpha = 1,
  begin = 0,
  end = 1,
  direction = 1
)

scale_fill_ayu(
  option = "sequential1",
  ...,
  alpha = 1,
  begin = 0,
  end = 1,
  direction = 1,
  discrete = FALSE
)
}
\arguments{
\item{option}{A character string indicating the colourmap  to use.}

\item{...}{parameters to \code{discrete_scale} or \code{scale_fill_gradientn}}

\item{alpha}{pass through parameter to \code{ayu}}

\item{begin}{The (corrected) hue in [0,1] at which the ayu colormap begins.}

\item{end}{The (corrected) hue in [0,1] at which the ayu colormap ends.}

\item{direction}{Sets the order of colors in the scale. If 1, the default, colors
are as output by \code{ayu_pal}. If -1, the order of colors is reversed.}

\item{discrete}{generate a discrete palette? (default: \code{FALSE} - generate continuous palette)}
}
\description{
Uses the Ayu  color scheme
}
\details{
For \code{discrete == FALSE} (the default) all other arguments are as to
\link[ggplot2]{scale_fill_gradientn} or \link[ggplot2]{scale_color_gradientn}.
Otherwise the function will return a \code{discrete_scale} with the plot-computed
number of colors.
}
\examples{
library(ggplot2)



ggplot(mtcars, aes(factor(cyl), fill=factor(vs))) +
geom_bar() +
scale_fill_ayu(discrete = TRUE, option = "qualitative2")

ggplot(mtcars, aes(factor(gear), fill=factor(carb))) +
geom_bar() +
scale_fill_ayu(discrete = TRUE, option = "sequential2")

ggplot(mtcars, aes(x = mpg, y = disp, colour = hp)) +
geom_point(size = 2) +
scale_colour_ayu(option = "qualitative3")




}
\author{
Alejandro Jim??nez Rico \email{aljrico@gmail.com}
}
