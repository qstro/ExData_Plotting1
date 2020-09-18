# Week 1 Project of the Exploratory Data Analysis Course
# Author: qstro (https://github.com/qstro)
# Date: 18.09.2020

# Download the dataset if it does not exist yet
if (!file.exists("project_data.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "project_data.zip")
}

# Unzip the dataset 
unzip("project_data.zip")

# Load Dataset
household_data <- read.table("household_power_consumption.txt", na.strings = "?", header = TRUE, sep = ";")

# Create POSIXct cloumn datetime from Date and Time
household_data$datetime <- as.POSIXct(paste(household_data$Date, household_data$Time), format = "%d/%m/%Y %H:%M:%S")

#subset to required dates
household_data_subset <- subset(household_data, datetime >= "2007-02-01" &  datetime < "2007-02-03")

# Plot 3
plot(household_data_subset$datetime, household_data_subset$Sub_metering_1, type="l"
     , xlab="", ylab="Energy sub metering")
lines(household_data_subset$datetime, household_data_subset$Sub_metering_2
      , col="red")
lines(household_data_subset$datetime, household_data_subset$Sub_metering_3
      , col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

# Save as .png
dev.copy(png,'plot3.png', width=480, height=480)
dev.off()