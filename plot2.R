##set the workiing directory in the folder where the data resides 
## store the scripts in the same dir with the data -- scripts expect to find the data in the same dir

####plot2

#-- download and read the data as a txt file
epc <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

##subset the data
lines <- which (epc$Date  %in% c('1/2/2007','2/2/2007'))
d2 <- epc[lines, ]

#-- get the needed data vector
d2power <- d2$Global_active_power

## plot and save the graph as a png file
png(filename = "./plot2.png", width = 480, height = 480)
plot(d2power, xaxt="n", type = "l", ylab="Global Active Power (kilowatts)", xlab="")
axis(1, at = c(1, 1440, 2880),
        labels = c("Thu", "Fri", "Sat"),las = 1)

##close the device
dev.off()

