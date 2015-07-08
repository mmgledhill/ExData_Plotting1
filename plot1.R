plot1<-function(...) {
# to run code, 'source("plot1.r")', and run 'plot1()' function

#READ DATA
#data needed is in first 70000 rows
ind_power<-read.table("household_power_consumption.txt",header=TRUE,nrows=70000,colClasses=
c("character","character","numeric", "numeric","numeric","numeric","numeric","numeric","numeric"),sep=";",na.strings="?")

#Date column is in dd/mm/yyyy format
temp<-ind_power[ind_power$Date==as.character("1/2/2007") | ind_power$Date==as.character("2/2/2007") ,]

#mutate (dplyr) doesn't work with posixlt functions
temp$LongDate <- strptime(paste(as.character(temp$Date),as.character(temp$Time)),format="%d/%m/%Y %H:%M:%S")

##---------------------------------------------------
## PLOT 1 HISTOGRAM
##---------------------------------------------------

png(file="plot1.png",width=480, height=480)
hist(temp$Global_active_power,col="red",xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
dev.off()

}