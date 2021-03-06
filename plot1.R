plot1 <- function(){
  #Reading data
  completedata <- read.table("household_power_consumption.txt",skip=1,sep=";")
  #Naming the columns
  names(completedata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  #Subsetting Data
  subsetdata <- subset(completedata,completedata$Date=="1/2/2007" | completedata$Date =="2/2/2007")
  #Creating a histogram
  png("plot1.png", width=480, height=480)
  hist(as.numeric(as.character(subsetdata$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
  dev.off()
}
