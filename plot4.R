PM25data <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
str(SCC)

SCC_coal <- SCC[grep(".[Cc]omb.*[Cc]oal|[Cc]oal*.[Cc]omb.", SCC$EI.Sector), ]["SCC"]
##create a SCC index which will be used for subsetting PM25data
PM25data_coal <- PM25data[PM25data$SCC %in% SCC_coal$SCC, ]
##subset coal related emissions

emission_coalbyyear <- tapply(PM25data_coal$Emissions, PM25data_coal$year, sum, na.rm=TRUE)

plot(names(emission_coalbyyear), emission_coalbyyear/1000, xlab = "Year", ylab = expression("Total PM"[2.5] * " Emissions from Coal Combustion-related Sources (in '000 tons)"), pch=19)
lines(names(emission_coalbyyear), emission_coalbyyear/1000)

dev.copy(png, file = "plot4.png")
dev.off()

