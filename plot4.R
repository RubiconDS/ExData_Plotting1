##
## Coursera: Exploratory-data-analysis Peer-graded Assignment: Course Project 1 - Plot 4
## Author: Gabriel Paredes
## Version: 1.0
##

# Loads the required library
library(sqldf)
library(lubridate)

# Reads ata from the dates 2007-02-01 and 2007-02-02
hpc_df <- read.csv.sql("household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ", sep=";")

# Sets de layout for 2 Rows and 2 Columns
par(mfcol = c(2, 2))

## First Plot 
plot(dmy(hpc_df$Date) + hms(hpc_df$Time), hpc_df$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

## Second Plot
# Construct the base plot for Sub_metering_1
plot(dmy(hpc_df$Date) + hms(hpc_df$Time), hpc_df$Sub_metering_1, type = "l", ylab = "Energy Sub metering", xlab = "")

# Adds the lines for Sub_metering_2
lines(dmy(hpc_df$Date) + hms(hpc_df$Time), hpc_df$Sub_metering_2, col = "red")

# Adds the lines for Sub_metering_3
lines(dmy(hpc_df$Date) + hms(hpc_df$Time), hpc_df$Sub_metering_3, col = "blue")

# Construct the plot legend
legend("topright", legend = grep("^Sub", names(hpc_df), value = TRUE), col = c("black", "red", "blue"), lty = 1, bty = "n", cex = 0.75)

## Third Plot
plot(dmy(hpc_df$Date) + hms(hpc_df$Time), hpc_df$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

## Fourth Plot
plot(dmy(hpc_df$Date) + hms(hpc_df$Time), hpc_df$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

# Save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
dev.copy(png, filename = "plot4.png", width = 480, height = 480, units = "px")

# Close the GD
dev.off()