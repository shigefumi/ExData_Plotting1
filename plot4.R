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

x2$datetime <- x2$Time

# Set locale to English
Sys.setlocale("LC_TIME", "English")

# Plot 4
png(file="plot4.png")

par(mfrow=c(2,2))

with(x2, {
    plot(datetime, Global_active_power,
         type="l",
         xlab="", ylab="Global Active Power")
    
    plot(datetime, Voltage,
         type="l")
    
    plot(datetime, Sub_metering_1,
         col="black",
         type="l", ylim=c(0,38), ann=F)
    par(new=T)
    plot(datetime, Sub_metering_2,
         col="red",
         type="l", ylim=c(0,38), ann=F)
    par(new=T)
    plot(datetime, Sub_metering_3,
         col="blue",
         type="l", ylim=c(0,38), ann=F)
    title(ylab="Energy sub metering")
    legend("topright",
           lty="solid", bty="n",
           col=c("black", "red", "blue"),
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    plot(datetime, Global_reactive_power,
         type="l")
})

dev.off()
