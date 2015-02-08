
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

# Plot1
# Stricltly speaking, it is not necessary to 
# add the mfrow parameter, but this way we make
# sure that we have one single graph.

par(mfrow=c(1,1), cex=.75)

hist(data$"Global_active_power", col="red", 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)" )

# Write the graph to a file. 
# The width and length are 480 pixels by default.
dev.copy(png, file="plot1.png")
dev.off()