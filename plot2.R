# plot2

# Read in data
p <- read.table('household_power_consumption.txt', header = TRUE, sep = ";")

# Prep data
p$Date <- as.Date(p$Date, '%d/%m/%Y')
p <- p[p$Date == '2007-02-01' | p$Date == '2007-02-02',]
p$GAP <- as.numeric(levels(p$Global_active_power))[p$Global_active_power]

# Make chart
png(filename="plot2.png", width = 480, height = 480, units = "px")

plot(p$GAP,type="l", axes=F, , xlab="", ylab="Global Active Power (kilowatts)")
box()
axis(1, at = c(0,1500,2900), labels = c('Thu', 'Fri', 'Sat'))
axis(2)

dev.off()

