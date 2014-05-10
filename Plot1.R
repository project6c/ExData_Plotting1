tab5rows<-read.table("household_power_consumption.txt", header = TRUE, nrows = 5,sep = ";")
classes <-sapply(tab5rows,class)
data_assig<-read.table("household_power_consumption.txt", header = TRUE, nrows = 550000 ,colClasses = classes,sep = ";", na.strings = "?" )
data_assig$Date <-as.Date(data_assig$Date,format = "%d/%m/%Y")
data_work <-data_assig[data_assig$Date>="2007-02-01"&data_assig$Date<="2007-02-02",]
png(filename = "Plot1.png", height = 480, width = 480)
hist(data_work$Global_active_power, col = "red", xlab = "Global Active Power(Kilowatt)", main = "Global Active Power")
dev.off()