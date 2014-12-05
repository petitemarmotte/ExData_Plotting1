#Construction of the fourth plot

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

# We convert the values we're interested in from factors to real numbers
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

# We create the file in which we want to store our plots and plot them
png("plot4.png")

par(mfrow = c(2,2)) # We specify we want 4 graphs presented in 2 rows and 2 columns

# upper-left graph plotting
plot(dateTimes, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
# upper-right
plot(dateTimes, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
# lower-left with the 3 sets of values and a legend
# we use "dty = "n"" to remove the box around the legend
plot(dateTimes, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dateTimes, data$Sub_metering_2, col = "red")
lines(dateTimes, data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), pch = "_", bty = "n")
#lower-right graph
plot(dateTimes, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# turning off the png device
dev.off()

