PM25data <- readRDS("summarySCC_PM25.rds")
PM25data_BC_vehicle <- subset(PM25data, fips == "24510" & type == "ON-ROAD")
##use type ON-ROAD to define motor vehicle source

PM25data_BC_vehicle_totalbyyear <- tapply(PM25data_BC_vehicle$Emissions, PM25data_BC_vehicle$year, sum, na.rm=TRUE)

plot(names(PM25data_BC_vehicle_totalbyyear), PM25data_BC_vehicle_totalbyyear, xlab = "Year", ylab = "Total Emissions from Motor Vehicle Sources in Baltimore City", pch=19)
lines(names(PM25data_BC_vehicle_totalbyyear), PM25data_BC_vehicle_totalbyyear)

dev.copy(png, file = "plot5.png")
dev.off()
