
##set the workiing directory in the folder where the data resides 
## store the scripts in the same dir with the data -- scripts expect to find the data in the same dir

####plot4

#-- download and read the data as a txt file
epc <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

##subset the data
lines <- which (epc$Date  %in% c('1/2/2007','2/2/2007'))
d2 <- epc[lines, ]

## prepare the graphics device 
png(filename = "./plot4.png", width = 480, height = 480)

#set the window to host four graphs
par(mfrow=c(2,2))

##plot the first graph
plot(d2$Global_active_power, xaxt="n", type = "l", ylab="Global Active Power", xlab="")
axis(1, at = c(1, 1440, 2880),
     labels = c("Thu", "Fri", "Sat"),las = 1)

##plot the second graph
plot(d2$Voltage, xaxt="n", type = "l", ylab="Voltage", xlab="datetime")
axis(1, at = c(1, 1440, 2880),
     labels = c("Thu", "Fri", "Sat"),las = 1)

##plot the third graph
with (d2,
{  
plot(Sub_metering_1, ylim=range(Sub_metering_1,Sub_metering_2,Sub_metering_3), xaxt="n", type = "l", ylab="Energy sub metering", xlab="")
lines(Sub_metering_2, col="red")
lines(Sub_metering_3, col="blue")
axis(1, at = c(1, 1440, 2880),labels = c("Thu", "Fri", "Sat"),las = 1)
legend("topright", lty=c(1,1), # gives the legend appropriate symbols (lines)
       col=c("black", "red","blue"), 
       lwd=c(1.5,1.5,1.5),
       cex=.7, 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})

##plot the fourth graph
plot(d2$Global_reactive_power, xaxt="n", type = "l", ylab="Global_reactive_power", xlab="datetime")
axis(1, at = c(1, 1440, 2880),
     labels = c("Thu", "Fri", "Sat"),las = 1)

#close the device
dev.off()

