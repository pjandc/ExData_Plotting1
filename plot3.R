#Read in data
powerConsumption = read.table("household_power_consumption.txt",header = TRUE,sep = ";", stringsAsFactors = FALSE)
#Convert date to date type
powerConsumption$Date = as.Date(strptime(powerConsumption$Date, "%d/%m/%Y"))
#Subset to 2007-02-01 and 2007-02-02
plotData = subset(powerConsumption, Date <= "2007-02-02" & Date >= "2007-02-01")
#Add datetime variable using Date and Time and convert to datetime format
plotData$datetime = paste(plotData$Date, plotData$Time, sep=" ")
plotData$datetime = strptime(plotData$datetime, "%Y-%m-%d %H:%M:%S")
#Convert submetering variables to numeric type
plotData$Sub_metering_1 = as.numeric(plotData$Sub_metering_1)
plotData$Sub_metering_2 = as.numeric(plotData$Sub_metering_2)
plotData$Sub_metering_3 = as.numeric(plotData$Sub_metering_3)
#plotting
par(ps="12") #set font size
par(bg="transparent") #set background to transparent
png("plot3.png",width=480,height=480,unit="px")
with(plotData, plot(datetime,Sub_metering_1,type = "n",ylab="Energy sub metering", xlab=""))
with(plotData, lines(datetime, Sub_metering_1,col="black"))
with(plotData, lines(datetime, Sub_metering_2,col="red"))
with(plotData, lines(datetime, Sub_metering_3,col="blue"))
legend("topright",col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1))
dev.off()

