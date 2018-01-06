library(lubridate)
# read in the data to be used, format Dates and Times
power_consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
power_consumption[,1] <- dmy(power_consumption[,1])
power_consumption[,2] <- hms(power_consumption[,2])

# Get only 2007-02-01 and 2007-02-02
power_consumption <- power_consumption[power_consumption$Date == mdy("2/1/2007") | power_consumption$Date == mdy("2/2/2007"),]

# Format the other columns
power_consumption[,3] <- as.numeric(power_consumption[,3])
power_consumption[,4] <- as.numeric(power_consumption[,4])
power_consumption[,5] <- as.numeric(power_consumption[,5])
power_consumption[,6] <- as.numeric(power_consumption[,6])
power_consumption[,7] <- as.numeric(power_consumption[,7])
power_consumption[,8] <- as.numeric(power_consumption[,8])
power_consumption[,9] <- as.numeric(power_consumption[,9])

png(file = "plot1.png")
hist(power_consumption$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()