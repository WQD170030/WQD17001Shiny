library(dplyr)
fedgovrev <- read.csv(file="Tidy_FedGovRev.csv", header = TRUE, sep = ",")
fedgovdevex <- read.csv(file="Tidy_FedGovDevex.csv", header = TRUE, sep = ",")
fedgovopex <- read.csv(file="Tidy_FedGovOpex.csv", header = TRUE, sep = ",")

fedgovrevtype <- fedgovrev %>% 
  group_by(Type, Year) %>% 
  summarise(Value = sum(Value))

fedgovdevextype <- fedgovdevex %>% 
  group_by(Type, Year) %>% 
  summarise(Value = sum(Value))


fedgovopextype <- fedgovopex %>% 
  group_by(Type, Year) %>% 
  summarise(Value = sum(Value))
