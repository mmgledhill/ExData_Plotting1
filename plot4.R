plot4 <-function(...) {
# to run code, 'source("plot4.r")', and run 'plot4()' function


#READ DATA

#data needed is in first 70000 rows
ind_power<-read.table("household_power_consumption.txt",header=TRUE,nrows=70000,colClasses=
c("character","character","numeric", "numeric","numeric","numeric","numeric","numeric","numeric"),sep=";",na.strings="?")

#Date column is in dd/mm/yyyy format
temp<-ind_power[ind_power$Date==as.character("1/2/2007") | ind_power$Date==as.character("2/2/2007") ,]

#mutate (dplyr) doesn't work with posixlt functions
temp$LongDate <- strptime(paste(as.character(temp$Date),as.character(temp$Time)),format="%d/%m/%Y %H:%M:%S")


###------------------------------------------
## plot 4
###------------------------------------------
par(mfrow=c(2,2))

#note adding %d to file name just creates mutliple files with index id #; use dev.print instead
#png(file="plot4.png",width=480, height=480)

#SUB PLOT 1,1
plot(temp$LongDate,temp$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")


#SUB PLOT 1,2
plot(temp$LongDate, temp$Voltage, xlab="datetime",ylab="Voltage",main="",type="l")


#SUB PLOT 2,1

plot(temp$LongDate,temp$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
points(temp$LongDate,temp$Sub_metering_2,type="l", col="red")
points(temp$LongDate,temp$Sub_metering_3,type="l", col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))

#SUB PLOT 2,2

plot(temp$LongDate, temp$Global_reactive_power, xlab="datetime",ylab="Global_reactive_power",main="",type="l")
dev.print(png,file="plot4.png",width=480,height=480)


}