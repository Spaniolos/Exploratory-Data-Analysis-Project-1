#Preproccesing of data
data <- read.table("~/Coursera/household_power_consumption.txt",header = T, sep = ";",as.is=T,na.strings = "?")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- data[data$Date == '2007-02-01' | data$Date == '2007-02-02',]
for(i in 3:9) data[,i] <- as.numeric(data[,i])

#plot 4
png("plot4.png")
par(mfrow=c(2,2))
with(data,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),
               Global_active_power,type='l',xlab="",
               ylab = 'Global Active Power (kilowatts)'))
with(data,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Voltage,
               type='l',xlab='datetime',ylab='Voltage'))
with(data,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_1,type='l',xlab="",ylab = 'Energy sub metering'))
with(data,lines(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_2,col='red'))
with(data,lines(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_3,col='blue'))
legend("topright",legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lwd=1)
with(data,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),
               Global_reactive_power,type='l',xlab='datetime'))
dev.off()
