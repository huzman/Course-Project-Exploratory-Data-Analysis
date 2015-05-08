#Course Project 1 for Exploratory Data Analysis at Coursera


# read in dataset

dataset <- read.table("household_power_consumption.txt", na.strings="?", header=TRUE, sep=";")

dataset_sub <- dataset[dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007",]



#clean up column names
cols <- c("Date", "Time", "GlobalActivePower", "GlobalReactivePower", "Voltage", "GlobalIntensity", "SubMetering1", "SubMetering2", "SubMetering3")
colnames(dataset_sub) <- cols
#convert date and time
format(Sys.time(), "%d/%m/%y %H:%M:%S")
date <- dataset_sub$Date
time <- dataset_sub$Time
dateTime <- paste(dataset_sub$Date, dataset_sub$Time)
dataset_sub$DateTime <- strptime(dateTime, "%d/%m/%Y %H:%M:%S")


#plot 4
png(filename="plot4.png", width=480, height=480, units = "px")
par(mfrow=c(2,2))
plot(dataset_sub$DateTime, dataset_sub$GlobalActivePower, type="l", ylab="Global Active Power", xlab="")
plot(dataset_sub$DateTime, dataset_sub$Voltage, type="l", ylab="Voltage", xlab="datetime")
plot(dataset_sub$DateTime, dataset_sub$SubMetering1, type="l", ylab="Energy sub metering", xlab="", ylim=c(0,theMax))
par(new=T)
plot(dataset_sub$DateTime, dataset_sub$SubMetering2, type="l", ylab="Energy sub metering", xlab="", col="red", ylim=c(0,theMax))
par(new=T)
plot(dataset_sub$DateTime, dataset_sub$SubMetering3, type="l", ylab="Energy sub metering", xlab="", col="blue", ylim=c(0,theMax))
legend("topright", bty="n", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1)
plot(dataset_sub$DateTime, dataset_sub$GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()