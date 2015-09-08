# Exploratory Data Analysis course (Coursera/Johns Hopkins), Project 1.
# Code to render Plot 3 in the assignment.
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
## Create Plot 3 ##

# Open PNG device, create file.
png(file = "plot3.png")
# Render plot 3
with(workset, plot(DateTime, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = ""))
with(workset, lines(DateTime, Sub_metering_1, col = "black"))
with(workset, lines(DateTime, Sub_metering_2, col = "red"))
with(workset, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# Close PNG device.
dev.off()
