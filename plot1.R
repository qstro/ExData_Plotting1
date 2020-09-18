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

# Change class of Date and Time
household_data$Date <- as.Date(household_data$Date, "%d/%m/%Y")

# subset to required dates
household_data_subset <- subset(household_data, Date == "2007-02-01" |  Date == "2007-02-02")

# Plot 1: Histogram of global active power
hist(household_data_subset$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Save as .png
dev.copy(png,'plot1.png', width=480, height=480)
dev.off()
