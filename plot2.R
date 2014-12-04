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

# We know convert the global active power values from factors to real numbers
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

# We create the file in which we want to store our plot and plot it
png(filename = "plot2.png")
plot(dateTimes, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()