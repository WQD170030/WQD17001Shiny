library(tidyr)

#Federal Government Revenue Data
#read the data file & load to data frame
FedGovRev19702017DF <- read.csv("Fed Gov Revenue 1970-2017.csv")

#check the data file
names(FedGovRev19702017DF)
dim(FedGovRev19702017DF)
head(FedGovRev19702017DF)

#initial data frame was Entry, Year 1, Year 2, ..., Year N
#tidy up the data file so it goes to the right structure, i.e. Entry, Year, Value
Tidy_FedGovRev19702017DF <- gather(FedGovRev19702017DF, "Year", "Value", 3:49)

#Do the following pre processing
#1. Remove X from the Year column
#2. Substitute - with 0
#3. Change the Year column to factor
#4. Change the Value column to numeric
#5. Change NA Value to 0

Tidy_FedGovRev19702017DF$Year <- gsub('X','',Tidy_FedGovRev19702017DF$Year)
Tidy_FedGovRev19702017DF$Value <- gsub('-','0',Tidy_FedGovRev19702017DF$Value)
Tidy_FedGovRev19702017DF <- transform(Tidy_FedGovRev19702017DF, Year = as.factor(Year))
Tidy_FedGovRev19702017DF <- transform(Tidy_FedGovRev19702017DF, Value = as.numeric(Value))
Tidy_FedGovRev19702017DF$Value[is.na(Tidy_FedGovRev19702017DF$Value)] <- 0

#check data is now in right format
head(Tidy_FedGovRev19702017DF)
sapply(Tidy_FedGovRev19702017DF, class)

#write the tidy data to a csv file
write.csv(Tidy_FedGovRev19702017DF, "Tidy_FedGovRev.csv", row.names = FALSE)

#We will do the same data cleaning steps for the data file for devex & opex