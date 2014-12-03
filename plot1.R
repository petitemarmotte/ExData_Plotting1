# Construction of the first plot

# First we need to load the data into R
# (given that the data is in the working directory)
# we need to specify sep = ";" so that R can understand the file

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 71000)

# Now we need to keep only the dates that interest us
# But we first need to convert the column Date to proper date objects
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- data[(data$Date == "2007-02-01")|(data$Date == "2007-02-02"), ]

# We also need to convert the column we want to plot, since R reads it as "factors"
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))


# We open the graphic device png for our future plot

png(filename = "plot1.png")

# We now use the hist function to create our histogram

hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# We can now close the graphic device

dev.off()
