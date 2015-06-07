
#install and load 'lubridate' for date time conversion
install.packages("lubridate")
library("lubridate")

#read data
masterData <- read.table("C:\\Users\\201101102\\Downloads\\Resources\\Coursera\\Exploratory Data Analysis\\household_power_consumption.txt", sep = ";", header = TRUE)

#subset
data <- subset(masterData, masterData$Date == "1/2/2007" | masterData$Date == "2/2/2007")

#change it's class to 'date'
data$Date <- as.Date(data$Date , "%d/%m/%Y")

#change the class of these columns
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

#concatenate the date and time and put it in a new column
data <- cbind( data, "dateTime" = paste(data$Date, data$Time, sep = " "))

#change the class to POSIXct
data$dateTime <-ymd_hms(data$dateTime)

#export PNG
png(filename = "plot4.png", width = 480, height = 480, type = "cairo")

#setting global settings for charts and their margins
par(mfcol = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,1))

with(data, {
    
    #plot 1
    plot(x = dateTime,y = as.numeric(as.character(Global_active_power)), 
                type = "l", xlab = "", ylab = "Global Active Power")
    #plot 2
    plot(y = Sub_metering_1,x = dateTime, type = "l", xlab ="", 
         col = "gray2", ylab = "Energy sub metering")
    lines(y = Sub_metering_2,x = dateTime, type = "l", 
          col = "red")
    lines(y = Sub_metering_3,x = dateTime, type = "l", 
          col = "blue")
    legend("topright", lty = 1,cex = 1, col = c("gray2", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    #plot 3
    plot(x = dateTime,y = as.numeric(as.character(Voltage)), 
                type = "l", xlab = "datetime", ylab = "Voltage")
    #plot 4
    plot(x = dateTime,y = as.numeric(as.character(Global_reactive_power)), 
         type = "l", xlab = "datetime", ylab = "Global_reactive_power")

})

dev.off()
