## Exploratory Data Analysis Class Week 1 Peer Graded Assignment
## Plot 4
## to source this file:
## source(file.path("ExploratoryWeek1Assign", "plot4.R"))

#load libraries needed for this script:
library(lubridate)

## Read in data
fdir <- file.path(getwd(), "ExploratoryWeek1Assign")
f <- file.path(fdir, "household_power_consumption.txt")
elec <- read.table(f, header = TRUE, sep = ";", na.strings = "?")

## Add a column with a combined Date and Time in POSIXct class
elec <- cbind(DateTime = dmy_hms(paste(elec$Date, elec$Time, sep = " ")), elec)

## Subset only records within desired dates
elec <- subset(elec, ((year(DateTime) >= 2007 & month(DateTime) >= 2 & mday(DateTime) >= 1) & (year(DateTime) <= 2007 & month(DateTime) <= 2 & mday(DateTime) <= 2)))

## Open a png file
fname <- file.path(fdir, "plot4.png")
png(filename = fname, width = 480, height = 480, units = "px")

## Set up for 4 plots 2x2 columnwise:
par(mfcol = c(2,2))

## Plot 1:
plot(elec$DateTime, elec$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power")
lines(elec$DateTime, elec$Global_active_power)

## Plot 2:
plot(elec$DateTime, elec$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(elec$DateTime, elec$Sub_metering_1, col = "black")
lines(elec$DateTime, elec$Sub_metering_2, col = "red")
lines(elec$DateTime, elec$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1 ,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

## Plot 3:
plot(elec$DateTime, elec$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
lines(elec$DateTime, elec$Voltage)

## Plot 4:
plot(elec$DateTime, elec$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power")
lines(elec$DateTime, elec$Global_reactive_power)
dev.off()

## Added feature - return elec variable to console for any additional needed analysis by user
elec
