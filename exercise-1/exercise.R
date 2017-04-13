# Exercise 1: Data Frame Practice

# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package

library('fueleconomy')
# You should have have access to the `vehicles` data.frame

View(vehicles)
# Create a data.frame of vehicles from 1997

is.data.frame(vehicles)
vehicles.1997 <- vehicles[vehicles$year >= 1997, ]

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame

unique(vehicles.1997$year)
# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
two_wheel <- vehicles[vehicles$drive == '2-Wheel Drive' & vehicles$cty > 20, ]

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?

worst_hwy <- two_wheel$id[two_wheel$hwy == min(two_wheel$hwy)]

# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year

Most_hwy_mpg <- function(year, make) {
  filtered <- vehicles[vehicles$year == year & vehicles$make == make,]
  return (filtered[filtered$hwy == max(filtered$hwy),])
}

# What was the most efficient honda model of 1995?

Most_hwy_mpg(1995, 'Honda')
