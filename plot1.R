plot1func <- function() {
      # load dyplr library
      library(dplyr)
      
      # Read txt file, format to table
      powerdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, dec = ".")
      
      # Filter data relevant to dates (2007-02-01 and 2007-02-02 only)
      powerdata <- powerdata %>% filter(Date == "1/2/2007" | Date == "2/2/2007")
      
      # Convert Dates & values
      powerdata[,1] <- as.Date(powerdata[,1])
      powerdata[,3] <- as.numeric(powerdata[,3])
      
      # plot graph
      hist(powerdata[,3], col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
      
      # export plot as png
      dev.copy(png, file = "plot1.png")
      dev.off()
}