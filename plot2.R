## Question #2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.


# working directory where files are stored. NOTE: This is my working directory.
setwd("C:\\Users\\Ivy\\Google Drive\\DATA SCIENCE!!\\MODULE 4\\Week4")

# changing the margin (since I get error)
par(mar=c(5,5,2,2))



NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


NEIsub <- subset(NEI, fips == "24510")
BaltCity <- tapply(NEIsub$Emissions, NEIsub$year, sum)


png("plot2.png",width=500,height=480)


plot(BaltCity, type = "o", main = "Total PM2.5 Emissions in Baltimore City", xlab = "Year", ylab = "PM2.5 Emissions", pch = 18, col = "firebrick1", lty = 5)

dev.off()