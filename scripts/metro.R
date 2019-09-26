library(tidyverse)
bom_data <- read_csv("data/BOM_data.csv")
bom_data
bom_st <- read_csv("data/BOM_stations.csv")
bom_st

# Challenge: Putting it all together

# Question 1 (Sept 25)
# For each station, how many days have a minimum temperature, 
# a maximum temperature and 
# a rainfall measurement recorded

# sep the min/max column
bom_sep <- separate(bom_data, col = Temp_min_max, into = c("min", "max"), sep = "/") 


# filter to include only stations with data for min/max/Rainfall data
bom_sep %>% 
  filter(min != "-", max !="-", Rainfall !="-")

# assign a new talbe to data and count the number of station
Data_count_ofMinMaxRainfall <- bom_sep %>%
  count(Station_number)

count(Data_count_ofMinMaxRainfall) # counting the number of row for stations with data

Bom_sumStation <- bom_sep %>% 
  group_by(Station_number)

count(Bom_sumStation)




# Question 2  Which month saw the lowest average daily temperature difference? (Sept 26)

Bom_Diff <- bom_sep %>% 
  mutate (min = as.numeric(min)) %>% 
  mutate (max = as.numeric(max)) %>% 
  mutate (Rainfall = as.numeric(Rainfall)) %>% 
  mutate(temp_diff =min - max) %>% 
  filter (temp_diff != "NA")
  
Bom_Diff %>% 
  arrange(desc(temp_diff)) %>% 
  filter(temp_diff <0)

 

  

         