## Exploratory Data Analysis Class Week 1 Peer Graded Assignment
## Plot 1
## to source this file:
## source(file.path("ExploratoryWeek1Assign", "plot1.R"))

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
fname <- file.path(fdir, "plot1.png")
png(filename = fname, width = 480, height = 480, units = "px")
hist(elec$Global_active_power, main = "Global Active Power", col = "red", xlab = "Glocal Active Power (kilowatts)")
dev.off()

## Added feature - return elec variable to console for any additional needed analysis by user
elec
