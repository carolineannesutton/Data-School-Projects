library(tidyverse)
bom_data <- read_csv("data/BOM_data.csv")
bom_data
bom_st <- read_csv("data/BOM_stations.csv")
bom_st

#Challenge 
# For each station, how many days have a minimum temperature, 
#a maximum temperature and 
# a rainfall measurement recorded

bom_sep <- separate(bom_data, col = Temp_min_max, into = c("min", "max"), sep = "/") # sep the min/max column

bom_sep %>% 
  filter(min != "-", max !="-", Rainfall !="-")# filter to include only stations with data for min/max/Rainfall data

Data_count_ofMinMaxRainfall <- bom_sep %>%
  count(Station_number)
rm(Data_count)  



