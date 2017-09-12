data = read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
head(data)
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)
plot4 <- function() {
  par(mfrow=c(2,2))
  
  ##PLOT 1
  plot(datetime,globalActivePower, type="l", xlab="", ylab="Global Active Power")
  ##PLOT 2
  plot(datetime,voltage, type="l", xlab="datetime", ylab="Voltage")
  
  ##PLOT 3
  plot(datetime,subMetering1, type="l", xlab="", ylab="Energy sub metering")
  lines(datetime,subMetering2,col="red")
  lines(datetime,subMetering3,col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) 
  
  #PLOT 4
  plot(datetime,globalActivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  #OUTPUT
  dev.copy(png, file="plot4.png", width=480, height=480)
  dev.off()
  cat("plot4.png has been saved in", getwd())
}
plot4()
