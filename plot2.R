#Read in data
powerConsumption = read.table("household_power_consumption.txt",header = TRUE,sep = ";", stringsAsFactors = FALSE)
#Convert date to date type
powerConsumption$Date = as.Date(strptime(powerConsumption$Date, "%d/%m/%Y"))
#Subset to 2007-02-01 and 2007-02-02
plotData = subset(powerConsumption, Date <= "2007-02-02" & Date >= "2007-02-01")
#Convert Global_active_power variable to numeric type
plotData$Global_active_power = as.numeric(plotData$Global_active_power)
#Add datetime variable using Date and Time and convert to datetime format
plotData$datetime = paste(plotData$Date, plotData$Time, sep=" ")
plotData$datetime = strptime(plotData$datetime, "%Y-%m-%d %H:%M:%S")
#plotting
par(ps="12") #set font size
with(plotData,plot(datetime,Global_active_power, type="l",ylab="Global Active Power (kilowatts)", xlab=""))
#Save to PNG
dev.copy(png,file="plot2.png",width=480,height=480,unit="px")
dev.off()
