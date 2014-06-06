# plot1.R a historgram plot


setwd("D:/R_school/coursera/eda/proj1/ExData_Plotting1")
# read data file
data <- read.table("../household_power_consumption.txt", sep = ";", header=TRUE, na.string = "?",colClasses = "character")
pt <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
subdat <- subset(data, pt>=strptime(20070201,format="%Y%m%d")& pt<=strptime(20070203,format="%Y%m%d"))

#transperent background
par(bg=NA)
#histplot
hist(as.numeric(subdat$Global_active_power),col = "red", xlab="Global Active Power (kilowatts)", main = "Global Active Power")
#copy to png
dev.copy(png, "./figure/plot1.png", width=480, height=480)
dev.off()
