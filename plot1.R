##
## Coursera: Exploratory-data-analysis Peer-graded Assignment: Course Project 1 - Plot 1
## Author: Gabriel Paredes
## Version: 1.0
##

# Loads the required library
library(sqldf)

# Reads ata from the dates 2007-02-01 and 2007-02-02
hpc_df <- read.csv.sql("household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ", sep=";")

# Construct the plot
hist(hpc_df$Global_active_power , col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
dev.copy(png, filename = "plot1.png", width = 480, height = 480, units = "px")

# Close the GD
dev.off()

