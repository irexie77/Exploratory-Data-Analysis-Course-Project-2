## Question #1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.


# working directory where files are stored. NOTE: This is my working directory.
setwd("C:\\Users\\Ivy\\Google Drive\\DATA SCIENCE!!\\MODULE 4\\Week4")

# changing the margin (since I get error)
par(mar=c(5,5,2,2))


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

data <- with(NEI, aggregate(Emissions, by = list(year), sum))

png("plot1.png",width=480,height=480)


plot(data, type = "o", main = "Total PM2.5 Emissions", xlab = "Year", 
     ylab = "PM2.5 Emissions", pch = 19, col = "darkblue", lty = 6)

dev.off()