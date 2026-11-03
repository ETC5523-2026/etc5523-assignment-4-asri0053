# Average bike rentals by hour for a selected day type

Average bike rentals by hour for a selected day type

## Usage

``` r
summarise_hourly(data, day_type)
```

## Arguments

- data:

  A data frame with hour, day_type, casual and registered columns, such
  as bike_hourly.

- day_type:

  Either "Working day" or "Non-working day".

## Value

A data frame with one row per observed hour. The casual and registered
columns give mean rentals across recorded days of that type.

## Examples

``` r
summarise_hourly(bike_hourly, "Working day")
#>    hour     casual registered
#> 1     0  7.1491935  29.637097
#> 2     1  3.7105263  12.842105
#> 3     2  2.1375770   6.546201
#> 4     3  0.9106383   4.031915
#> 5     4  0.7659574   4.663830
#> 6     5  1.2707071  23.642424
#> 7     6  4.3185484  98.181452
#> 8     7 12.1955645 278.417339
#> 9     8 22.2641129 454.741935
#> 10    9 24.3125000 217.205645
#> 11   10 31.2056452 104.161290
#> 12   11 37.5987903 120.631048
#> 13   12 41.3581489 159.462777
#> 14   13 42.5682731 155.861446
#> 15   14 45.8694779 137.702811
#> 16   15 46.3333333 154.997992
#> 17   16 48.3446894 244.777555
#> 18   17 56.8957916 468.394790
#> 19   18 50.4518072 441.775100
#> 20   19 41.0220884 307.379518
#> 21   20 31.3694779 218.349398
#> 22   21 24.6104418 161.676707
#> 23   22 19.5722892 118.817269
#> 24   23 13.3795181  75.329317
```
