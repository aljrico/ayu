#' Palette DarkBlue - Yellow
#'
darkBlueYellow <- function(){
  c(
    "#1f2430",
    get_main_colours()$synthetic$bluesea |> darken(100, 90),
    generate_divergent_palette(
      c(
        get_main_colours()$synthetic$bluesea |> darken(100, 80),
        get_main_colours()$mirage$yellow
      ),
      4
    )
  )
}
