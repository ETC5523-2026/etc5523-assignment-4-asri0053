#' Average bike rentals by hour for a selected day type
#'
#' @param data A data frame with hour, day_type, casual and registered
#'   columns, such as bike_hourly.
#' @param day_type Either "Working day" or "Non-working day".
#' @return A data frame with one row per observed hour. The casual and
#'   registered columns give mean rentals across recorded days of that type.
#' @examples
#' summarise_hourly(bike_hourly, "Working day")
#' @export
summarise_hourly <- function(data, day_type) {
  day_type <- match.arg(day_type, c("Working day", "Non-working day"))
  selected <- data[data$day_type == day_type, ]
  
  if (nrow(selected) == 0) {
    stop("No recorded hours are available for this day type.")
  }
  
  stats::aggregate(
    cbind(casual, registered) ~ hour,
    data = selected,
    FUN = mean
  )
}