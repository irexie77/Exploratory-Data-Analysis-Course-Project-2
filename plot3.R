## Question #3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.


# working directory where files are stored. NOTE: This is my working directory.
setwd("C:\\Users\\Ivy\\Google Drive\\DATA SCIENCE!!\\MODULE 4\\Week4")

# changing the margin (since I get error)
par(mar=c(5,5,2,2))


library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


NEIsub <- subset(NEI, fips == "24510")
baltAggre <- aggregate(NEIsub[c("Emissions")], list(type = NEIsub$type, year = NEIsub$year), sum)



png("plot3.png",width=550,height=450)


qplot(year, Emissions, data = baltAggre, color = type, geom= "line")+ ggtitle("Total PM2.5 Emissions in Baltimore City by Source Type") + xlab("Year") + ylab("PM2.5 Emissions")   


dev.off()