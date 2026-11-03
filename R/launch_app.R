#' Launch the bike rental explorer
#'
#' Open a Shiny app to compare hourly rental patterns for casual and
#' registered riders on working and non-working days.
#'
#' @return Runs the Shiny application until the user stops it.
#' @examples
#' if (interactive()) launch_app()
#' @export
launch_app <- function() {
  app_dir <- system.file("app", package = "bikehours", mustWork = TRUE)
  shiny::runApp(app_dir)
}