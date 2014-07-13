##read in the data
josival <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, 
                      sep = ";", colClasses="character",
                      col.names = colnames(read.table("household_power_consumption.txt",
                                                      nrow = 1, header = TRUE, sep=";")))
## put NA 
josival[josival == "?"] = NA

##put as numeric  
josival$Global_active_power = as.numeric(as.character(josival$Global_active_power))

##plot1 
png(file="plot1.png",width=480,height=480)  

##Create a Plot1 
hist(josival$Global_active_power, col = "red", ylab = "Frequency", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power ")

##close
dev.off()
