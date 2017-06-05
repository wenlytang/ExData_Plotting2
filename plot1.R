PM25data <- readRDS("summarySCC_PM25.rds")
str(PM25data)

emission_byyear <- tapply(PM25data$Emissions, PM25data$year, sum, na.rm=TRUE)

plot(names(emission_byyear), emission_byyear/1000, xlab = "Year", ylab = expression("Total PM"[2.5] * " Emissions (in '000 tons)"), pch=19)
lines(names(emission_byyear), emission_byyear/1000)

dev.copy(png, file = "plot1.png")
dev.off()
