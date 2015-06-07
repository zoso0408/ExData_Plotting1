
#install and load 'lubridate' for date time conversion
install.packages("lubridate")
library("lubridate")

#read data
masterData <- read.table("C:\\Users\\201101102\\Downloads\\Resources\\Coursera\\Exploratory Data Analysis\\household_power_consumption.txt", sep = ";", header = TRUE)

#subset
data <- subset(masterData, masterData$Date == "1/2/2007" | masterData$Date == "2/2/2007")

#change class to 'date'
data$Date <- as.Date(data$Date , "%d/%m/%Y")

#concatenate the date and time and put it in a new column
data <- cbind( data, "dateTime" = paste(data$Date, data$Time, sep = " "))

#change the class to POSIXct
data$dateTime <-ymd_hms(data$dateTime)

#export PNG
png(filename = "plot2.png", width = 480, height = 480, type = "cairo")

#plot
plot(x <- data$dateTime,y <- as.numeric(as.character(data$Global_active_power)), 
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()

