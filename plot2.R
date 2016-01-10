# 04 Exploratory Analysis - Project 1

## 0. Clean up workspace, set local parameters & load libraries

rm(list=ls())
setwd("C:/Users/Rayk/Documents/DataScience/04 Exploratory Analysis/03 Data")


my_lc_time <- Sys.getlocale("LC_TIME")

Sys.setlocale("LC_TIME", "English")



## 1. Download zip file


download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","exdata_data_household_power_consumption.zip"
              ")

## 2. Load txt file , subset date range (2007-02-01 and 2007-02-02)  and convert columns


data <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"),header = TRUE, sep = ";" , na.strings = "?" , nrows = -1)

data$Date <- as.character(data$Date)
data$Time <- as.character(data$Time)





head(data)
head(data.sub)
sapply(data, class)

data$Time <- paste(data$Date, data$Time, sep=" ")
data$Date <- as.Date(data$Date , "%d/%m/%Y")
data$Time <- as.POSIXct(data$Time , "%d/%m/%Y %H:%M:%S", tz="GMT")
data$Time <- strptime(data$Time, "%Y-%m-%d %H:%M:%S",  tz="GMT")


data.sub <- subset(data, Date == "2007-02-01"|Date == "2007-02-02") 

## 3. PNG output

png("plot2.png", width = 480, height = 480)
  plot(data.sub$Time, data.sub$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()



## 99. set back local parameters

Sys.setlocale("LC_TIME", my_lc_time)