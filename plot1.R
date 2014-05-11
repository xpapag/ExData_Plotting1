##set the workiing directory in the folder where the data resides 
## store the scripts in the same dir with the data -- scripts expect to find the data in the same dir

####plot1

#-- download and read the data as a txt file
epc <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

##subset the data
lines <- which (epc$Date  %in% c('1/2/2007','2/2/2007'))
dataToWork <- epc[lines, ]

## plot and save the graph as a png file
png(filename = "./plot1.png", width = 480, height = 480)
hist(dataToWork$Global_active_power, col="red", ylab="Frequency", 
     xlab="Global Active Power (kilowatts)", main="Global Active Power" )

## close the device
dev.off()

