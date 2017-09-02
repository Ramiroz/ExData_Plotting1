# open the full file
hh <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", stringsAsFactors = FALSE)
#format the Date field as date
hh$Date <- as.Date(hh$Date, format = "%d/%m/%Y")

#subset the dates from 1/2/2007 till 2/2/2007
hhfeb <- subset(hh, Date >= "2007-02-01" & Date <= "2007-02-02")
hhfeb$Global_active_power <- as.numeric(hhfeb$Global_active_power)
hhfeb$Time <- as.POSIXct(paste(hhfeb$Date, hhfeb$Time))

#open PNG device
png(filename = "plot2.png")

#plot the histogram with title Global Active Power and x-axis Global Active Power (kilowatts)
plot(hhfeb$Time, hhfeb$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#close device PNG
dev.off()