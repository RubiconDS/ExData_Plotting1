##
## Coursera: Exploratory-data-analysis Peer-graded Assignment: Course Project 1 - Plot 2
## Author: Gabriel Paredes
## Version: 1.0
##

# Loads the required library
library(sqldf)
library(lubridate)

# Reads ata from the dates 2007-02-01 and 2007-02-02
hpc_df <- read.csv.sql("household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ", sep=";")

# Construct the plot
plot(dmy(hpc_df$Date) + hms(hpc_df$Time), hpc_df$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# Save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
dev.copy(png, filename = "plot2.png", width = 480, height = 480, units = "px")

# Close the GD
dev.off()