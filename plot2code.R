data = read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
head(data)
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
head(subSetData)
dim(subSetData)
names(subSetData)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
plot2 <- function() {
  plot(datetime,globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.copy(png, file="plot2.png", width=480, height=480)
  dev.off()
  cat("plot2.png has been saved in", getwd())
}
plot2()
