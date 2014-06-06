# plot2.R a time series plot


setwd("D:/R_school/coursera/eda/proj1/ExData_Plotting1")
# read data file
data <- read.table("../household_power_consumption.txt", sep = ";", header=TRUE, na.string = "?",colClasses = "character")
pt <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
subdat <- subset(data, pt>=strptime(20070201,format="%Y%m%d")& pt<=strptime(20070203,format="%Y%m%d"))
pt_sub <- strptime(paste(subdat$Date,subdat$Time),"%d/%m/%Y %H:%M:%S")

#transperent background
par(bg=NA)
#set to us convention
Sys.setlocale("LC_TIME","us")
plot(pt_sub,as.numeric(subdat$Global_active_power), ylab="Global Active Power (kilowatts)", xlab="", type="l")

#copy to png
dev.copy(png, "./figure/plot2.png", width=480, height=480)
dev.off()
