household<-read.table("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE)
household$Date<-as.Date(household$Date,format="%d/%m/%Y")
household$Time<-strptime(household$Time,format = "%H:%M:%S")
plot1<-subset(household,household$Date=="2007-02-01"|household$Date=="2007-02-02")
Global_avtive_power<-plot1$Global_active_power
Global_avtive_power<-as.numeric(Global_avtive_power)
png("plot1.png",width = 480,height = 480)
hist(Global_avtive_power,col="red",xlab = "Global Active Power (killowatts)",main = "Global Active Power")
dev.off()