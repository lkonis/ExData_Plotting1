data<-read.csv("household_power_consumption.txt", nrow=1, header = T, sep=";")
names=colnames(data)
# read two days period, starting from 2007-02-01
data<-read.table("household_power_consumption.txt", skip = 66637, nrow=24*60*2, sep=";", col.names=names)
print(names)

# make histogram plot 
png(filename = "plot1.png",    width = 480, height = 480)
hist(data$Global_active_power, col="orange", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()