# Assignment 1   (Plot 2)
# Date: December 08, 2015


# Load data
df.plot2<-read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
str(df.plot2)
head(df.plot2, n=3)

# Subset data to include only dates: 2007-02-01 and 2007-02-02 ####################

# Convert date using as.Date
df.plot2$Date<-as.Date(df.plot2$Date, format="%d/%m/%Y")

# Find all instances of observations spanning dates required
df.plot2<-df.plot2[df.plot2$Date>="2007-02-01" & df.plot2$Date <= "2007-02-02",]

# Now use Time to plot continous graph 
df.plot2$DateTime<-strptime(paste(df.plot2$Date,df.plot2$Time), format="%Y-%m-%d %H:%M:%S")


# Plotting graph function
graph_me<-function(x=df.plot2$DateTime,y=df.plot2$Global_active_power){
  
  plot(x,y, type="l", xlab="", ylab="Global Active Power (kilowatts)", xaxt="s")
}

# Saving graph as PNG file
save_me<-function(fileName="Plot2.png", width=480, height=480){
  library(grDevices)
  png(filename=fileName, width=width, height=height)
  graph_me()
  dev.off()
}


# Print out to screen
graph_me()

# Save as PNG file
save_me()

