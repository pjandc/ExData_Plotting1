#Read in data
powerConsumption = read.table("household_power_consumption.txt",header = TRUE,sep = ";", stringsAsFactors = FALSE)
#Convert date to date type
powerConsumption$Date = as.Date(strptime(powerConsumption$Date, "%d/%m/%Y"))
#Subset to 2007-02-01 and 2007-02-02
plotData = subset(powerConsumption, Date <= "2007-02-02" & Date >= "2007-02-01")
#Convert Global_active_power variable to numeric type
plotData$Global_active_power = as.numeric(plotData$Global_active_power)
#plotting
par(ps="12")
with(plotData, hist(Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)"))
#save to PNG file
dev.copy(png,file="plot1.png",width=480,height=480,unit="px")
dev.off()

