PM25data <- readRDS("summarySCC_PM25.rds")
PM25data_BC_LA <- subset(PM25data, fips == "24510" | fips == "06037")
PM25data_BC_LA <- subset(PM25data_BC_LA, type == "ON-ROAD")

PM25data_BC_LA_bycountyandyear <- aggregate(Emissions ~ fips + year, data = PM25data_BC_LA, sum)
PM25data_BC_LA_bycountyandyear$county.name <- ifelse(PM25data_BC_LA_bycountyandyear$fips == "24510", "Baltimore City", "Los Angeles")

ggplot(aes(x=year, y=Emissions, color=county.name), data = PM25data_BC_LA_bycountyandyear)+geom_point()+geom_line(lwd=1)+labs(x="Year", y=expression("Total PM"[2.5] * " Emissions"))+facet_grid(.~county.name)

dev.copy(png, file = "plot6.png")
dev.off()