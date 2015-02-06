data<-read.csv("household_power_consumption.txt", nrow=1, header = T, sep=";")
names=colnames(data)
# read two days period, starting from 2007-02-01
data<-read.table("household_power_consumption.txt", skip = 66637, nrow=24*60*2, sep=";", col.names=names)

days = c("Thu", "Fri", "Sat")
N = length(data$Date)
# make plot
png(filename = "plot2.png",    width = 480, height = 480)
plot(data$Global_active_power,  xaxt = "n", type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
axis(1, at=c(1,round(N/2),N-10), labels=days)
dev.off()
