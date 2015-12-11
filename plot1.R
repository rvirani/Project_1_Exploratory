# Assignment 1   (Plot 1)
# Date: December 08, 2015


# Load data
df.plot1<-read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
str(df.plot1)
head(df.plot1, n=3)

# Subset data to include only dates: 2007-02-01 and 2007-02-02 ####################

# Convert date using as.Date
df.plot1$Date<-as.Date(df.plot1$Date, format="%d/%m/%Y")

# Find all instances of observations spanning dates required
df.plot1<-df.plot1[df.plot1$Date>="2007-02-01" & df.plot1$Date <= "2007-02-02",]

str(df.plot1)
# 2880 rows
#    9 cols


# Plotting graph function
graph_me<-function(x=df.plot1$Global_active_power){
  
    hist(x, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="Red")
    axis(2, at=0)
    axis(2, at=200)
    axis(2, at=400)
    axis(2, at=600)
    axis(2, at=800)
    axis(2, at=1000)
    axis(2, at=1200)
    par(mfrow=c(1,1), mar=c(2,4,4,1), oma=c(0,0,2,0))
}

# Saving file to PNG function
save_me<-function(fileName="Plot1.png", width=480, height=480){
  library(grDevices)
  png(filename=fileName, width=width, height=height)
  graph_me()
  dev.off()
}

# Print out to screen
graph_me()

# Save as PNG file
save_me()
















