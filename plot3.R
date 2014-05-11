##set the workiing directory in the folder where the data resides 
## store the scripts in the same dir with the data -- scripts expect to find the data in the same dir

####plot3

#-- download and read the data as a txt file
epc <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

##subset the data
lines <- which (epc$Date  %in% c('1/2/2007','2/2/2007'))
d2 <- epc[lines, ]

## plot and save the graph as a png file
png(filename = "./plot3.png", width = 480, height = 480)
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

## close the device
dev.off()

