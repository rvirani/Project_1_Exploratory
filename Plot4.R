# Assignment 1   (Plot 4)
# Date: December 08, 2015


# Load data
df.plot4<-read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
str(df.plot4)
head(df.plot4, n=3)

# Subset data to include only dates: 2007-02-01 and 2007-02-02 ####################

# Convert date using as.Date
df.plot4$Date<-as.Date(df.plot4$Date, format="%d/%m/%Y")

# Find all instances of observations spanning dates required
df.plot4<-df.plot4[df.plot4$Date>="2007-02-01" & df.plot4$Date <= "2007-02-02",]

# Now use Time to plot continous graph 
df.plot4$DateTime<-strptime(paste(df.plot4$Date,df.plot4$Time), format="%Y-%m-%d %H:%M:%S")


# Plotting graph function
graph_me<-function(x=df.plot4, y=df.plot4$DateTime){
  
  par(mfrow=c(2,2), mar=c(5,5,1,1))
  
  #Table 1
  plot(df.plot4$DateTime, df.plot4$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", axes=TRUE, xaxt="s")
  #Table 2
  plot(df.plot4$DateTime, df.plot4$Voltage, type="l", xlab="datetime", ylab="Voltage", axes=TRUE, xaxt="s")
  #Table 3
  plot(y, x$Sub_metering_1, type="l", xlab="", ylab="Energy Sub-Metering (kilowatts)", axes=TRUE, xaxt="s")
  lines(y, x$Sub_metering_2, col="Red")
  lines(y, x$Sub_metering_3, col="Blue")
  legend("topright", lwd=1, lty=c(1,1,1), cex=0.5, col=c("Black", "Red", "Blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  #Table 4
  plot(df.plot4$DateTime, df.plot4$Global_reactive_power, type="l", xlab="datetime", ylab="Global Re-Active Power (kilowatts)",axes=TRUE, xaxt="s" )
}

# Saving graph as PNG file
save_me<-function(fileName="Plot4.png", width=480, height=480){
  library(grDevices)
  png(filename=fileName, width=width, height=height)
  graph_me()
  dev.off()
}


# Print out to screen
graph_me()

# Save as PNG file
save_me()



