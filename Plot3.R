tab5rows<-read.table("household_power_consumption.txt", header = TRUE, nrows = 5,sep = ";")
classes <-sapply(tab5rows,class)
data_assig<-read.table("household_power_consumption.txt", header = TRUE, nrows = 550000 ,colClasses = classes,sep = ";", na.strings = "?" )
data_assig$Date <-as.Date(data_assig$Date,format = "%d/%m/%Y")
data_work <-data_assig[data_assig$Date>="2007-02-01"&data_assig$Date<="2007-02-02",]
data_work$DateTime = strptime(paste(data_work$Date,data_work$Time), format = "%Y-%m-%d %H:%M:%S")
X<-data_work
png(filename = "Plot3.png", height = 480, width = 480)
plot(X$DateTime,X$Sub_metering_1, ylab = "Energy Sub Metering", xlab = " ",type = "l")
lines(X$DateTime,X$Sub_metering_2, col ="red")
lines(X$DateTime,X$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col =c("black", "red","blue"),lty = c("11", "solid"))
dev.off()