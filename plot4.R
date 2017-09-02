# open the full file
hh <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", stringsAsFactors = FALSE)
#format the Date field as date
hh$Date <- as.Date(hh$Date, format = "%d/%m/%Y")


#subset the dates from 1/2/2007 till 2/2/2007
hhfeb <- subset(hh, Date >= "2007-02-01" & Date <= "2007-02-02")
hhfeb$Sub_metering_1 <- as.numeric(hhfeb$Sub_metering_1)
hhfeb$Sub_metering_2 <- as.numeric(hhfeb$Sub_metering_2)
hhfeb$Sub_metering_3 <- as.numeric(hhfeb$Sub_metering_3)
hhfeb$Global_active_power <- as.numeric(hhfeb$Global_active_power)
hhfeb$Time <- as.POSIXct(paste(hhfeb$Date, hhfeb$Time))

#open PNG device
png(filename = "plot4.png")

#plot the chart for 3 sub_metering with different colors
par(mfrow = c(2,2))
plot(hhfeb$Time, hhfeb$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(hhfeb$Time, hhfeb$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(hhfeb$Time, hhfeb$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black") 
points(hhfeb$Time, hhfeb$Sub_metering_2, type = "l", col = "red")
points(hhfeb$Time, hhfeb$Sub_metering_3, type = "l", col = "blue")
legend("topright", names(hhfeb[7:9]), lwd = 2, col = c("black","red","blue"), bty = "n")
plot(hhfeb$Time, hhfeb$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

#close device PNG
dev.off()