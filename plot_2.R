# Load and subset the data.
mydata <- read.table(".//data//household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
subdata <- subset(mydata, mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007")

# Open ".png" file for result.
png(filename = "plot_2.png", width = 480, height = 480)
# Plot the data.
plot(
  # "Global_active_power" is on the y axis, time and date on the x axis.
  # Concatenate "Date" and "Time" field and convert it to date.
  as.POSIXct(paste(subdata$Date, subdata$Time), format = "%d/%m/%Y %H:%M:%S"),
  subdata$Global_active_power,
  # Suppress x axis label.
  xlab = "",
  # Label y axis.
  ylab = "Global Active Power (kilowatts)",
  # Set type of plot to "lines".
  type = "l"
)
# Close writing to ".png" file.
dev.off()