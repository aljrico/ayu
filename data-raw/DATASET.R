library(tidyverse)

map <- list()

# Define Palettes
ayu_palettes <- list(
  qualitative1 = c("#5CCFE6", "#FFD580", "#BAE67E", "#FFA759", "#D4BFFF", "#F28799"),
  qualitative2 = c('#39BAE6', '#FFb454', '#C2d94C', '#FF8F40', '#F07178'),
  qualitative3 = c('#55B4d4', '#F2AE49', '#86B300', '#E6BA7E', '#A37ACC', '#F07171'),
  sequential1 = c('#FFCC66', '#1F2430'),
  sequential2 = c('#FF9940', '#FAFAFA'),
  sequential3 = c('#5CCFE6', '#1F2430'),
  sequential4 = c('#FFCC66', '#BAE67E', '#1F2430')
)


# Expand palette to accept contiuous scales or longer discrete scales
complete_palette <- function(option, n = 3e3) {
  complete_col <- c()
  for (i in 1:(length(option) - 1)) {
    cols <- colorRampPalette(c(option[i], option[i + 1]))
    complete_col <- c(complete_col, cols(n))
  }
  return(complete_col)
}

# Build DF map
make_map <- function(palettes, option_name) {
  palettes[[option_name]] %>%
    complete_palette() %>%
    grDevices::col2rgb() %>%
    t() %>%
    as.data.frame() %>%
    dplyr::rename(V1 = red) %>%
    dplyr::rename(V2 = green) %>%
    dplyr::rename(V3 = blue) %>%
    dplyr::mutate(option = option_name)
}

for (h in names(ayu_palettes)) {
  df <- make_map(ayu_palettes, h)
  map <- rbind(map, df)
}

ayu.map <- map
usethis::use_data(ayu.map, internal = TRUE, overwrite = TRUE)
usethis::use_data(ayu_palettes, overwrite = TRUE)