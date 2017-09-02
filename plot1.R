# open the full file
hh <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", stringsAsFactors = FALSE)
#format the Date field as date
hh$Date <- as.Date(hh$Date, format = "%d/%m/%Y")

#subset the dates from 1/2/2007 till 2/2/2007
hhfeb <- subset(hh, Date >= "2007-02-01" & Date <= "2007-02-02")
hhfeb$Global_active_power <- as.numeric(hhfeb$Global_active_power)

#open PNG device
png(filename = "plot1.png")

#plot the histogram with title Global Active Power and x-axis Global Active Power (kilowatts)
hist(hhfeb$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

#close device PNG
dev.off()
