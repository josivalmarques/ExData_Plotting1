##read in the data
josival <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, 
                      sep = ";", colClasses="character",
                      col.names = colnames(read.table("household_power_consumption.txt",
                                                      nrow = 1, header = TRUE, sep=";")))
## put NA 
josival[josival == "?"] = NA

##put as numeric  
josival$Global_active_power = as.numeric(as.character(josival$Global_active_power))

png(file="plot2.png",width=480,height=480)  

##Combine DateTime
josival$DateTime = (paste(josival$Date, josival$Time))
josival$DateTime = strptime(josival$DateTime, format = "%d/%m/%Y %H:%M:%S")


##plot the second plot2 with variable Global_active_power
plot(josival$DateTime, josival$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

##turn off device
dev.off()
