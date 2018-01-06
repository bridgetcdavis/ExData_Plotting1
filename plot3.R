library(lubridate)
library(dplyr)
# read in the data to be used, format Dates and Times
power_consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
power_consumption <- power_consumption[power_consumption$Date == "1/2/2007" | power_consumption$Date == "2/2/2007",]
power_consumption <- mutate(power_consumption, DateTime = dmy_hms(paste(Date,Time)))
power_consumption <- select(power_consumption, DateTime, Global_active_power, Global_reactive_power, Voltage,
                            Global_intensity, Sub_metering_1, Sub_metering_2, Sub_metering_3)

# Get only 2007-02-01 and 2007-02-02

# Format the other columns
power_consumption[,3] <- as.numeric(power_consumption[,3])
power_consumption[,4] <- as.numeric(power_consumption[,4])
power_consumption[,5] <- as.numeric(power_consumption[,5])
power_consumption[,6] <- as.numeric(power_consumption[,6])
power_consumption[,7] <- as.numeric(power_consumption[,7])
power_consumption[,8] <- as.numeric(power_consumption[,8])
power_consumption[,9] <- as.numeric(power_consumption[,9])

png(file = "plot3.png")
with(power_consumption, plot(DateTime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(power_consumption, lines(DateTime, Sub_metering_1, col = "black"))
with(power_consumption, lines(DateTime, Sub_metering_2, col = "red"))
with(power_consumption, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", col = c("black", "red", "blue"), lty = c(1,1), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()