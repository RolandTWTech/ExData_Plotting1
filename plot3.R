## Exploratory Data Analysis Class Week 1 Peer Graded Assignment
## Plot 3
## to source this file:
## source(file.path("ExploratoryWeek1Assign", "plot3.R"))

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

## Open a png file and write desired plot
fname <- file.path(fdir, "plot3.png")
png(filename = fname, width = 480, height = 480, units = "px")
plot(elec$DateTime, elec$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(elec$DateTime, elec$Sub_metering_1, col = "black")
lines(elec$DateTime, elec$Sub_metering_2, col = "red")
lines(elec$DateTime, elec$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1 ,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

## Added feature - return elec variable to console for any additional needed analysis by user
elec
