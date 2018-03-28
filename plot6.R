## Question #6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?


# working directory where files are stored. NOTE: This is my working directory.
setwd("C:\\Users\\Ivy\\Google Drive\\DATA SCIENCE!!\\MODULE 4\\Week4")

# changing the margin (since I get error)
par(mar=c(5,5,2,2))


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI.sub <- subset(NEI, fips == "24510" & type=="ON-ROAD")
balt.aggre <- aggregate(NEI.sub[c("Emissions")], list(type = NEI.sub$type, year = NEI.sub$year, zip = NEI.sub$fips), sum)


NEI.sub2 <- subset(NEI, fips == "06037" & type=="ON-ROAD")
LA.aggre <- aggregate(NEI.sub2[c("Emissions")], list(type = NEI.sub2$type, year = NEI.sub2$year, zip = NEI.sub2$fips), sum)


bind.LA.balt <- rbind(balt.aggre, LA.aggre)


png("plot6.png",width=580,height=450,units="px",bg="transparent")

qplot(year, Emissions, data = bind.LA.balt, color = zip, geom= "line", ylim = c(-100, 5500)) + ggtitle("Motor Vehicle Emissions in Baltimore (24510) \nvs. Los Angeles (06037) Counties") + xlab("Year") + ylab("Emission Levels")  



dev.off()