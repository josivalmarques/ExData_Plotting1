
##read in the data
josival <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, 
                      sep = ";", colClasses="character",
                      col.names = colnames(read.table("household_power_consumption.txt",
                                                      nrow = 1, header = TRUE, sep=";")))
##put NA 
josival[josival == "?"] = NA


##Convert the column "Date"
josival$Date <- as.Date(josival$Date, "%d/%m/%Y")


##Select the data of the date: 2007-02-01
subdata1 <- josival[(josival$Date == as.Date("2007-02-01")),]

##Select the data of the date: 2007-02-02
subdata2 <- josival[(josival$Date == as.Date("2007-02-02")),]

##Merge the vectors subdata1 and subdata2 per Columns
subdata3 <- rbind(subdata1,subdata2)

##concatenate the columns: Date and Time in a new column called: Datetime
subdata3$Datetime <- strptime(paste(subdata3$Date, subdata3$Time), "%Y-%m-%d %H:%M:%S")

##Open png device
png(filename="plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))
##------------------------ Plot 1 ------------------------ 
plot(subdata3$Datetime, subdata3$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

## ------------------------ Plot 2 ------------------------ 
plot(subdata3$Datetime, subdata3$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

##------------------------ Plot 3 ------------------------ 
plot(subdata3$Datetime, subdata3$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")

points(subdata3$Datetime, subdata3$Sub_metering_2, type = "l", xlab = "", ylab = "Sub_metering_2", col = "red")

points(subdata3$Datetime, subdata3$Sub_metering_3, type = "l", xlab = "", ylab = "Sub_metering_3", col = "blue")
## legends 
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", )

## ------------------------ Plot 4 ------------------------ 
plot(subdata3$Datetime, subdata3$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", ylim = c(0, 0.5))
##Close 
dev.off()