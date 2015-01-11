# Load and subset the data.
mydata <- read.table(".//data//household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
subdata <- subset(mydata, mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007")

# Open ".png" file for result.
png(filename = "plot_1.png", width = 480, height = 480)
# Make a histogram of the data...
hist(
  # ... for "Global_active_power" variable.
  subdata$Global_active_power,
  # Set color of the  to red.
  col = "red",
  # Set the title of the histogram.
  main = "Global Active Power",
  # Label x axis.
  xlab = "Global Active Power (kilowatts)"
)
# Close writing to ".png" file.
dev.off()