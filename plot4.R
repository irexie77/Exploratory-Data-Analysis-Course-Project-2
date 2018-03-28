## Question #4. Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?


# working directory where files are stored. NOTE: This is my working directory.
setwd("C:\\Users\\Ivy\\Google Drive\\DATA SCIENCE!!\\MODULE 4\\Week4")

# changing the margin (since I get error)
par(mar=c(5,5,2,2))


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC.sub <- SCC[grepl("Coal" , SCC$Short.Name), ]
NEI.sub <- NEI[NEI$SCC %in% SCC.sub$SCC, ]


png("plot4.png",width=580,height=450,units="px",bg="transparent")


plot4 <- ggplot(NEI.sub, aes(x = factor(year), y = Emissions, fill =type)) + geom_bar(stat= "identity", width = .4) + xlab("year") +ylab("Coal-Related PM2.5 Emissions") + ggtitle("Total Coal-Related PM2.5 Emissions")
print(plot4)

dev.off()

