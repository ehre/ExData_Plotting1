# Exploratory Data Analysis course (Coursera/Johns Hopkins), Project 1.
# Code to render Plot 4 in the assignment.
# Assumption:
# The “Individual household electric power consumption Data Set” was downloaded from
# the course website and unzipped to the working directory.

# ------------------------------------------
## Preparation of the data (for all four plots) ##

# Read the raw data into R.
temp  <- read.table("household_power_consumption.txt", header= TRUE, sep = ";",
                    na.strings="?", stringsAsFactors = FALSE)

# Subset only the two days specified in the assignment.
workset <- subset(temp, (Date == "1/2/2007" | Date == "2/2/2007"))

# Paste dates and times, and convert to POSIXlt.
workset$DateTime <- paste(workset$Date, workset$Time)
workset$DateTime <- strptime(workset$DateTime, "%d/%m/%Y %H:%M:%S")

# Set locale to get weekdays in English (for non-English systems)
Sys.setlocale("LC_TIME", "en_US")

# ------------------------------------------
## Create Plot 4 ##

# Open PNG device, create file.
png(file = "plot4.png")
# Render plot 4
# Set up canvas
par(mfrow = c(2, 2))
# Plot 4a
with(workset, plot(DateTime, Global_active_power, type = "l",
                   ylab = "Global Active Power", xlab = ""))
#Plot 4b
with(workset, plot(DateTime, Voltage, type = "l",
                   xlab = "datetime"))
#Plot 4c
with(workset, plot(DateTime, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = ""))
with(workset, lines(DateTime, Sub_metering_1, col = "black"))
with(workset, lines(DateTime, Sub_metering_2, col = "red"))
with(workset, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", bty = "n", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Plot 4d
with(workset, plot(DateTime, Global_reactive_power, type = "l",
                   xlab = "datetime"))
# Close PNG device.
dev.off()
