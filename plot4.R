plot4func <- function() {
      # load dyplr library
      library(dplyr)
      
      # Read txt file, format to table
      powerdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, dec = ".")
      
      # Filter data relevant to dates (2007-02-01 and 2007-02-02 only)
      powerdata <- powerdata %>% filter(Date == "1/2/2007" | Date == "2/2/2007")
      
      # Concatenate Date & Time column
      powerdata[,10] <- paste(powerdata[,1], powerdata[,2])
      
      # Convert Dates & values
      powerdata[,10] <- as.POSIXct(powerdata[,10], format = "%d/%m/%Y %H:%M:%S")
      
      ## Multiple Graph Setup
      par(mfrow = c(2,2))
      
      ## Graph 1
      plot(powerdata[,10], powerdata[,3], type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", main = "")
      
      ## Graph 2
      plot(powerdata[,10], powerdata[,5], type = "l", xlab = "datetime", ylab = "Voltage")
      
      ## Graph 3
      plot(powerdata[,10], powerdata[,7], type = "l", xlab = "", ylab = "Energy sub metering")
      lines(powerdata[,10], powerdata[,8], col = "red")
      lines(powerdata[,10], powerdata[,9], col = "blue")
      
      # add legend
      legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
             lty = c(1,1,1),
             col = c("black", "red", "blue")
      )
      
      ## Graph 
      plot(powerdata[,10], powerdata[,4], type = "l", xlab = "datetime", ylab = "Global_reactive_power")
      
      # export plot as png
      dev.copy(png, file = "plot4.png")
      dev.off()
}