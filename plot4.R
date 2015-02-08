
# Type this if you need to clear your workspace.
# rm(list=ls())

# Read the data; the file 'household_power_consumption.txt'
# should be in your working directory.
data <- read.table(file= "household_power_consumption.txt", header=TRUE, 
                              colClasses=c("character","character", 
                                           "numeric","numeric","numeric","numeric",
                                           "numeric","numeric","numeric"),
                              dec=".",
                              sep = ";", quote = "",
                              na.strings = "?",
                              strip.white=TRUE,
                              stringsAsFactors = FALSE)

# We only need the data for 1 and 2 Feb 2007.
data <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

#data <- data %>%
#      mutate(dateTime = paste(Date,Time)) 

dateTime  <- as.POSIXlt(strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S"))

# Plot4
# Change layout to two rows and two columns.
par(mfrow=c(2,2), cex=.50)

# 1st plot
plot(dateTime, data$Global_active_power, 
     type="l", ann=FALSE)
title(ylab="Global Active Power")

# 2nd plot
plot(dateTime, data$Voltage, 
     type="l", ann=FALSE)
title(xlab="datetime", ylab="Voltage")

# 3rd plot
plot(dateTime, data$Sub_metering_1, 
     type="l", ann=FALSE)
lines(dateTime, data$Sub_metering_2, col="red")
lines(dateTime, data$Sub_metering_3, col="blue")
legend("topright",
       c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "),
       col=c("black","red","blue"),
       y.intersp=.75,
       lty=c(1,1),
       bty="n")
title(ylab="Energy sub metering")

# 4th plot
plot(dateTime, data$Global_reactive_power, 
     type="l", ann=FALSE)
title(xlab="datetime", ylab="Global_reactive_power")

# Write the graph to a file. 
# The width and length are 480 pixels by default.
dev.copy(png, file="plot4.png")
dev.off()