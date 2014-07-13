##read in the data
josival <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, 
                      sep = ";", colClasses="character",
                      col.names = colnames(read.table("household_power_consumption.txt",
                                                      nrow = 1, header = TRUE, sep=";")))
##put NA 
josival[josival == "?"] = NA

##put as numeric  
josival$Global_active_power = as.numeric(as.character(josival$Global_active_power))

png(file="plot3.png",width=480,height=480)  

##Combine DateTime
josival$DateTime = (paste(josival$Date, josival$Time))
josival$DateTime = strptime(josival$DateTime, format = "%d/%m/%Y %H:%M:%S")


##plot
par(mfrow = c(1,1)) 

plot(josival$DateTime, josival$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")

##lines
lines(josival$DateTime, josival$Sub_metering_1)
lines(josival$DateTime, josival$Sub_metering_2, col= "red")
lines(josival$DateTime, josival$Sub_metering_3, col= "blue")

##legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1), 
       col = c("black","red", "blue")) 
##close
dev.off()
