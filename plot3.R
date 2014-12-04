#Construction of the second plot

# We start by reading the data and converting Date and Time from factors to strings
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 71000)
data$Date <- as.character(data$Date)
data$Time <- as.character(data$Time)

# Now we select the rows we want to keep
data <- data[(data$Date == "1/2/2007")|(data$Date == "2/2/2007"), ]

# Create a new vector containing the time dates as strings
dateTimes <- mapply(paste, data$Date, data$Time, SIMPLIFY = FALSE)

# We convert this vector from strings to time-dqte objects
dateTimes <- strptime(dateTimes, format = "%d/%m/%Y %H:%M:%S")

# We convert the sub-metering values from factors to real numbers
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
# We create the file in which we want to store our plot and plot it
png(filename = "plot3.png")

plot(dateTimes, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dateTimes, data$Sub_metering_2, col = "red")
lines(dateTimes, data$Sub_metering_3, col = "blue")

# We add the legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), pch = "_")
dev.off()