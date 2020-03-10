
[![cran
version](http://www.r-pkg.org/badges/version/ayu)](https://cran.r-project.org/package=ayu)
[![rstudio mirror per-month
downloads](http://cranlogs.r-pkg.org/badges/ayu)](https://github.com/metacran/cranlogs.app)
[![rstudio mirror total
downloads](http://cranlogs.r-pkg.org/badges/grand-total/ayu?color=yellowgreen)](https://github.com/metacran/cranlogs.app)

# ayu

<!-- badges: start -->

<!-- badges: end -->

This package provides a user-friendly API to add some of the beautiful
Ayu colours into R plots.

## Installation

You can install the released version of ayu from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("ayu")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("aljrico/ayu")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(ayu)
pal <- ayu(n = 8, option = "sequential1")
image(volcano, col = pal)
```

<img src="man/figures/README-example 1-1.png" width="100%" />

``` r

pal <- ayu(n = 128, option = "sequential1")
image(volcano, col = pal)
```

<img src="man/figures/README-example 1-2.png" width="100%" />

## ggplot2

Of course, this package has specific functions to behave seamlessly with
the best data visiualisation library available. The package contains
colour scale functions for **ggplot2** plots: `scale_colour_ayu()` and
`scale_fill_ayu()`.

``` r
library(ggplot2)
ggplot(data.frame(x = rnorm(1e4), y = rnorm(1e4)), aes(x = x, y = y)) +
  geom_hex() + 
    coord_fixed() +
  scale_fill_ayu(option = "sequential3") + 
    theme_bw()
```

<img src="man/figures/README-example 2-1.png" width="100%" />

### Qualitative Scales

But what if you want discrete scales? These functions also can be used
for discrete scales with the argument `discrete = TRUE`. This argument,
when TRUE, sets a finite number of sufficiently spaced colours within
the selected palette to plot your data.

``` r
ggplot(diamonds, aes(factor(color), fill=factor(cut))) +
    geom_bar(colour = "black") +
    scale_fill_ayu(discrete = TRUE, option = "qualitative1", name = "Cut", direction = -1) +
    ylab("") +
    xlab("Colour") +
    coord_flip()
```

<img src="man/figures/README-example 3-1.png" width="100%" />
