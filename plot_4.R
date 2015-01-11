# Load and subset the data.
mydata <- read.table(".//data//household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
subdata <- subset(mydata, mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007")

# Open ".png" file for result.
png(filename = "plot_4.png", width = 480, height = 480)
# We want 4 plots.
par (mfrow = c(2,2))
# Top left plot.
plot(
  as.POSIXct(paste(subdata$Date, subdata$Time), format = "%d/%m/%Y %H:%M:%S"),
  subdata$Global_active_power,
  xlab = "",
  ylab = "Global Active Power",
  type = "l"
)
# Top right plot.
plot(
  as.POSIXct(paste(subdata$Date, subdata$Time),format = "%d/%m/%Y %H:%M:%S"),
  subdata$Voltage,
  xlab = "datetime",
  ylab = "Voltage",
  type = "l"
)
# Bottom left plot.
plot(as.POSIXct(paste(subdata$Date, subdata$Time), format = "%d/%m/%Y %H:%M:%S"), subdata$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
lines(as.POSIXct(paste(subdata$Date, subdata$Time), format = "%d/%m/%Y %H:%M:%S"), subdata$Sub_metering_2, type = "l", col = "red")
lines(as.POSIXct(paste(subdata$Date, subdata$Time), format = "%d/%m/%Y %H:%M:%S"), subdata$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
# Bottom right plot.
plot(
  as.POSIXct(paste(subdata$Date, subdata$Time), format = "%d/%m/%Y %H:%M:%S"),
  subdata$Global_reactive_power,
  xlab = "datetime",
  ylab = "Global_reactive_power",
  type = "l"
)
# Close writing to ".png" file.
dev.off()