# Exploratory Data Analysis course (Coursera/Johns Hopkins), Project 1.
# Code to render Plot 1 in the assignment.
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
## Create Plot 1 ##

# Open PNG device, create file.
png(file = "plot1.png")
# Render plot 1
hist(workset$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
# Close PNG device.
dev.off()
