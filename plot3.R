plot3 <- function(){
  #Reading data
  completedata <- read.table("household_power_consumption.txt",skip=1,sep=";")
  #Naming the columns
  names(completedata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  #Subsetting Data
  subsetdata <- subset(completedata,completedata$Date=="1/2/2007" | completedata$Date =="2/2/2007")
  #Converting the data type for both date and time variables
  subsetdata$DateTime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
  subsetdata$Global_active_power <-as.numeric(subsetdata$Global_active_power)
  subsetdata$Sub_metering_1 <- as.numeric(subsetdata$Sub_metering_1)
  subsetdata$Sub_metering_2 <- as.numeric(subsetdata$Sub_metering_2)
  subsetdata$Sub_metering_3<- as.numeric(subsetdata$Sub_metering_3)
  # Plotting
  png("plot3.png", width=480, height=480)
  with(subsetdata, plot(DateTime, Sub_metering_1, type="l", ylab="Energy Submetering", xlab=""))
  with(subsetdata, lines(DateTime, Sub_metering_2, type="l", col="red"))
  with(subsetdata, lines(DateTime, Sub_metering_3, type="l", col="blue"))
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.off()
}