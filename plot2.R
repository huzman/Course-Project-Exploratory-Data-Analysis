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


#plot 2
png(filename="plot2.png", width=480, height=480, units = "px")
plot(dataset_sub$DateTime, dataset_sub$GlobalActivePower, ylab="GlobalActivePower (kilowatts)", xlab="", type="l")
dev.off()