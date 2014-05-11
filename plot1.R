
#Plot1: Global Active Power Histogram (Freqeuncy)
setwd("C:\\Users\\daisywa\\SkyDrive\\Data Science\\Exploratory Data Analysis\\Week1")

#1. read in flat file
DT <- read.table("./household_power_consumption.txt", 
                 header = TRUE,
                 sep=";",
                 na.strings="?"
                 )
#2. convert factors to date format
DT$DateTime <- strptime(paste(DT$Date,DT$Time),format="%d/%m/%Y %H:%M:%S") 
DT$Date1<- as.Date(DT$Date, format = "%d/%m/%Y")

#3. subset data
Sub.DT <- subset(DT, 
                    (Date1 >= as.Date('2007-02-01')) 
                   &    
                    (Date1 <= as.Date('2007-02-02'))
)

#str(Sub.DT)

#4. export histogram to .png 
png(filename = "plot1.png",
   width = 480, height = 480, units = "px",
   bg = "white")
                 
hist(Sub.DT$Global_active_power,
     col = "red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")             

#dev.copy(png, file = "plot1.png", width = )
dev.off()
