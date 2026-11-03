# Source: Hadi Fanaee-T, UCI Bike Sharing dataset (CC BY 4.0)
# https://doi.org/10.24432/C5W894
raw_bikes <- read.csv("data-raw/hour.csv")

# Check that the two rider groups add up to the recorded total
stopifnot(all(raw_bikes$casual + raw_bikes$registered == raw_bikes$cnt))

# Keep one row per recorded hour and label the day types
bike_hourly <- data.frame(
  date = as.Date(raw_bikes$dteday),
  hour = raw_bikes$hr,
  day_type = factor(raw_bikes$workingday,
                    levels = c(0, 1),
                    labels = c("Non-working day", "Working day")),
  casual = raw_bikes$casual,
  registered = raw_bikes$registered
)

# Save the prepared dataset for the R package
dir.create("data", showWarnings = FALSE)
save(bike_hourly, file = "data/bike_hourly.rda")