# Assignment 1   (Plot 3)
# Date: December 08, 2015


# Load data
df.plot3<-read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
str(df.plot3)
head(df.plot3, n=3)

# Subset data to include only dates: 2007-02-01 and 2007-02-02 ####################

# Convert date using as.Date
df.plot3$Date<-as.Date(df.plot3$Date, format="%d/%m/%Y")

# Find all instances of observations spanning dates required
df.plot3<-df.plot3[df.plot3$Date>="2007-02-01" & df.plot3$Date <= "2007-02-02",]

# Now use Time to plot continous graph 
df.plot3$DateTime<-strptime(paste(df.plot3$Date,df.plot3$Time), format="%Y-%m-%d %H:%M:%S")


# Plotting graph function
graph_me<-function(x=df.plot3, y=df.plot3$DateTime){
  
   plot(y, x$Sub_metering_1, type="l", xlab="", ylab="Energy Sub-Metering (kilowatts)", xaxt="s")
  lines(y, x$Sub_metering_2, col="Red")
  lines(y, x$Sub_metering_3, col="Blue")
  legend("topright", lwd=3, col=c("Black", "Red", "Blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
}

# Saving graph as PNG file
save_me<-function(fileName="Plot3.png", width=480, height=480){
  library(grDevices)
  png(filename=fileName, width=width, height=height)
  graph_me()
  dev.off()
}


# Print out to screen
graph_me()

# Save as PNG file
save_me()



