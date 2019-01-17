#Load the data
data<-read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")

#Convert the date variable to Date class
data$Date<-as.Date(data$Date, format="%d/%m/%Y")

#Subset the data
subdata<-subset(data, subset=(Date>="2007-02-01" & Date<="2007-02-02"))

#Convert dates and times
subdata$datetime<-strptime(paste(subdata$Date, subdata$Time), "%Y-%m-%d %H:%M:%S")

#Plot 1
attach(subdata)
hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)",col="Red")

#Save png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()