data<-read.csv("household_power_consumption.txt", nrow=1, header = T, sep=";")
names=colnames(data)
# read two days period, starting from 2007-02-01
data<-read.table("household_power_consumption.txt", skip = 66637, nrow=24*60*2, sep=";", col.names=names)

days = c("Thu", "Fri", "Sat")
N = length(data$Date)
# make plot
png(filename = "plot4.png",    width = 480, height = 480)
par(mfrow=c(2,2))
# top left
plot(data$Global_active_power,  xaxt = "n", type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
axis(1, at=c(1,round(N/2),N-10), labels=days)

# top right
plot(data$Voltage,  xaxt = "n", type="l", ylab = "Voltage", xlab = "datetime")
axis(1, at=c(1,round(N/2),N-10), labels=days)

# bottom left
plot(data$Sub_metering_1,  xaxt = "n", type="l", ylab = "Energy sub metering", xlab = "")
points(data$Sub_metering_2,  xaxt = "n", type="l", ylab = "Energy sub metering", xlab = "", col="red")
points(data$Sub_metering_3,  xaxt = "n", type="l", ylab = "Energy sub metering", xlab = "", col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), pch="_")
axis(1, at=c(1,round(N/2),N-10), labels=days)

# bottom right
plot(data$Global_reactive_power,  xaxt = "n", type="l", ylab = "Global reactive power", xlab = "datetime")
axis(1, at=c(1,round(N/2),N-10), labels=days)
dev.off()
