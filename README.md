# bikehours

When did bike rentals peak for casual and registered riders? `bikehours` is
an R package with a Shiny app for bike-share operations planners exploring
hourly Capital Bikeshare rentals in 2011–2012.

## Install and launch

Install the package from GitHub:

```r
# Run once if needed: install.packages("remotes")
remotes::install_github("ETC5523-2026/etc5523-assignment-4-asri0053")
```

Load the package and launch the app:

```r
library(bikehours)
launch_app()
```

## Explore the data

Choose a working or non-working day, then select the rider groups to compare.
Each line shows the average number of rentals at each hour across recorded
days of the selected type. Non-working days include weekends and holidays.

With both groups selected, switch between day types. On working days, both
groups peaked at 5 pm. On non-working days, registered rentals peaked at noon
and casual rentals at 2 pm. These system-wide averages describe historical
patterns and cannot identify which individual stations were busiest.

## Data and licence

The data comes from Hadi Fanaee-T’s [Bike Sharing dataset](https://doi.org/10.24432/C5W894),
available from the UCI Machine Learning Repository under
[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).
The preparation script retains five fields, converts the date and labels the
day types. The package code is licensed under the MIT licence.

## Generative AI declaration

