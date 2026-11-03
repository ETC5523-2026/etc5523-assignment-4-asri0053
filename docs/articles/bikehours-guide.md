# Explore hourly bike rentals

## Compare peak rental times

Suppose you are a bike-share operations planner. You want to know
whether casual and registered riders used Capital Bikeshare most heavily
at the same time of day, and whether that changed on weekends and
holidays. This example uses hourly rental counts recorded in 2011–2012.

## Install and open the app

Install the package from GitHub. If the Classroom repository is private,
you will need to use a GitHub account with access to it.

``` r
# Run once if needed: install.packages("remotes")
remotes::install_github("ETC5523-2026/etc5523-assignment-4-asri0053")
```

Load the package:

``` r
library(bikehours)
```

Launch the app from your R console:

``` r
launch_app()
```

## Explore the chart

1.  Select **Working day** and leave both rider groups ticked. Each line
    shows the average number of rentals at each clock hour across the
    recorded days of that type. Both groups reached their highest
    average at **17:00 (5 pm)**.
2.  Switch to **Non-working day**, which includes weekends and holidays.
    Registered rentals peaked at **12:00 (noon)** and casual rentals at
    **14:00 (2 pm)**. The groups now peaked two hours apart.
3.  Untick one group to follow the other line on its own. If you untick
    both, the app prompts you to select a rider group.

## Check a finding in R

You can reproduce the non-working-day result with the package’s summary
function. Each row of its output represents one hour of the clock.

``` r
hourly <- summarise_hourly(bike_hourly, "Non-working day")

data.frame(
  rider_group = c("Casual", "Registered"),
  peak_hour = c(
    hourly$hour[which.max(hourly$casual)],
    hourly$hour[which.max(hourly$registered)]
  )
)
#>   rider_group peak_hour
#> 1      Casual        14
#> 2  Registered        12
```

For a planner, the comparison identifies when recorded rentals were
highest across the system. The data combine all stations, so they cannot
tell the planner which station needed more bikes at those times.
