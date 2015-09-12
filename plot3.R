# plot3

# Read in data
p <- read.table('household_power_consumption.txt', header = TRUE, sep = ";")

# Prep data
p$Date <- as.Date(p$Date, '%d/%m/%Y')
p <- p[p$Date == '2007-02-01' | p$Date == '2007-02-02',]
p$GAP <- as.numeric(levels(p$Global_active_power))[p$Global_active_power]
p$SM1 <- as.numeric(levels(p$Sub_metering_1))[p$Sub_metering_1]
p$SM2 <- as.numeric(levels(p$Sub_metering_2))[p$Sub_metering_2]

# Make chart
png(filename="plot3.png", width = 480, height = 480, units = "px")

plot(p$SM1,type="l", axes=F, , xlab="", ylab="Energy sub metering")
lines(p$SM2, col = "Red")
lines(p$Sub_metering_3, col = "Blue")
box()
axis(1, at = c(0,1450,2900), labels = c('Thu', 'Fri', 'Sat'))
axis(2)
legend("topright", col = c("Black", "Red", "Blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)

dev.off()
