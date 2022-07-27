plot3func <- function() {
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
      
      # remove other columns
      powerdata <- powerdata[,c(7:10)]
      
      # plot graph
      plot(powerdata[,4], powerdata[,1], type = "l", xlab = "", ylab = "Energy sub metering")
      lines(powerdata[,4],powerdata[,2], col = "red")
      lines(powerdata[,4],powerdata[,3], col = "blue")
      
      # add legend
      legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
             lty = c(1,1,1),
             col = c("black", "red", "blue")
      )
      
      # export plot as png
      dev.copy(png, file = "plot3.png")
      dev.off()
}

# plot graph (lattice method)
# xyplot(
#       Sub_metering_1 + Sub_metering_2 + Sub_metering_3 ~ powerdata[,4],
#       data = powerdata,
#       superpose = T,
#       col = c("black", "red", "blue"),
#       type = "l"
# )