library("tidyverse") #must load tidyverse with each new script project

read_csv("data/gapminder.csv") # must read in datafile make sure you tell it the location

gapminder <- read_csv("data/gapminder.csv")  # create a variable for the data set so you can refer to the whole dataset each time

# ask about the dataset
nrow(gapminder)
 ncol(gapminder)
 colnames(gapminder)
 glimpse(gapminder)
 
 storms
glimpse(storms) 
colnames(storms)
unique(storms$name)
unique(storms$year)
gapminder

min(storms$category)       
glimps(storms)
glimpse(storms)
storms
select(gapminder, country,year)
summary(storms)
select(country, year pop)

unqiue(storms$category)


read_csv("data/gapminder")
gapminder <- read_csv(data/gapminder.csv)

select(gapminder, year, country, pop) #creates a new dataframe with the subset of columns

just_population <-  select(gapminder, year, country, pop)

select(gapminder, 3, 1, 5)
select(gapminder, 3:5)
select (gapminder, -lifeExp, pop)
select( gapminder, year:pop)
just_population
select (gapminder, -(year:lifeExp))


select (gapminder, country)
just_population - pop, country)
select(gapminder,3)
select(just_population,3)
select(gapminder, 1, 3, 5:6)
select(gapminder, -2,-4)
select(gapminder, -continent, -lifeExp)
select (gapminder, country, year, pop, gdpPercap)

select(gapminder, starts_with("co"))
select (gapminder, co*)
select (gapminder, contains("e"))
select (gapminder"co*")
select (gapminder,ends_with("p"))
select (gapminder, matches("c."))



select (gapminder, population = pop, country)
rename (gapminder, population = pop)
gapminder

filter (gapminder, country == "Australia")
filter (gapminder, year >=1997)

filter (gapminder, lifeExp >=80)
filter (gapminder, continent =="Europe", gdpPercap>=30000)
filter (gapminder, lifeExp >=80| gdpPercap>=30000)
filter(gapminder,continent %in% c())

select (gapminder, pop)


Australia <- filter (gapminder, country =="Australia")
Australia <- select(Australia, country, year, pop)
rm(Australian)

Australian <- select(filter(gapminder, country=="Australia"),country,year,pop)

Oz <- filter(select(gapminder, country, year, pop),country=="Australia")


#pipe data = %>%

gapminder %>% select(year,pop)

filter(gapminder, country == "Australia", year >=1970)

small <- gapminder %>% 
        filter(country=="Australia", year>=1997)
smal                     
smallAustralian <- select(filter(gapminder, country=="Australia"),country,year,pop)

Aust <- gapminder %>%
        filter(country == "Australia") %>%
        select (country, year, pop) %>%
        rename (population = pop) %>%
        filter(year >= 1960)
Aust
rm Aust
rm(Aust)
rm (Australian)

with_gdp <-  mutate(gapminder, gdp = gdpPercap * pop)
with_gdp

mutate(gapminder, pop_M = pop/1000000)

mutate(gapminder, log_of_pop = log(pop))


str_sub("A long bit of text", start = 1, end = 5)       


mutate(gapminder, country_abbr = str_sub(country, start = 1, end = 3))


mutate(gapminder, country_name_length = str_length(country))

mutate(gapminder, gdp = gdpPercap * pop, log_of_pop = log(pop))
mutate(
        gapminder, 
        gdp = gdpPercap * pop,
        log_of_gdp = log(gdp)
)


mutate(
        gapminder,
        lifeExp_days =lifeExp * 365,
        gdp_B = gdpPercap * pop / 1e9
)


# SUMMARISING  Data

summarise(gapminder, mean_life_exp = mean(lifeExp))

summarise (
        gapminder,
        mean_life_exp = mean(lifeExp),
        sd_life_exp = sd(lifeExp), 
        biggest_gdp = max(gdpPercap)
        
)


summarise(
        gapminder,
        mean_pop = mean(pop),
        median_pop = median (pop)
)

# summarise by every column that has numberic values

summarise_if(gapminder, is.numeric, mean)

# summarise by groups - must create a group first

By_Country <- group_by (gapminder,country)

summarise_if (By_Country, is.numeric, mean)

by_continent <- group_by(gapminder, continent)

summarise(
        by_continent,
        mean_pop = mean(pop),
        median_pop = median (pop)
)


gapminder %>%
        group_by(continent) %>% 
        summarise (mean_pop = mean(pop),median_pop = median (pop))
    
#Arrange

arrange(gapminder, gdpPercap) #assending
arrange(gapminder, desc(gdpPercap)) #descending

summarised_gdp <- gapminder %>% 
        group_by(year) %>% 
        summarise(mean_gdp_per_cap = mean(gdpPercap))

gapminder %>%  # fet teh gapminder data
        group_by(country) %>%  #group the data by country
        summarise(average_lifeExp = mean(lifeExp), average_gdpPercap = mean(gdpPercap) ) %>% # calculate the summary data
        arrange (desc(average_lifeExp)) %>%  #arrange data in descending order of avearge_lifeExp
        filter(average_lifeExp == min(average_lifeExp) | average_lifeExp == max(average_lifeExp))


#Coutning Data

summarise(gapminder, num_rows = n()) # number rows in the dataset "gapminder"

counts_country <- summarise(by_country, num_rows = n())       

summarise(by_continent, num_rows = n())
counts_country
view(counts_country)

#two list 1987 and 2007 
# top 10 countties for life expectancy

gapminder %>%
        group_by(country)

#Read in an excel file

read_excel("data/gapminder.xlsx") # must load the read excel package called "read excel"

library(readxl)
                  
  
gapminder_excel <-  read_excel("data/gapminder.xlsx")              

read_excel("data/gapminder.xlsx", range = "A1:E4")       
read_excel("data/gapminder.xlsx", sheet = "gapminder",range = "A1:E4")        


#writing data out

?write_csv() #help for this fuction

write_csv(gapminder_excel, "results/gapminder_output.csv")

view("gapminder_output")

view(gapminder_excel)

View("caroline")

Australian_data <- gapminder %>% 
        filter(country == "Australia")
write_csv(Australian_data, "results/Australian_Data_output")
