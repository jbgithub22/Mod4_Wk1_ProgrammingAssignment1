plot2func <- function() {
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
      powerdata[,3] <- as.numeric(powerdata[,3])
      
      # plot graph
      plot(powerdata[,10], powerdata[,3], type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", main = "")
      
      # export plot as png
      dev.copy(png, file = "plot2.png")
      dev.off()
}