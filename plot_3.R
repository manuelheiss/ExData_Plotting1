# Load and subset the data.
mydata <- read.table(".//data//household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
subdata <- subset(mydata, mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007")

# Open ".png" file for result.
png(filename = "plot_3.png", width = 480, height = 480)
# Plot the data.
plot(
  # "Sub_metering_1" is on the y axis, time and date on the x axis.
  # Concatenate "Date" and "Time" field and convert it to date.
  as.POSIXct(paste(subdata$Date, subdata$Time), format = "%d/%m/%Y %H:%M:%S"),
  subdata$Sub_metering_1,
  # Suppress x axis label.
  xlab = "",
  # Label y axis.
  ylab = "Energy sub metering",
  # Set type of plot to "lines".
  type = "l"
)
# Add line for "Sub_metering_2" variable in red.
lines(as.POSIXct(paste(subdata$Date, subdata$Time), format = "%d/%m/%Y %H:%M:%S"), subdata$Sub_metering_2, col = "red", type = "l")
# Add line for "Sub_metering_3" variable in blue.
lines(as.POSIXct(paste(subdata$Date, subdata$Time), format = "%d/%m/%Y %H:%M:%S"), subdata$Sub_metering_3, col = "blue", type = "l")
# Add legend to plot.
legend(
  # Put legend to the top right corner.
  "topright",
  # Set line type to 1.
  lty = 1,
  # Set colors according to plots as black, red and blue.
  col = c("black", "red", "blue"),
  # Finally add the actual legend text.
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)
# Close writing to ".png" file.
dev.off()