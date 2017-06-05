PM25data <- readRDS("summarySCC_PM25.rds")
Baltimore_PM25data <- subset(PM25data, fips == "24510")
str(Baltimore_PM25data)

emission_BC_byyear <- tapply(Baltimore_PM25data$Emissions, Baltimore_PM25data$year, sum, na.rm=TRUE)

plot(names(emission_BC_byyear), emission_BC_byyear, xlab = "Year", ylab = expression("Total PM"[2.5] * " Emissions in Baltimore City"), pch=19)
lines(names(emission_BC_byyear), emission_BC_byyear)

dev.copy(png, file = "plot2.png")
dev.off()