#Preproccesing of data
data <- read.table("~/Coursera/household_power_consumption.txt",header = T, sep = ";",as.is=T,na.strings = "?")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- data[data$Date == '2007-02-01' | data$Date == '2007-02-02',]
for(i in 3:9) data[,i] <- as.numeric(data[,i])

#Plot 2
png("plot2.png")
with(data,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Global_active_power,type='l',xlab="",ylab = 'Global Active Power (kilowatts)'))
dev.off()