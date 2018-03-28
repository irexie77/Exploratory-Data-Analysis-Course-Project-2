## Question #5. How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?


# working directory where files are stored. NOTE: This is my working directory.
setwd("C:\\Users\\Ivy\\Google Drive\\DATA SCIENCE!!\\MODULE 4\\Week4")

# changing the margin (since I get error)
par(mar=c(5,5,2,2))


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEIsub <- subset(NEI, fips == "24510" & type=="ON-ROAD")
Balt.aggre <- aggregate(NEIsub[c("Emissions")], list(type = NEIsub$type, year = NEIsub$year, zip = NEIsub$fips), sum)


png("plot5.png",width=580,height=450,units="px",bg="transparent")

qplot(year, Emissions, data = Balt.aggre, geom= "line") + theme_gray() + ggtitle("Motor Vehicle-Related Emissions in Baltimore City") + xlab("Year") + ylab("Emission Levels")


dev.off()