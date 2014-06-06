# plot3.R a time series plot


setwd("D:/R_school/coursera/eda/proj1/ExData_Plotting1")
# read data file
data <- read.table("../household_power_consumption.txt", sep = ";", header=TRUE, na.string = "?",colClasses = "character")
pt <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
subdat <- subset(data, pt>=strptime(20070201,format="%Y%m%d")& pt<=strptime(20070203,format="%Y%m%d"))
pt_sub <- strptime(paste(subdat$Date,subdat$Time),"%d/%m/%Y %H:%M:%S")

#transperent background
par(bg=NA, cex=1)
#set to us convention
Sys.setlocale("LC_TIME","us")
plot(pt_sub,as.numeric(subdat$Sub_metering_1), ylab="Energy sub metering", xlab="", type="n")
lines(pt_sub,as.numeric(subdat$Sub_metering_1))
lines(pt_sub,as.numeric(subdat$Sub_metering_2), col="red")
lines(pt_sub,as.numeric(subdat$Sub_metering_3), col = "blue")

#legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col = c("black","red","blue"),cex=0.7) 

#copy to png
dev.copy(png, "./figure/plot3.png", width=480, height=480)
dev.off()

