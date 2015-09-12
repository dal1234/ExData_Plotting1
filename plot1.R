# plot1

# Read in data
p <- read.table('household_power_consumption.txt', header = TRUE, sep = ";")

# Prep data
p$Date <- as.Date(p$Date, '%d/%m/%Y')
p <- p[p$Date == '2007-02-01' | p$Date == '2007-02-02',]
p$GAP <- as.numeric(levels(p$Global_active_power))[p$Global_active_power]

# Make chart
png(filename="plot1.png", width = 480, height = 480, units = "px")

hist(p$GAP, breaks =seq(0,7.5,by = 0.5),
   	 col = 'Red',
     main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)')

dev.off()