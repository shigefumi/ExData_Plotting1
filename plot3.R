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

# Set locale to English
Sys.setlocale("LC_TIME", "English")

# Plot 3
png(file="plot3.png")

with(x2, {
    plot(Time, Sub_metering_1,
         col="black",
         type="l", ylim=c(0,38), ann=F)
    par(new=T)
    plot(Time, Sub_metering_2,
         col="red",
         type="l", ylim=c(0,38), ann=F)
    par(new=T)
    plot(Time, Sub_metering_3,
         col="blue",
         type="l", ylim=c(0,38), ann=F)
    title(ylab="Energy sub metering")
    legend("topright",
           lty="solid",
           col=c("black", "red", "blue"),
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

dev.off()
