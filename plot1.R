
#read data
 masterData <- read.table("C:\\Users\\201101102\\Downloads\\Resources\\Coursera\\Exploratory Data Analysis\\household_power_consumption.txt", sep = ";", header = TRUE)

 #subset
 data <- subset(masterData, masterData$Date == "1/2/2007" | masterData$Date == "2/2/2007")
 
 #change class to 'date'
 data$Date <- as.Date(data$Date , "%d/%m/%Y")
 
 #export png
 png(filename = "plot1.png", width = 480, height = 480, type = "cairo")
 
 #create the histogram
 hist(as.numeric(as.character(data$Global_active_power)), 
      freq = TRUE, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", 
      main = "Global Active Power", col = 2)
 
 dev.off()
 
 

 
