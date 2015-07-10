household<-read.table("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE)
household$Date<-as.Date(household$Date,format="%d/%m/%Y")
household$Time<-strptime(household$Time,format = "%H:%M:%S")
plot1<-subset(household,household$Date=="2007-02-01"|household$Date=="2007-02-02")
png("plot4.png",width = 480,height = 480)
par(mfrow=c(2,2))
#plot1
plot(plot1$Global_active_power,xaxt="n",type = "l",ylab = "Global Active Power")
axis(side = 1,at=c(1,1441,2881),labels = c("Thu","Fri","Sat"))
#plot2
plot(plot1$Voltage,xaxt="n",type = "l",xlab = "datetime",ylab="Voltage")
axis(side = 1,at=c(1,1441,2881),labels = c("Thu","Fri","Sat"))
#plot3
Sub_metering_no<-cbind(plot1$Sub_metering_1,plot1$Sub_metering_2,plot1$Sub_metering_3)
matplot(Sub_metering_no, type = "l",lty=1,col = c("black","red","blue"),xaxt="n",ylab="Energy Sub Metering") 
axis(side = 1,at=c(1,1441,2881),labels = c("Thu","Fri","Sat"))
legend("topright",col = c("black","red","blue"),lty = 1,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#plot4
plot(plot1$Global_reactive_power,xaxt="n",type = "l",xlab = "datetime",ylab="Global_reactive_power")
axis(side = 1,at=c(1,1441,2881),labels = c("Thu","Fri","Sat"))

dev.off()