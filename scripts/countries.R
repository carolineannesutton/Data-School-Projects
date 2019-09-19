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
min(storms$category)       
glimps(storms)
glimpse(storms)
storms
summary(storms)

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