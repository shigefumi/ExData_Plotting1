# Read data file "household_power_consumption.txt"
# in the current working directory
x <- read.table("household_power_consumption.txt",
                header=T, sep=";", na.strings="?",
                stringsAsFactors=F)

# Convert Date,Time format
x$Date <- as.Date(x$Date, "%d/%m/%Y")
x$Time <- strptime(paste(x$Date, x$Time), "%Y-%m-%d %H:%M:%S")

# Extract 2007-02-01 and 2007-02-02
x2 <- x[x$Date >= "2007-02-01" & x$Date <= "2007-02-02", ]

# Plot 1
png(file="plot1.png")

hist(x2$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red")

dev.off()
